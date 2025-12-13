#!/usr/bin/env python3
import socket
import numpy as np
import time

UDP_IP = "0.0.0.0"
UDP_PORT = 5005
MAX_PACKET_SIZE = 65535
MAX_UDP_SIZE = 1024

TARGET_COUNT = int(16*1024*1024 / 4)   # number of uint32 words

def verify_data(arr):
    expected = np.arange(TARGET_COUNT, dtype=np.uint32)
    diff = arr != expected

    if not np.any(diff):
        return True, None

    idx = np.argmax(diff)
    return False, idx

# Receive initial data from fpga
recv_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 16*1024*1024)
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

print("\nDONE — received initial buffer from FPGA!")


# Verification
print("\nVerifying data integrity...")
ok, idx = verify_data(buffer)

if ok:
    print("VERIFICATION OK — data is perfect sequence")
else:
    print(f"VERIFICATION FAILED at index {idx}: got {buffer[idx]}, expected {idx}")


# Send back to fpga
print("\nSending buffer back via UDP...")

send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

raw_bytes = buffer.tobytes()
total_len = len(raw_bytes)

for i in range(0, total_len, MAX_UDP_SIZE):
    chunk = raw_bytes[i:i + MAX_UDP_SIZE]
    send_sock.sendto(chunk, (sender_ip, UDP_PORT))
    time.sleep(0.001)

print(f"Sent {total_len} bytes ({total_len/1024:.1f} KB) to FPGA")
print("WAITING FOR PROCESSED DATA...\n")


# Receive processed data back from fpga
processed = np.zeros(TARGET_COUNT, dtype=np.uint32)
processed_index = 0

while processed_index < TARGET_COUNT:
    data, addr = recv_sock.recvfrom(MAX_PACKET_SIZE)

    nums = np.frombuffer(data, dtype="<u4")
    count = len(nums)

    end_index = processed_index + count
    if end_index > TARGET_COUNT:
        end_index = TARGET_COUNT
        count = end_index - processed_index
        nums = nums[:count]

    processed[processed_index:end_index] = nums
    processed_index = end_index

print("DONE — received processed buffer from FPGA!\n")


# Print few values
print("Processed data — first 5 values:", processed[:5])
print("Processed data — last 5 values: ", processed[-5:])
print("\nDONE.")
