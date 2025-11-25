#!/usr/bin/env python3
import socket
import numpy as np

UDP_IP = "0.0.0.0"
UDP_PORT = 5005
MAX_PACKET_SIZE = 65535

# Number of 32-bit values we want to receive
TARGET_COUNT = 262144   # 256k uint32 values


def verify_data(arr):
    """
    Verify that the received data matches a perfect sequence:
    0, 1, 2, ..., TARGET_COUNT-1.

    Returns:
        (True, None) if data is correct,
        (False, index) if a mismatch occurs.
    """
    expected = np.arange(TARGET_COUNT, dtype=np.uint32)
    diff = arr != expected

    if not np.any(diff):
        return True, None

    # Find the first mismatch index
    idx = np.argmax(diff)
    return False, idx


sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))

print(f"Listening on UDP port {UDP_PORT}...")
print(f"Expecting {TARGET_COUNT} uint32 values...\n")

# Preallocated buffer for all incoming data
buffer = np.zeros(TARGET_COUNT, dtype=np.uint32)

write_index = 0

while write_index < TARGET_COUNT:
    data, addr = sock.recvfrom(MAX_PACKET_SIZE)

    # Convert raw bytes to uint32 array (little endian)
    nums = np.frombuffer(data, dtype="<u4")
    count = len(nums)

    # Compute where to stop writing to avoid buffer overflow
    end_index = write_index + count
    if end_index > TARGET_COUNT:
        end_index = TARGET_COUNT
        count = end_index - write_index
        nums = nums[:count]

    # Store values in buffer
    buffer[write_index:end_index] = nums
    write_index = end_index

    print(f"Received {count} numbers from {addr}, total = {write_index}/{TARGET_COUNT}")

print("\nDONE — received all requested values!")
print("--------------------------------------")
print("Total numbers received:", write_index)
print("Buffer shape:", buffer.shape)
print("Buffer dtype:", buffer.dtype)

print("\nFirst 5 numbers:", buffer[:5])
print("Last 5 numbers:", buffer[-5:])

# --- Data verification ---
print("\nVerifying data integrity...")
ok, idx = verify_data(buffer)

if ok:
    print("VERIFICATION OK — data is a perfect sequence 0..262143")
else:
    print(f"VERIFICATION FAILED — mismatch at index {idx}: got {buffer[idx]}, expected {idx}")