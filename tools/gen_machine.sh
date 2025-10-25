START_DIR=$(pwd)

cd ${ROOTDIR}/sw/arm/build

export PATH=$PATH:${ROOTDIR}/sw/arm/meta-xilinx/meta-xilinx-core/gen-machine-conf

gen-machineconf \
  --soc-family zynq \
  --hw-description "${ROOTDIR}/hw/export/1m_check.xsa" \
  -c "${ROOTDIR}/sw/arm/build/conf/" \
  -l "${ROOTDIR}/sw/arm/build/conf/local.conf" \
  --machine-name zynq_zybo

cd "$START_DIR"

  