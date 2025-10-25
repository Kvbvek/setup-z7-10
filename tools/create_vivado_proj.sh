#!/bin/bash

START_DIR=$(pwd)
HW_DIR="$ROOTDIR/hw"
VIVADO_DIR="$HW_DIR/vivado"

echo "HW_DIR         = $HW_DIR"
echo "VIVADO_DIR     = $VIVADO_DIR"

cd "$VIVADO_DIR"
vivado -mode batch -source "$HW_DIR/scripts/create_project.tcl" \
                   -tclargs "$HW_DIR" \
                   -log "$VIVADO_DIR/build.log" -nojournal

cd "$START_DIR"

