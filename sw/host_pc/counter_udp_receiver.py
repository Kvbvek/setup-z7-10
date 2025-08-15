#!/usr/bin/env python3
import socket, struct

UDP_IP = "0.0.0.0"
UDP_PORT = 5005

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))

print(f"Listening on port {UDP_PORT}...")

while True:
    data, addr = sock.recvfrom(4096)  
    print(f"Received {len(data)} bytes from {addr}")
    
    for i in range(0, len(data), 4):
        val = struct.unpack_from("<I", data, i)[0]
        print(val)
