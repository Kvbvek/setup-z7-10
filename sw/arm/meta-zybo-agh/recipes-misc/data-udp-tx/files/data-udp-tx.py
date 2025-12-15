#!/usr/bin/env python3
import os, mmap, struct, time, socket
import numpy as np

# DMA / DDR
DMA_BASE = 0x40400000
MAP_SIZE = 0x10000

BUF_SIZE  = 64000000
# HALF_SIZE = BUF_SIZE // 2

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

# AXI-Lite
AXIL_BASE    = 0x40000000
AXIL_CONTROL = 0x00
AXIL_LENGTH  = 0x04

# AXI Switch
SWITCH_BASE    = 0x43C00000
SWITCH_COMMIT  = 0x00
SWITCH_COMMIT_WRITE = 0x2
SWITCH_MUX     = 0x40
SWITCH_GEN_SRC = 0x0
SWITCH_MOD_SRC = 0x1

# UDP
UDP_IP   = "192.168.3.1"
UDP_PORT = 5005

send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
recv_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, BUF_SIZE)
send_sock.setsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF, BUF_SIZE)

recv_sock.bind(("0.0.0.0", UDP_PORT))
recv_sock.settimeout(200.0)

# /dev/mem
fd = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)

mm_dma = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=DMA_BASE)

mm_axil = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                    mmap.PROT_READ | mmap.PROT_WRITE, offset=AXIL_BASE)

mm_tx = mmap.mmap(fd, BUF_SIZE, mmap.MAP_SHARED,
                  mmap.PROT_READ | mmap.PROT_WRITE, offset=TX_BUF_ADDR)

mm_rx = mmap.mmap(fd, BUF_SIZE, mmap.MAP_SHARED,
                  mmap.PROT_READ | mmap.PROT_WRITE, offset=RX_BUF_ADDR)

mm_sw = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                  mmap.PROT_READ | mmap.PROT_WRITE, offset=SWITCH_BASE)

# Helpers
def dma_wr(off, val):
    struct.pack_into("<I", mm_dma, off, val)

def dma_rd(off):
    return struct.unpack_from("<I", mm_dma, off)[0]

def axil_wr(off, val):
    struct.pack_into("<I", mm_axil, off, val)

def sw_wr(off, val):
    struct.pack_into("<I", mm_sw, off, val)

def recv_exact(sock, size, label):
    buf = bytearray(size)
    got = 0
    print(f"Receiving {label} ({size} bytes)")
    while got < size:
        data, _ = sock.recvfrom(65535)
        n = min(len(data), size - got)
        buf[got:got+n] = data[:n]
        got += n
    return buf

# 1) GENERATOR → DDR
sw_wr(SWITCH_MUX, SWITCH_GEN_SRC)
sw_wr(SWITCH_COMMIT, SWITCH_COMMIT_WRITE)

dma_wr(S2MM_DMACR, 0x4)
time.sleep(0.01)
dma_wr(S2MM_DMACR, 0x1)

dma_wr(S2MM_DA, RX_BUF_ADDR)

axil_wr(AXIL_LENGTH, BUF_SIZE // 4)
axil_wr(AXIL_CONTROL, 1)

dma_wr(S2MM_LENGTH, BUF_SIZE)

while not (dma_rd(S2MM_DMASR) & 0x0002):
    time.sleep(0.001)

axil_wr(AXIL_CONTROL, 0)
print("Initial S2MM done")

# 2) SEND GENERATED DATA → PC
mm_rx.seek(0)
data = mm_rx.read(BUF_SIZE)

MAX_UDP_SIZE = 1400
for i in range(0, BUF_SIZE, MAX_UDP_SIZE):
    send_sock.sendto(data[i:i+MAX_UDP_SIZE], (UDP_IP, UDP_PORT))
    if i % (1024*1024) == 0:
        time.sleep(0.001)

print("Generated data sent to PC")

rx_buf = recv_exact(recv_sock, BUF_SIZE, "Full")

print("Full buffer received from PC")

# 4) DDR → PL → DDR (MM2S + S2MM)
mm_tx.seek(0)
mm_tx.write(rx_buf)
os.sync()
time.sleep(0.01)

sw_wr(SWITCH_MUX, SWITCH_MOD_SRC)
sw_wr(SWITCH_COMMIT, SWITCH_COMMIT_WRITE)

dma_wr(S2MM_DMACR, 0x4)
dma_wr(MM2S_DMACR, 0x4)
time.sleep(0.01)

dma_wr(S2MM_DMACR, 0x1)
dma_wr(MM2S_DMACR, 0x1)

dma_wr(S2MM_DA, RX_BUF_ADDR)
dma_wr(S2MM_LENGTH, BUF_SIZE)

dma_wr(MM2S_SA, TX_BUF_ADDR)
dma_wr(MM2S_LENGTH, BUF_SIZE)

while not (dma_rd(MM2S_DMASR) & 0x0002):
    time.sleep(0.001)

while not (dma_rd(S2MM_DMASR) & 0x0002):
    time.sleep(0.001)

print("DMA processing done")

# 5) SEND PROCESSED DATA → PC
mm_rx.seek(0)
processed = mm_rx.read(BUF_SIZE)

for i in range(0, BUF_SIZE, MAX_UDP_SIZE):
    send_sock.sendto(processed[i:i+MAX_UDP_SIZE], (UDP_IP, UDP_PORT))
    if i % (1024*1024) == 0:
        time.sleep(0.001)

print("Processed data sent to PC")

# Cleanup
mm_dma.close()
mm_axil.close()
mm_tx.close()
mm_rx.close()
mm_sw.close()
os.close(fd)
send_sock.close()
recv_sock.close()
