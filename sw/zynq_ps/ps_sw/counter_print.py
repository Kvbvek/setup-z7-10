#!/usr/bin/env python3
import os, mmap, struct, time

# Konfiguracja
UIO_DMA = "/dev/uio0"        # UIO dla AXI DMA
MAP_SIZE = 0x10000           # 64 KB mapowania
BUF_ADDR = 0x0A000000        # adres bufora w DDR (fizyczny)
BUF_SIZE = 0x1000            # 4 KB bufora = 1024 słowa (32-bit)

# Rejestry DMA S2MM (PG021)
S2MM_DMACR   = 0x30  # Control register
S2MM_DMASR   = 0x34  # Status register
S2MM_SA      = 0x48  # Source address (dla MM2S) – nieużywany tutaj
S2MM_DA      = 0x48  # Destination address (dla S2MM)
S2MM_LENGTH  = 0x58  # Transfer length in bytes

# Otwórz UIO do DMA
fd_dma = os.open(UIO_DMA, os.O_RDWR | os.O_SYNC)
mm_dma = mmap.mmap(fd_dma, MAP_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=0)

# Otwórz /dev/mem do DDR
fd_mem = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)
mm_ddr = mmap.mmap(fd_mem, BUF_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=BUF_ADDR)

def dma_wr(off, val):
    struct.pack_into("<I", mm_dma, off, val)

def dma_rd(off):
    return struct.unpack_from("<I", mm_dma, off)[0]

# Reset i start DMA
print("Reset DMA...")
dma_wr(S2MM_DMACR, 0x4)   # reset
time.sleep(0.01)
dma_wr(S2MM_DMACR, 0x1)   # run/enable

# Ustaw adres bufora docelowego
dma_wr(S2MM_DA, BUF_ADDR)

# Długość transferu (np. 100 słów * 4 bajty = 400 bajtów)
transfer_len = 100 * 4
dma_wr(S2MM_LENGTH, transfer_len)

# Czekaj na zakończenie transferu
print("Oczekiwanie na DMA...")
while True:
    status = dma_rd(S2MM_DMASR)
    if status & 0x0002:  # IOC_Irq = transfer complete
        break
    time.sleep(0.001)

print("Transfer zakończony.")

# Czytaj dane z DDR
print("Odebrane dane:")
for i in range(0, transfer_len, 4):
    val = struct.unpack_from("<I", mm_ddr, i)[0]
    print(val)

mm_dma.close()
mm_ddr.close()
os.close(fd_dma)
os.close(fd_mem)
