#!/usr/bin/env python3
import socket
import numpy as np
import time
import matplotlib.pyplot as plt

UDP_IP = "0.0.0.0"
UDP_PORT = 5005

MAX_PACKET_SIZE = 65535
MAX_UDP_SIZE = 1400

BUF_SIZE = 64000000  # bytes
TARGET_COUNT = BUF_SIZE // 4

SOCK_BUF_SIZE = 64000000

ADD_CONST = 0xF   # IP in PL adds this constant

# -------------------------------------------------------------
def verify_data(arr):
    """Verify initial generator data: 0,1,2,3,..."""
    expected = np.arange(TARGET_COUNT, dtype=np.uint32)
    diff = arr != expected
    if not np.any(diff):
        return True, None
    return False, np.argmax(diff)


def verify_processed_data(arr, add_const):
    """Verify processed data: out[i] = i + add_const"""
    expected = (np.arange(TARGET_COUNT, dtype=np.uint32)
                + np.uint32(add_const)) & np.uint32(0xFFFFFFFF)
    diff = arr != expected
    if not np.any(diff):
        return True, None
    return False, np.argmax(diff)


def receive_buffer(sock, target_count, max_packet_size, label=None):
    """
    Receive exactly target_count uint32 values over UDP.
    Detect sender IP from the first packet.
    """
    buf = np.zeros(target_count, dtype=np.uint32)
    idx = 0
    sender_ip = None

    if label:
        print(f"Receiving {label}...")

    while idx < target_count:
        data, addr = sock.recvfrom(max_packet_size)

        if sender_ip is None:
            sender_ip, _ = addr
            print(f"Data source detected: {sender_ip}")

        nums = np.frombuffer(data, dtype="<u4")
        count = min(len(nums), target_count - idx)
        buf[idx:idx + count] = nums[:count]
        idx += count

    return buf, sender_ip


# SOCKET SETUP
recv_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, SOCK_BUF_SIZE)
recv_sock.bind(("0.0.0.0", UDP_PORT))
recv_sock.settimeout(50.0)

print(f"Listening on UDP port {UDP_PORT}...")
print(f"Expecting {TARGET_COUNT} uint32 values...\n")

# 1) RECEIVE INITIAL BUFFER FROM FPGA
buffer, sender_ip = receive_buffer(
    recv_sock,
    TARGET_COUNT,
    MAX_PACKET_SIZE,
    label="INITIAL buffer"
)

print("DONE — received initial buffer from FPGA!")
print("Initial first 5:", buffer[:5])
print("Initial last 5 :", buffer[-5:])

# 2) VERIFICATION OF INITIAL DATA
print("\nVerifying INITIAL data...")
ok, idx = verify_data(buffer)
if not ok:
    raise RuntimeError(
        f"INITIAL verification failed at index {idx}: "
        f"got {buffer[idx]}, expected {idx}"
    )
print("INITIAL verification OK ✅")

# 3) SEND BUFFER BACK TO FPGA
send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
send_sock.setsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF, SOCK_BUF_SIZE)

raw = buffer.tobytes()

print("Sending buffer back to FPGA...")
sent = 0
while sent < BUF_SIZE:
    chunk = raw[sent:sent + MAX_UDP_SIZE]
    send_sock.sendto(chunk, (sender_ip, UDP_PORT))
    sent += len(chunk)
    time.sleep(0.0005)

print("Full buffer sent back to FPGA")

# 4) RECEIVE PROCESSED DATA FROM FPGA
processed, _ = receive_buffer(
    recv_sock,
    TARGET_COUNT,
    MAX_PACKET_SIZE,
    label="PROCESSED buffer"
)

print("DONE — received processed buffer")
print("Processed first 5:", processed[:5])
print("Processed last 5 :", processed[-5:])

# 5) VERIFICATION OF PROCESSED DATA
print(f"\nVerifying PROCESSED data (expected = input + 0x{ADD_CONST:X})...")

ok, bad_idx = verify_processed_data(processed, ADD_CONST)

if ok:
    print("PROCESSED verification OK ✅")
