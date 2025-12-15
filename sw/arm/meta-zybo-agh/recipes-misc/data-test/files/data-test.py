#!/usr/bin/env python3
import os, mmap, struct, time

DMA_BASE  = 0x40400000
AXIL_BASE = 0x40000000

MAP_SIZE = 0x10000

BUF_ADDR = 0x0A000000
TRANSFER_SIZE = 8 * 1024 * 1024   # 8 MB = MAX for AXI DMA (23-bit LENGTH)

# AXI-Lite registers
AXIL_CONTROL = 0x00   # bit0=enable
AXIL_LENGTH  = 0x04   # number of words
AXIL_SEL     = 0x08   # 0=data generator, 1=external source

# DMA registers
S2MM_DMACR   = 0x30
S2MM_DMASR   = 0x34
S2MM_DA      = 0x48
S2MM_LENGTH  = 0x58

# Open /dev/mem
fd = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)

mm_dma  = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                    mmap.PROT_READ | mmap.PROT_WRITE, offset=DMA_BASE)

mm_axil = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                    mmap.PROT_READ | mmap.PROT_WRITE, offset=AXIL_BASE)

mm_ddr = mmap.mmap(fd, TRANSFER_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=BUF_ADDR)

# Helpers
def dma_wr(off, val):
    struct.pack_into("<I", mm_dma, off, val)

def dma_rd(off):
    return struct.unpack_from("<I", mm_dma, off)[0]

def axil_wr(off, val):
    struct.pack_into("<I", mm_axil, off, val)

print("Reset DMA...")
dma_wr(S2MM_DMACR, 0x4)  # reset
time.sleep(0.01)
dma_wr(S2MM_DMACR, 0x1)  # run

print("Configuring AXI-lite registers...")

# 1) SEL = 0
print("Setting SEL = 0 (data generator)")
axil_wr(AXIL_SEL, 0)

# 2) LENGTH = number of words
num_words = TRANSFER_SIZE // 4
print(f"Setting LENGTH = {num_words} words")
axil_wr(AXIL_LENGTH, num_words)

# 3) ENABLE = 1
print("ENABLE=1")
axil_wr(AXIL_CONTROL, 1)

# -------------------------------
print("Starting DMA S2MM...")
dma_wr(S2MM_DA, BUF_ADDR)
dma_wr(S2MM_LENGTH, TRANSFER_SIZE)

# Wait for DMA completion
while True:
    if dma_rd(S2MM_DMASR) & 0x2:   # IOC_Irq
        break
    time.sleep(0.001)

print("DMA transfer completed.")

# Disable enable
axil_wr(AXIL_CONTROL, 0)
print("ENABLE=0")

# Show first and last samples
print("\nFirst 16 words:")
for i in range(0, 64, 4):
    print(struct.unpack_from("<I", mm_ddr, i)[0])

print("\nLast 16 words:")
for i in range(TRANSFER_SIZE - 64, TRANSFER_SIZE, 4):
    print(struct.unpack_from("<I", mm_ddr, i)[0])

mm_dma.close()
mm_axil.close()
mm_ddr.close()
os.close(fd)
