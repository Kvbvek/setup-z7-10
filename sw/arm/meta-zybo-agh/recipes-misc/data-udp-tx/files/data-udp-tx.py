#!/usr/bin/env python3
import os, mmap, struct, time, socket
import numpy as np

# DMA and DDR configuration
DMA_BASE = 0x40400000
MAP_SIZE = 0x10000

BUF_ADDR = 0x0A000000
BUF_SIZE = 8 * 1024 * 1024

S2MM_DMACR   = 0x30
S2MM_DMASR   = 0x34
S2MM_DA      = 0x48
S2MM_LENGTH  = 0x58

# AXI-Lite configuration
AXIL_BASE    = 0x40000000
AXIL_CONTROL = 0x00
AXIL_LENGTH  = 0x04
AXIL_SEL     = 0x08

# UDP configuration
UDP_IP = "192.168.3.1"   # PC address
UDP_PORT = 5005

# Sender socket (used only to send)
send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Receiver socket (separate socket, bound to listen)
recv_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
recv_sock.bind(("0.0.0.0", UDP_PORT))

# Open /dev/mem
fd = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)

mm_dma = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=DMA_BASE)

mm_axil = mmap.mmap(fd, MAP_SIZE, mmap.MAP_SHARED,
                    mmap.PROT_READ | mmap.PROT_WRITE, offset=AXIL_BASE)

mm_ddr = mmap.mmap(fd, BUF_SIZE, mmap.MAP_SHARED,
                   mmap.PROT_READ | mmap.PROT_WRITE, offset=BUF_ADDR)


# Helpers
def dma_wr(off, val):
    struct.pack_into("<I", mm_dma, off, val)

def dma_rd(off):
    return struct.unpack_from("<I", mm_dma, off)[0]

def axil_wr(off, val):
    struct.pack_into("<I", mm_axil, off, val)


# DMA reset
print("Reset DMA...")
dma_wr(S2MM_DMACR, 0x4)
time.sleep(0.01)
dma_wr(S2MM_DMACR, 0x1)
dma_wr(S2MM_DA, BUF_ADDR)

# AXI-LITE configuration

print("Setting SEL = 0 (data generator)")
axil_wr(AXIL_SEL, 0)

transfer_len = BUF_SIZE
max_value = int(transfer_len / 4)

print(f"Setting AXI-Lite LENGTH = {max_value} words")
axil_wr(AXIL_LENGTH, max_value)

print("ENABLE = 1 (AXI-Lite CONTROL)")
axil_wr(AXIL_CONTROL, 1)


# DMA START
dma_wr(S2MM_DA, BUF_ADDR)
dma_wr(S2MM_LENGTH, transfer_len)

print("Waiting for DMA...")
while True:
    if dma_rd(S2MM_DMASR) & 0x0002:   # IOC_Irq
        break
    time.sleep(0.001)

print("DMA completed")

print("ENABLE = 0")
axil_wr(AXIL_CONTROL, 0)


# SEND BUFFER TO PC OVER UDP
print("Sending buffer via UDP...")

mm_ddr.seek(0)
buf = mm_ddr.read(transfer_len)

MAX_UDP_SIZE = 1024
send_sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 8 * 1024 * 1024)

for i in range(0, len(buf), MAX_UDP_SIZE):
    send_sock.sendto(buf[i:i + MAX_UDP_SIZE], (UDP_IP, UDP_PORT))
    time.sleep(0.001)

print(f"Sent {transfer_len} bytes ({transfer_len/1024:.1f} KB) to {UDP_IP}:{UDP_PORT}")


# RECEIVE ECHOED BUFFER BACK FROM PC
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

print("\nReceived full echoed buffer!")

# PRINT FIRST AND LAST VALUES
arr = np.frombuffer(rx_buf, dtype=np.uint32)

print("\nFirst 5 values:", arr[:5])
print("Last 5 values:", arr[-5:])


# Cleanup
mm_dma.close()
mm_axil.close()
mm_ddr.close()
os.close(fd)
send_sock.close()
recv_sock.close()
