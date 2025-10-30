#!/usr/bin/env python3
import os, mmap, struct, time, socket

# -----------------------------
# DMA and DDR configuration
# -----------------------------
DMA_BASE = 0x40400000
MAP_SIZE = 0x10000
BUF_ADDR = 0x0A000000
BUF_SIZE = 262144 * 4   #1 MB

S2MM_DMACR   = 0x30
S2MM_DMASR   = 0x34
S2MM_DA      = 0x48
S2MM_LENGTH  = 0x58

# -----------------------------
# UDP configuration
# -----------------------------
UDP_IP = "192.168.3.1"
UDP_PORT = 5005
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# -----------------------------
# Open /dev/mem for DMA and DDR
# -----------------------------
fd = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)

mm_dma = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=DMA_BASE)

mm_ddr = mmap.mmap(fd, BUF_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=BUF_ADDR)

def dma_wr(off, val):
    struct.pack_into("<I", mm_dma, off, val)

def dma_rd(off):
    return struct.unpack_from("<I", mm_dma, off)[0]

# -----------------------------
# Run DMA
# -----------------------------
print("Reset DMA...")
dma_wr(S2MM_DMACR, 0x4)   # reset
time.sleep(0.01)
dma_wr(S2MM_DMACR, 0x1)   # run/enable
dma_wr(S2MM_DA, BUF_ADDR)

transfer_len = 262144 * 4  # 1 MB
dma_wr(S2MM_LENGTH, transfer_len)

print("Waiting for DMA...")
while True:
    status = dma_rd(S2MM_DMASR)
    if status & 0x0002:  # IOC_Irq (transfer complete)
        break
    time.sleep(0.001)

print("Transfer ended, sending data through UDP...")

# -----------------------------
# Sending data
# -----------------------------
mm_ddr.seek(0)
buf = mm_ddr.read(transfer_len)
sock.sendto(buf, (UDP_IP, UDP_PORT))

print(f"Sent {transfer_len} bytes ({transfer_len/1024:.1f} KB) to {UDP_IP}:{UDP_PORT}")

# -----------------------------
# Closing
# -----------------------------
mm_dma.close()
mm_ddr.close()
os.close(fd)
sock.close()
