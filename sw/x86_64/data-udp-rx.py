#!/usr/bin/env python3
import socket
import numpy as np
import time

UDP_IP = "0.0.0.0"
UDP_PORT = 5005
MAX_PACKET_SIZE = 65535

# Max chunk similar to your PC TX code
MAX_UDP_SIZE = 1024

TARGET_COUNT = int(8 * 1024 * 1024 / 4)

def verify_data(arr):
    expected = np.arange(TARGET_COUNT, dtype=np.uint32)
    diff = arr != expected

    if not np.any(diff):
        return True, None

    idx = np.argmax(diff)
    return False, idx


# --- RECEIVE SOCKET ---
recv_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 8*1024*1024)
recv_sock.bind(("0.0.0.0", UDP_PORT))

print(f"Listening on UDP port {UDP_PORT}...")
print(f"Expecting {TARGET_COUNT} uint32 values...\n")

buffer = np.zeros(TARGET_COUNT, dtype=np.uint32)
write_index = 0

sender_ip = None
sender_port = None

while write_index < TARGET_COUNT:
    data, addr = recv_sock.recvfrom(MAX_PACKET_SIZE)

    if sender_ip is None:
        sender_ip, sender_port = addr
        print(f"\nData source detected: {sender_ip}:{sender_port}")

    nums = np.frombuffer(data, dtype="<u4")
    count = len(nums)

    end_index = write_index + count
    if end_index > TARGET_COUNT:
        end_index = TARGET_COUNT
        count = end_index - write_index
        nums = nums[:count]

    buffer[write_index:end_index] = nums
    write_index = end_index

    # print(f"Received {count} numbers from {addr}, total = {write_index}/{TARGET_COUNT}")

print("\nDONE — received complete buffer")


# --- VERIFICATION ---
print("\nVerifying data integrity...")
ok, idx = verify_data(buffer)

if ok:
    print("VERIFICATION OK — data is perfect sequence")
else:
    print(f"VERIFICATION FAILED at index {idx}: got {buffer[idx]}, expected {idx}")


# --- SEND BACK THE DATA (ECHO) ---
print("\nSending buffer back via UDP...")

send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

raw_bytes = buffer.tobytes()
total_len = len(raw_bytes)

for i in range(0, total_len, MAX_UDP_SIZE):
    chunk = raw_bytes[i:i + MAX_UDP_SIZE]
    send_sock.sendto(chunk, (sender_ip, 5005))
    time.sleep(0.001)  # throttle (optional)

print(f"Sent {total_len} bytes ({total_len/1024:.1f} KB) to {sender_ip}:{sender_port}")
print("DONE.")