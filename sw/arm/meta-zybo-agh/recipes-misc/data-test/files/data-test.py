#!/usr/bin/env python3
import os, mmap, struct, time

DMA_BASE = 0x40400000
MAP_SIZE = 0x10000
BUF_ADDR = 0x0A000000
BUF_SIZE = 1 * 1024 * 1024  # 1 MB

S2MM_DMACR   = 0x30
S2MM_DMASR   = 0x34
S2MM_DA      = 0x48
S2MM_LENGTH  = 0x58

fd = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)

mm_dma = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=DMA_BASE)

mm_ddr = mmap.mmap(fd, BUF_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=BUF_ADDR)

def dma_wr(off, val):
    struct.pack_into("<I", mm_dma, off, val)

def dma_rd(off):
    return struct.unpack_from("<I", mm_dma, off)[0]

print("Reset DMA...")
dma_wr(S2MM_DMACR, 0x4)
time.sleep(0.01)
dma_wr(S2MM_DMACR, 0x1)

dma_wr(S2MM_DA, BUF_ADDR)
transfer_len = BUF_SIZE
dma_wr(S2MM_LENGTH, transfer_len)

print("Waiting for DMA...")
while True:
    if dma_rd(S2MM_DMASR) & 0x0002:  # IOC_Irq (transfer complete)
        break
    time.sleep(0.001)

print("Transfer completed")

print("First 16 words:")
for i in range(0, 64, 4):
    print(struct.unpack_from("<I", mm_ddr, i)[0])

print("\Last 16 words:")
for i in range(transfer_len - 64, transfer_len, 4):
    print(struct.unpack_from("<I", mm_ddr, i)[0])

mm_dma.close()
mm_ddr.close()
os.close(fd)
