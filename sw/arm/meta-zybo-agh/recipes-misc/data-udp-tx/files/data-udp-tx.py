#!/usr/bin/env python3
import os, mmap, struct, time, socket
import numpy as np

# DMA and DDR configuration
DMA_BASE = 0x40400000
MAP_SIZE = 0x10000

TX_BUF_ADDR = 0x0A000000
RX_BUF_ADDR = 0x0B000000
BUF_SIZE = 8 * 1024 * 1024

# S2MM (Device->Memory) registers
S2MM_DMACR   = 0x30
S2MM_DMASR   = 0x34
S2MM_DA      = 0x48
S2MM_LENGTH  = 0x58

# MM2S (Memory->Device) registers
MM2S_DMACR   = 0x00
MM2S_DMASR   = 0x04
MM2S_SA      = 0x18
MM2S_LENGTH  = 0x28

# AXI-Lite configuration
AXIL_BASE    = 0x40000000
AXIL_CONTROL = 0x00
AXIL_LENGTH  = 0x04

# AXI Switch IP configuration 
SWITCH_BASE    = 0x43C00000
SWITCH_COMMIT = 0x00
SWITCH_COMMIT_WRITE = 0x2
SWITCH_MUX  = 0x40
SWITCH_GEN_SRC  = 0x0
SWITCH_MOD_SRC  = 0x1

# UDP configuration
UDP_IP = "192.168.3.1"   # PC address
UDP_PORT = 5005

# Sockets
send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
recv_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
recv_sock.bind(("0.0.0.0", UDP_PORT))

# Open /dev/mem and map regions
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

sw_wr(SWITCH_MUX, SWITCH_GEN_SRC)
sw_wr(SWITCH_COMMIT, SWITCH_COMMIT_WRITE)

# 1) Existing flow: fill DDR from generator and send to PC (unchanged)
print("Reset S2MM DMA (initial generator->DDR)...")
dma_wr(S2MM_DMACR, 0x4)
time.sleep(0.01)
dma_wr(S2MM_DMACR, 0x1)

# Ensure S2MM writes to RX_BUF_ADDR
dma_wr(S2MM_DA, RX_BUF_ADDR)

transfer_len = BUF_SIZE
num_words = transfer_len // 4
print(f"AXI-Lite: LENGTH = {num_words} words")
axil_wr(AXIL_LENGTH, num_words)

print("AXI-Lite: ENABLE = 1")
axil_wr(AXIL_CONTROL, 1)

print("Starting initial S2MM...")
dma_wr(S2MM_LENGTH, transfer_len)

# Wait for S2MM completion
while True:
    if dma_rd(S2MM_DMASR) & 0x0002:
        break
    time.sleep(0.001)

print("Initial S2MM completed.")
axil_wr(AXIL_CONTROL, 0)

# Send buffer to PC via UDP
print("Sending buffer to PC via UDP...")
mm_rx.seek(0)
buf = mm_rx.read(transfer_len)

MAX_UDP_SIZE = 1024
send_sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 8 * 1024 * 1024)

for i in range(0, len(buf), MAX_UDP_SIZE):
    send_sock.sendto(buf[i:i + MAX_UDP_SIZE], (UDP_IP, UDP_PORT))
    time.sleep(0.001)

print(f"Sent {transfer_len} bytes to {UDP_IP}:{UDP_PORT}")

# ---------------------------
# 2) Receive echoed buffer back from PC
# ---------------------------
print("\nWaiting to receive echoed data back from PC...")
received = 0
rx_buf = bytearray(BUF_SIZE)

while received < BUF_SIZE:
    data, addr = recv_sock.recvfrom(65535)
    count = len(data)
    end = received + count
    if end > BUF_SIZE:
        end = BUF_SIZE
        count = end - received
        data = data[:count]
    rx_buf[received:end] = data
    received = end

print("Received full echoed buffer from PC.")

# Print sample values
arr = np.frombuffer(rx_buf, dtype=np.uint32)
print("First 5 values (received):", arr[:5])
print("Last 5 values (received):", arr[-5:])

# 3) Write received data into DDR (source for MM2S)
print("Writing received data into DDR at BUF_ADDR...")
mm_tx.seek(0)
mm_tx.write(rx_buf)
# mm_ddr.flush()
os.sync()
time.sleep(0.01)

sw_wr(SWITCH_MUX, SWITCH_MOD_SRC)
sw_wr(SWITCH_COMMIT, SWITCH_COMMIT_WRITE)


#    We start S2MM before MM2S to ensure it's ready to receive data.
print("Reset S2MM DMA for capture...")
dma_wr(S2MM_DMACR, 0x4)
dma_wr(MM2S_DMACR, 0x4)

time.sleep(0.01)

dma_wr(S2MM_DMACR, 0x1)
dma_wr(MM2S_DMACR, 0x1)

dma_wr(S2MM_DA, RX_BUF_ADDR)
dma_wr(S2MM_LENGTH, transfer_len)

dma_wr(MM2S_SA, TX_BUF_ADDR)
dma_wr(MM2S_LENGTH, transfer_len)

# Wait for MM2S IOC
print("Waiting for MM2S completion...")
while True:
    # print("\nLive status:")
    # print(f"step {i}: MM2S_DMASR =", hex(dma_rd(MM2S_DMASR)))
    # time.sleep(0.1)
    if dma_rd(MM2S_DMASR) & 0x0002:
        break
    time.sleep(0.001)

print("MM2S completed!")


print("Waiting for S2MM completion (processed data)...")
# wait for S2MM IOC
while True:
    # print("\nLive status:")
    # print(f"step {i}: S2MM_DMASR =", hex(dma_rd(S2MM_DMASR)))
    # time.sleep(0.1)
    if dma_rd(S2MM_DMASR) & 0x0002:
        break
    time.sleep(0.001)

print("S2MM (capture) completed.")

# 8) Read back processed data from DDR and send to PC via UDP
print("Reading back processed data from DDR and sending to PC...")

mm_rx.seek(0)
processed = mm_rx.read(transfer_len)

# Show sample processed values (uint32)
arr_proc = np.frombuffer(processed, dtype=np.uint32)
print("First 5 values (processed):", arr_proc[:5])
print("Last 5 values (processed):", arr_proc[-5:])

# Send processed data back to PC
for i in range(0, len(processed), MAX_UDP_SIZE):
    send_sock.sendto(processed[i:i + MAX_UDP_SIZE], (UDP_IP, UDP_PORT))
    time.sleep(0.001)

print("Processed data sent back to PC.")

# Cleanup
mm_dma.close()
mm_axil.close()
mm_rx.close()
mm_tx.close()
mm_sw.close()
os.close(fd)
send_sock.close()
recv_sock.close()
