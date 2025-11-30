#!/bin/bash

START_DIR=$(pwd)

HW_DIR="$ROOTDIR/hw"

cd "$HW_DIR/zybo-agh"
vivado -mode batch -source "$HW_DIR/scripts/generate_bitstream.tcl" \
       -tclargs "$HW_DIR" \
       -log "$HW_DIR/bitstream.log" -nojournal

cd "$START_DIR"
