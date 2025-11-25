#!/usr/bin/env python3
import os, mmap, struct, time, socket

# -----------------------------
# DMA and DDR configuration
# -----------------------------
DMA_BASE = 0x40400000
MAP_SIZE = 0x10000

BUF_ADDR = 0x0A000000
BUF_SIZE = 262144 * 4   # 1 MB (262144 słów)

S2MM_DMACR   = 0x30
S2MM_DMASR   = 0x34
S2MM_DA      = 0x48
S2MM_LENGTH  = 0x58

# -----------------------------
# GPIO configuration
# -----------------------------
GPIO0_BASE = 0x41200000       # START (1 while transfer, then 0)
GPIO1_BASE = 0x41210000       # ILOŚĆ DANYCH

GPIO_DATA = 0x0

# -----------------------------
# UDP configuration
# -----------------------------
UDP_IP = "192.168.3.1"
UDP_PORT = 5005
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# -----------------------------
# Open /dev/mem
# -----------------------------
fd = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)

mm_dma = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=DMA_BASE)

mm_gpio0 = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                     mmap.PROT_READ | mmap.PROT_WRITE, offset=GPIO0_BASE)

mm_gpio1 = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                     mmap.PROT_READ | mmap.PROT_WRITE, offset=GPIO1_BASE)

mm_ddr = mmap.mmap(fd, BUF_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=BUF_ADDR)

# -----------------------------
# Helpers
# -----------------------------
def dma_wr(off, val):
    struct.pack_into("<I", mm_dma, off, val)

def dma_rd(off):
    return struct.unpack_from("<I", mm_dma, off)[0]

def gpio0_wr(val):
    struct.pack_into("<I", mm_gpio0, GPIO_DATA, val)

def gpio1_wr(val):
    struct.pack_into("<I", mm_gpio1, GPIO_DATA, val)

# -----------------------------
# Prepare DMA
# -----------------------------
print("Reset DMA...")
dma_wr(S2MM_DMACR, 0x4)
time.sleep(0.01)
dma_wr(S2MM_DMACR, 0x1)
dma_wr(S2MM_DA, BUF_ADDR)

# -----------------------------
# Set amount of generated data
# -----------------------------
transfer_len = BUF_SIZE
print(f"Setting GPIO1 (data count) = {transfer_len}")
gpio1_wr(transfer_len)

# -----------------------------
# START = 1 on GPIO0
# -----------------------------
print("START = 1 (GPIO0)")
gpio0_wr(1)

# -----------------------------
# Start DMA transfer
# -----------------------------
dma_wr(S2MM_DA, BUF_ADDR)
dma_wr(S2MM_LENGTH, transfer_len)

print("Waiting for DMA...")
while True:
    if dma_rd(S2MM_DMASR) & 0x0002:
        break
    time.sleep(0.001)

print("DMA completed")

# -----------------------------
# START = 0 after transfer
# -----------------------------
print("START = 0 (GPIO0)")
gpio0_wr(0)

# -----------------------------
# Sending data over UDP
# -----------------------------
print("Sending buffer via UDP...")

mm_ddr.seek(0)
buf = mm_ddr.read(transfer_len)

MAX_UDP_SIZE = 60000
for i in range(0, len(buf), MAX_UDP_SIZE):
    chunk = buf[i:i + MAX_UDP_SIZE]
    sock.sendto(chunk, (UDP_IP, UDP_PORT))
    time.sleep(0.001)

print(f"Sent {transfer_len} bytes ({transfer_len/1024:.1f} KB) to {UDP_IP}:{UDP_PORT}")

# -----------------------------
# Closing
# -----------------------------
mm_dma.close()
mm_gpio0.close()
mm_gpio1.close()
mm_ddr.close()
os.close(fd)
sock.close()
