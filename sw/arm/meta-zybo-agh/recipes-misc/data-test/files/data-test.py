#!/usr/bin/env python3
import os, mmap, struct, time

DMA_BASE = 0x40400000

# GPIO0 = sygnał START (1 podczas transferu, 0 po)
GPIO0_BASE = 0x41200000  

# GPIO1 = ilość danych (drugie AXI GPIO 32-bit)
GPIO1_BASE = 0x41210000

MAP_SIZE = 0x10000

BUF_ADDR = 0x0A000000
BUF_SIZE = 1 * 1024 * 1024  # 1 MB

GPIO_DATA = 0x0

S2MM_DMACR   = 0x30
S2MM_DMASR   = 0x34
S2MM_DA      = 0x48
S2MM_LENGTH  = 0x58

fd = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)

mm_dma  = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                    mmap.PROT_READ | mmap.PROT_WRITE, offset=DMA_BASE)

mm_gpio0 = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                     mmap.PROT_READ | mmap.PROT_WRITE, offset=GPIO0_BASE)

mm_gpio1 = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                     mmap.PROT_READ | mmap.PROT_WRITE, offset=GPIO1_BASE)

mm_ddr = mmap.mmap(fd, BUF_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=BUF_ADDR)


# --- helpers ---
def dma_wr(off, val):
    struct.pack_into("<I", mm_dma, off, val)

def dma_rd(off):
    return struct.unpack_from("<I", mm_dma, off)[0]

def gpio0_wr(val):
    struct.pack_into("<I", mm_gpio0, GPIO_DATA, val)

def gpio1_wr(val):
    struct.pack_into("<I", mm_gpio1, GPIO_DATA, val)
# ----------------


print("Reset DMA...")
dma_wr(S2MM_DMACR, 0x4)
time.sleep(0.01)
dma_wr(S2MM_DMACR, 0x1)

# ---------------------------------------------------
#   Ustawienie liczby danych do wygenerowania (Gpio1)
# ---------------------------------------------------
transfer_len = BUF_SIZE    # np. 1MB danych
print(f"Ustawiam ilość danych na GPIO1 = {transfer_len}")
gpio1_wr(transfer_len)
# ---------------------------------------------------

# ---------------------------------------------------
#   START = 1 podczas transferu
# ---------------------------------------------------
print("Setting START = 1 on GPIO0...")
gpio0_wr(1)
# ---------------------------------------------------

# Start DMA
dma_wr(S2MM_DA, BUF_ADDR)
dma_wr(S2MM_LENGTH, transfer_len)

print("Waiting for DMA...")
while True:
    if dma_rd(S2MM_DMASR) & 0x0002:  # IOC_Irq (done)
        break
    time.sleep(0.001)

print("Transfer completed")

# ---------------------------------------------------
#   Po transferze START = 0
# ---------------------------------------------------
print("Setting START = 0 on GPIO0...")
gpio0_wr(0)
# ---------------------------------------------------

print("First 16 words:")
for i in range(0, 64, 4):
    print(struct.unpack_from("<I", mm_ddr, i)[0])

print("\nLast 16 words:")
for i in range(transfer_len - 64, transfer_len, 4):
    print(struct.unpack_from("<I", mm_ddr, i)[0])


mm_dma.close()
mm_gpio0.close()
mm_gpio1.close()
mm_ddr.close()
os.close(fd)
