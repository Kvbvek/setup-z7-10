#!/usr/bin/env python3

import mmap
import struct
import time
import os

UIO_DEVICE = "/dev/uio0"
MAP_SIZE = 0x1000  # taki sam jak w reg=<... 0x1000> w device tree

def main():
    if not os.path.exists(UIO_DEVICE):
        print(f"ERROR: {UIO_DEVICE} nie istnieje — sprawdź, czy sterownik UIO działa")
        return

    with open(UIO_DEVICE, "r+b", buffering=0) as f:
        # Mapowanie pamięci rejestrów IP
        mm = mmap.mmap(f.fileno(), MAP_SIZE, mmap.MAP_SHARED,
                       mmap.PROT_READ | mmap.PROT_WRITE, offset=0)

        try:
            while True:
                mm.seek(0)  # zakładamy, że licznik jest pod offset 0x0
                data = mm.read(4)  # 32 bity = 4 bajty
                value = struct.unpack("<I", data)[0]  # little-endian, unsigned int
                print(f"Licznik: {value}")
                time.sleep(1)
        finally:
            mm.close()

if __name__ == "__main__":
    main()