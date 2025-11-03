#!/usr/bin/env python3
import socket
import struct

UDP_IP = "0.0.0.0"
UDP_PORT = 5005
MAX_PACKET_SIZE = 65535  # maks. rozmiar UDP

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))

print(f"Listening on port {UDP_PORT}...")

packet_count = 0
total_bytes = 0

while True:
    data, addr = sock.recvfrom(MAX_PACKET_SIZE)
    packet_count += 1
    total_bytes += len(data)

    print(f"Packet #{packet_count}: {len(data)} bytes from {addr}")

    # Print few first and last data in packet
    if len(data) >= 32:
        print("First 16 bytes:")
        for i in range(0, 16, 4):
            val = struct.unpack_from("<I", data, i)[0]
            print(val)
        print("Last 16 bytes:")
        for i in range(len(data) - 16, len(data), 4):
            val = struct.unpack_from("<I", data, i)[0]
            print(val)
    print("-" * 40)
