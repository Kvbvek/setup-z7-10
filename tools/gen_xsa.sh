#!/bin/bash

START_DIR=$(pwd)

HW_DIR="$ROOTDIR/hw"
VIVADO_DIR="$HW_DIR/vivado"

cd "$VIVADO_DIR"
vivado -mode batch -source "$HW_DIR/scripts/gen_xsa.tcl" \
       -tclargs "$HW_DIR" \
       -log "$VIVADO_DIR/bitstream.log" -nojournal

cd "$START_DIR"
