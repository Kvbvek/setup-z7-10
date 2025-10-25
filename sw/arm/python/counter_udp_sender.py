#!/usr/bin/env python3
import os, mmap, struct, time, socket

# -----------------------------
# DMA and DDR configuration
# -----------------------------
UIO_DMA = "/dev/uio0"
MAP_SIZE = 0x10000
BUF_ADDR = 0x0A000000
BUF_SIZE = 0x1000

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
# Open UIO to DMA
# -----------------------------
fd_dma = os.open(UIO_DMA, os.O_RDWR | os.O_SYNC)
mm_dma = mmap.mmap(fd_dma, MAP_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=0)

# Open DDR
fd_mem = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)
mm_ddr = mmap.mmap(fd_mem, BUF_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=BUF_ADDR)

def dma_wr(off, val):
    struct.pack_into("<I", mm_dma, off, val)

def dma_rd(off):
    return struct.unpack_from("<I", mm_dma, off)[0]

print("Reset DMA...")
dma_wr(S2MM_DMACR, 0x4)   # reset
time.sleep(0.01)
dma_wr(S2MM_DMACR, 0x1)   # run/enable
dma_wr(S2MM_DA, BUF_ADDR)

# 100 words 4 bytes each
transfer_len = 100 * 4
dma_wr(S2MM_LENGTH, transfer_len)

print("Waiting for DMA...")
while True:
    status = dma_rd(S2MM_DMASR)
    if status & 0x0002:  # IOC_Irq
        break
    time.sleep(0.001)

print("Transfer ended, sending data through UDP...")

# -----------------------------
# Sending data
# -----------------------------
buf = mm_ddr.read(transfer_len)  # read data once
sock.sendto(buf, (UDP_IP, UDP_PORT))

print(f"Sended {transfer_len} bytes to {UDP_IP}:{UDP_PORT}")

# -----------------------------
# Closing
# -----------------------------
mm_dma.close()
mm_ddr.close()
os.close(fd_dma)
os.close(fd_mem)
sock.close()