else:
    exp = (bad_idx + ADD_CONST) & 0xFFFFFFFF
    raise RuntimeError(
        f"PROCESSED verification FAILED at index {bad_idx}\n"
        f"  Got      : 0x{processed[bad_idx]:08X}\n"
        f"  Expected : 0x{exp:08X}"
    )
# -------------------------------------------------------------
def annotate_pair(ax, x, y1, y2, label1, label2):
    """
    Annotate two values at same x so that larger value is annotated above,
    smaller below – avoids visual inversion.
    """
    if y1 >= y2:
        top_y, top_label = y1, label1
        bot_y, bot_label = y2, label2
    else:
        top_y, top_label = y2, label2
        bot_y, bot_label = y1, label1

    ax.annotate(top_label,
                (x, top_y),
                textcoords="offset points",
                xytext=(5, 8),
                ha="left")

    ax.annotate(bot_label,
                (x, bot_y),
                textcoords="offset points",
                xytext=(5, -12),
                ha="left")


PLOT_SAMPLES = 1000

x_first = np.arange(PLOT_SAMPLES)
x_last  = np.arange(PLOT_SAMPLES)

fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(11, 9), sharex=False)

# FIRST 1000
orig_first = buffer[:PLOT_SAMPLES]
proc_first = processed[:PLOT_SAMPLES]

ax1.plot(x_first, orig_first, label="Original (first 1000)")
ax1.plot(x_first, proc_first, label="Processed (+0xF)")

# markers
ax1.scatter([0, PLOT_SAMPLES-1],
            [orig_first[0], orig_first[-1]],
            color="blue", zorder=5)
ax1.scatter([0, PLOT_SAMPLES-1],
            [proc_first[0], proc_first[-1]],
            color="orange", zorder=5)

# vertical lines
ax1.axvline(0, linestyle=":", color="gray")
ax1.axvline(PLOT_SAMPLES-1, linestyle=":", color="gray")

# annotations
# FIRST sample annotations
annotate_pair(
    ax1,
    0,
    orig_first[0],
    proc_first[0],
    f"Orig: {orig_first[0]}",
    f"Proc: {proc_first[0]}"
)

# LAST sample annotations
annotate_pair(
    ax1,
    PLOT_SAMPLES - 1,
    orig_first[-1],
    proc_first[-1],
    f"Orig: {orig_first[-1]}",
    f"Proc: {proc_first[-1]}"
)


ax1.set_title("First 1000 samples")
ax1.set_xlabel("Sample index")
ax1.set_ylabel("Value")
ax1.grid(True)
ax1.legend()

# LAST 1000
orig_last = buffer[-PLOT_SAMPLES:]
proc_last = processed[-PLOT_SAMPLES:]

ax2.plot(x_last, orig_last, label="Original (last 1000)", lw=2)
ax2.plot(x_last, proc_last, label="Processed (+0xF)", lw=2)

# disable offset notation
ax2.ticklabel_format(style='plain', useOffset=False)

# markers
ax2.scatter([0, PLOT_SAMPLES-1],
            [orig_last[0], orig_last[-1]],
            color="blue", zorder=5)
ax2.scatter([0, PLOT_SAMPLES-1],
            [proc_last[0], proc_last[-1]],
            color="orange", zorder=5)

# vertical lines
ax2.axvline(0, linestyle=":", color="gray")
ax2.axvline(PLOT_SAMPLES-1, linestyle=":", color="gray")

# annotations
annotate_pair(
    ax2,
    0,
    orig_last[0],
    proc_last[0],
    f"Orig: {orig_last[0]}",
    f"Proc: {proc_last[0]}"
)

annotate_pair(
    ax2,
    PLOT_SAMPLES - 1,
    orig_last[-1],
    proc_last[-1],
    f"Orig: {orig_last[-1]}",
    f"Proc: {proc_last[-1]}"
)


ax2.set_title("Last 1000 samples")
ax2.set_xlabel("Sample index (from end)")
ax2.set_ylabel("Value")
ax2.grid(True)
ax2.legend()

plt.tight_layout()
plt.show()

# -------------------------------------------------------------
recv_sock.close()
send_sock.close()

print("\nDONE — ALL TESTS PASSED")
