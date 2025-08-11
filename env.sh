#!/bin/bash

# =========================================================
# This script sources the settings for Vivado, PetaLinux,
# and Vitis to configure the environment.
# Update the paths and versions as needed.
# =========================================================

XILINX_INSTALL_DIR="/tools/Xilinx"
PETALINUX_INSTALL_DIR="$HOME"

VIVADO_VERSION="2022.1"
VITIS_VERSION="2022.1"
PETALINUX_VERSION="2022.1"

# =========================================================

echo "Sourcing environment settings for Xilinx tools..."

VIVADO_SETTINGS_PATH="${XILINX_INSTALL_DIR}/Vivado/${VIVADO_VERSION}/settings64.sh"
if [ -f "${VIVADO_SETTINGS_PATH}" ]; then
    echo "  - Sourcing Vivado ${VIVADO_VERSION}..."
    source "${VIVADO_SETTINGS_PATH}"
else
    echo "  - ERROR: Vivado settings file not found at ${VIVADO_SETTINGS_PATH}"
fi

VITIS_SETTINGS_PATH="${XILINX_INSTALL_DIR}/Vitis/${VITIS_VERSION}/settings64.sh"
if [ -f "${VITIS_SETTINGS_PATH}" ]; then
    echo "  - Sourcing Vitis ${VITIS_VERSION}..."
    source "${VITIS_SETTINGS_PATH}"
else
    echo "  - ERROR: Vitis settings file not found at ${VITIS_SETTINGS_PATH}"
fi

PETALINUX_SETTINGS_PATH="${PETALINUX_INSTALL_DIR}/petalinux/${PETALINUX_VERSION}/settings.sh"
if [ -f "${PETALINUX_SETTINGS_PATH}" ]; then
    echo "  - Sourcing PetaLinux ${PETALINUX_VERSION}..."
    source "${PETALINUX_SETTINGS_PATH}"
else
    echo "  - ERROR: PetaLinux settings file not found at ${PETALINUX_SETTINGS_PATH}"
fi
