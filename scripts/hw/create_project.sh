#!/bin/bash

XILINX_INSTALL_DIR="/tools/Xilinx"
VIVADO_VERSION="2022.1"

SCRIPT_DIR=$(pwd)
PROJ_DIR="$(realpath "$SCRIPT_DIR/../..")"
HW_DIR="$PROJ_DIR/hw"
VIVADO_DIR="$HW_DIR/vivado"

echo "SCRIPT_DIR     = $SCRIPT_DIR"
echo "HW_DIR         = $HW_DIR"
echo "VIVADO_DIR     = $VIVADO_DIR"

VIVADO_SETTINGS_PATH="${XILINX_INSTALL_DIR}/Vivado/${VIVADO_VERSION}/settings64.sh"
if [ -f "${VIVADO_SETTINGS_PATH}" ]; then
    echo "  - Sourcing Vivado ${VIVADO_VERSION}..."
    source "${VIVADO_SETTINGS_PATH}"
else
    echo "  - ERROR: Vivado settings file not found at ${VIVADO_SETTINGS_PATH}"
fi

cd "$VIVADO_DIR"
vivado -mode batch -source "$SCRIPT_DIR/create_project.tcl" \
                   -tclargs "$HW_DIR" \
                   -log "$VIVADO_DIR/build.log" -nojournal

cd "$SCRIPT_DIR"

