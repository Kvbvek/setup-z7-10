#!/usr/bin/env python3
import os, mmap, struct, time, socket

# DMA / DDR
DMA_BASE = 0x40400000
MAP_SIZE = 0x10000

BUF_SIZE  = 64000000

TX_BUF_ADDR = 0x08000000
RX_BUF_ADDR = 0x18000000

# DMA registers
S2MM_DMACR   = 0x30
S2MM_DMASR   = 0x34
S2MM_DA      = 0x48
S2MM_LENGTH  = 0x58

MM2S_DMACR   = 0x00
MM2S_DMASR   = 0x04
MM2S_SA      = 0x18
MM2S_LENGTH  = 0x28

# CSR
CSR_BASE    = 0x40000000
CSR_INCREMENT = 0x00

# UDP
UDP_IP   = "192.168.3.1"
UDP_PORT = 5005

send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
recv_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, BUF_SIZE*4)
send_sock.setsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF, BUF_SIZE*4)

recv_sock.bind(("0.0.0.0", UDP_PORT))
recv_sock.settimeout(200.0)

# /dev/mem
fd = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)

mm_dma = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=DMA_BASE)

mm_axil = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                    mmap.PROT_READ | mmap.PROT_WRITE, offset=CSR_BASE)

mm_tx = mmap.mmap(fd, BUF_SIZE, mmap.MAP_SHARED,
                  mmap.PROT_READ | mmap.PROT_WRITE, offset=TX_BUF_ADDR)

mm_rx = mmap.mmap(fd, BUF_SIZE, mmap.MAP_SHARED,
                  mmap.PROT_READ | mmap.PROT_WRITE, offset=RX_BUF_ADDR)

# Helpers
def dma_wr(off, val):
    struct.pack_into("<I", mm_dma, off, val)

def dma_rd(off):
    return struct.unpack_from("<I", mm_dma, off)[0]

def axil_wr(off, val):
    struct.pack_into("<I", mm_axil, off, val)

def recv_exact_into(sock, mm, size, label=""):
    view = memoryview(mm)
    got = 0
    print(f"Receiving {label} ({size} bytes) directly to DDR")
    while got < size:
        n = sock.recv_into(view[got:], size - got)
        got += n

MAX_UDP_SIZE = 1400

print("Receiving data from PC...")

mm_tx.seek(0)
recv_exact_into(recv_sock, mm_tx, BUF_SIZE, "Full buffer")

print("Full buffer received from PC")

print("Setting increment value...")
axil_wr(CSR_INCREMENT, 1000)

dma_wr(S2MM_DMACR, 0x4)
dma_wr(MM2S_DMACR, 0x4)
time.sleep(0.001)

dma_wr(S2MM_DMACR, 0x1)
dma_wr(MM2S_DMACR, 0x1)

dma_wr(S2MM_DA, RX_BUF_ADDR)
dma_wr(S2MM_LENGTH, BUF_SIZE)

dma_wr(MM2S_SA, TX_BUF_ADDR)
dma_wr(MM2S_LENGTH, BUF_SIZE)

t_mem_to_pl_start = time.perf_counter()
# print("Processing data...")

while(True):
    if(dma_rd(MM2S_DMASR) & 0x0002):
        break
while(True):
    if(dma_rd(S2MM_DMASR) & 0x0002):
        break

t_mem_to_pl_end = time.perf_counter()
time.sleep(0.00001)
print("Processing done")

# SEND PROCESSED DATA → PC

view = memoryview(mm_rx)

for i in range(0, BUF_SIZE, MAX_UDP_SIZE):
    send_sock.sendto(view[i:i+MAX_UDP_SIZE], (UDP_IP, UDP_PORT))

print("Processed data sent to PC")

# ===================== RESULT =====================
elapsed = t_mem_to_pl_end - t_mem_to_pl_start
throughput = (BUF_SIZE / elapsed) / 1_000_000

print("\n===== MM2S -> PL -> S2MM TIMING =====")
print(f"MM2S -> PL -> S2MM time : {elapsed:.6f} s")
print(f"MM2S -> PL -> S2MM time : {elapsed*1000:.3f} ms")
print(f"Effective throughput: {throughput:.3f} MB/s")
print("======================================\n")

view.release()
del view

# Cleanup
mm_dma.close()
mm_axil.close()
mm_tx.close()
mm_rx.close()
os.close(fd)
send_sock.close()
recv_sock.close()
