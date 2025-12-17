#!/usr/bin/env python3
import socket
import numpy as np
import time
import matplotlib.pyplot as plt

UDP_IP = "0.0.0.0"
UDP_PORT = 5005
FPGA_IP = "192.168.3.2"   # <<< IP FPGA

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
    buf = np.zeros(target_count, dtype=np.uint32)
    idx = 0

    if label:
        print(f"Receiving {label}...")

    while idx < target_count:
        data, _ = sock.recvfrom(max_packet_size)
        nums = np.frombuffer(data, dtype="<u4")
        count = min(len(nums), target_count - idx)
        buf[idx:idx + count] = nums[:count]
        idx += count

    return buf


# SOCKET SETUP
recv_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, SOCK_BUF_SIZE)
recv_sock.bind(("0.0.0.0", UDP_PORT))
recv_sock.settimeout(50.0)

send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
send_sock.setsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF, SOCK_BUF_SIZE)

buffer = receive_buffer(
    recv_sock,
    TARGET_COUNT,
    MAX_PACKET_SIZE,
    label="Initial buffer"
)

# 1) GENERATE DATA LOCALLY (0 .. 15999999)
# print("Generating test data locally...")
# buffer = np.arange(TARGET_COUNT, dtype=np.uint32)

print("Initial first 5:", buffer[:5])
print("Initial last 5 :", buffer[-5:])

# optional sanity check
ok, idx = verify_data(buffer)
if not ok:
    raise RuntimeError("Local data generation failed")

# 2) SEND BUFFER TO FPGA
raw = buffer.tobytes()

t_loop_start = time.perf_counter() # <<< START POMIARU #

print("Sending buffer to FPGA...")
sent = 0
while sent < BUF_SIZE:
    chunk = raw[sent:sent + MAX_UDP_SIZE]
    send_sock.sendto(chunk, (FPGA_IP, UDP_PORT))
    sent += len(chunk)
    time.sleep(0.00003)

print("Full buffer sent to FPGA")

# 3) RECEIVE PROCESSED DATA FROM FPGA
processed = receive_buffer(
    recv_sock,
    TARGET_COUNT,
    MAX_PACKET_SIZE,
    label="PROCESSED buffer"
)

t_loop_end = time.perf_counter() # <<< KONIEC POMIARU

print("DONE — received processed buffer")
print("Processed first 5:", processed[:5])
print("Processed last 5 :", processed[-5:])

# 4) VERIFICATION OF PROCESSED DATA
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

elapsed = t_loop_end - t_loop_start
throughput = (BUF_SIZE / elapsed) / 1_000_000

print("\n================= LOOPBACK TIMING =================")
print(f"Total loopback time : {elapsed:.3f} s")
print(f"Total loopback time : {elapsed*1000:.1f} ms")
# print(f"Effective throughput: {throughput:.1f} MB/s")
print("==================================================\n")

# -------------------------------------------------------------
def annotate_pair(ax, x, y1, y2, label1, label2):
    if y1 >= y2:
        top_y, top_label = y1, label1
        bot_y, bot_label = y2, label2
    else:
        top_y, top_label = y2, label2
        bot_y, bot_label = y1, label1

    ax.annotate(top_label, (x, top_y), textcoords="offset points",
                xytext=(5, 8), ha="left")
    ax.annotate(bot_label, (x, bot_y), textcoords="offset points",
                xytext=(5, -12), ha="left")


# 5) PLOTS
PLOT_SAMPLES = 1000

x_first = np.arange(PLOT_SAMPLES)
x_last  = np.arange(PLOT_SAMPLES)

fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(11, 9), sharex=False)

# FIRST 1000
orig_first = buffer[:PLOT_SAMPLES]
proc_first = processed[:PLOT_SAMPLES]

ax1.plot(x_first, orig_first, label="Original (first 1000)", lw=2)
ax1.plot(x_first, proc_first, label="Processed (+0xF)", lw=2)

annotate_pair(ax1, 0, orig_first[0], proc_first[0],
              f"Orig: {orig_first[0]}", f"Proc: {proc_first[0]}")
annotate_pair(ax1, PLOT_SAMPLES-1, orig_first[-1], proc_first[-1],
              f"Orig: {orig_first[-1]}", f"Proc: {proc_first[-1]}")

ax1.set_title("First 1000 samples")
ax1.grid(True)
ax1.legend()

# LAST 1000
orig_last = buffer[-PLOT_SAMPLES:]
proc_last = processed[-PLOT_SAMPLES:]

ax2.plot(x_last, orig_last, label="Original (last 1000)", lw=2)
ax2.plot(x_last, proc_last, label="Processed (+0xF)", lw=2)
ax2.ticklabel_format(style='plain', useOffset=False)

annotate_pair(ax2, 0, orig_last[0], proc_last[0],
              f"Orig: {orig_last[0]}", f"Proc: {proc_last[0]}")
annotate_pair(ax2, PLOT_SAMPLES-1, orig_last[-1], proc_last[-1],
              f"Orig: {orig_last[-1]}", f"Proc: {proc_last[-1]}")

ax2.set_title("Last 1000 samples")
ax2.grid(True)
ax2.legend()

plt.tight_layout()
plt.show()

# -------------------------------------------------------------
recv_sock.close()
send_sock.close()

print("\nDONE — ALL TESTS PASSED")
