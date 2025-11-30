#!/bin/bash

START_DIR=$(pwd)
HW_DIR="$ROOTDIR/hw"

echo "HW_DIR         = $HW_DIR"

cd "$HW_DIR"
vivado -mode batch -source "$HW_DIR/scripts/create_project.tcl" \
                   -tclargs "$HW_DIR" \
                   -log "$HW_DIR/build.log" -nojournal

cd "$START_DIR"

