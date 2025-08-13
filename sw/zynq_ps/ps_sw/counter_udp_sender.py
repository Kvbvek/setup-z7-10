#!/usr/bin/env python3
import mmap
import struct
import socket
import time
import os

UIO_DEVICE = "/dev/uio0"
MAP_SIZE = 0x1000
UDP_IP = "192.186.3.1" # przydzielony statyczny adres IP na pc
UDP_PORT = 5005 

def main():
    if not os.path.exists(UIO_DEVICE):
        print(f"ERROR: {UIO_DEVICE} nie istnieje — sprawdź UIO driver")
        return

    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    with open(UIO_DEVICE, "r+b", buffering=0) as f:
        mm = mmap.mmap(f.fileno(), MAP_SIZE, mmap.MAP_SHARED,
                       mmap.PROT_READ | mmap.PROT_WRITE, offset=0)

        try:
            while True:
                mm.seek(0)  # licznik pod offset 0x0
                data = mm.read(4)
                value = struct.unpack("<I", data)[0]
                message = str(value).encode()
                sock.sendto(message, (UDP_IP, UDP_PORT))
                print(f"Wysłano: {value}")
                time.sleep(0.5)
        finally:
            mm.close()
            sock.close()

if __name__ == "__main__":
    main()
