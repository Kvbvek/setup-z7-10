#!/usr/bin/env python3
import socket

UDP_IP = "0.0.0.0"  # nasłuchuj na wszystkich interfejsach
UDP_PORT = 5005

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))

print(f"Nasłuchiwanie na {UDP_IP}:{UDP_PORT}...")

while True:
    data, addr = sock.recvfrom(1024)  # max 1024 bajty
    print(f"Odebrano od {addr}: {data.decode()}")
