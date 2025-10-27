#!/bin/bash

# =========================================================

XILINX_INSTALL_DIR="/tools/Xilinx"
PETALINUX_INSTALL_DIR="$HOME"

VIVADO_VERSION="2022.1"
VITIS_VERSION="2022.1"
PETALINUX_VERSION="2022.1"

# =========================================================

export ROOTDIR=$(pwd)

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

cd ${ROOTDIR}/sw/arm

if [ ! -d build ]; then

    . poky/oe-init-build-env

    cat <<-EOF >> conf/local.conf
HDF_FILE = "<../../../../hw/export/zybo-agh.xsa>"
XILINX_WITH_ESW = "xsct"
XILINX_XSCT_VERSION = "2023.1"
XILINX_SDK_TOOLCHAIN = "/tools/Xilinx/Vitis/2022.1"
DISTRO = "zybo-agh-poky"
IMAGE_FSTYPES += "wic"
WKS_FILES = "xilinx-default-sd.wks"
EOF

    bitbake-layers add-layer ../meta-arm/meta-arm-toolchain
    bitbake-layers add-layer ../meta-arm/meta-arm
    bitbake-layers add-layer ../meta-openembedded/meta-oe
    bitbake-layers add-layer ../meta-openembedded/meta-python
    bitbake-layers add-layer ../meta-xilinx/meta-xilinx-core
    bitbake-layers add-layer ../meta-xilinx/meta-xilinx-bsp
    bitbake-layers add-layer ../meta-xilinx/meta-xilinx-standalone
    bitbake-layers add-layer ../meta-xilinx-tools
    bitbake-layers add-layer ../meta-zybo-agh

else
    . poky/oe-init-build-env
    echo "'build' directory exists, skipping conf"
fi

cd ${ROOTDIR}
