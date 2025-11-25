START_DIR=$(pwd)

cd ${ROOTDIR}/sw/arm/build
bitbake kconfig-frontends-native

export PATH=$PATH:${ROOTDIR}/sw/arm/meta-xilinx/meta-xilinx-core/gen-machine-conf

gen-machineconf \
  --soc-family zynq \
  --hw-description "${ROOTDIR}/hw/zybo-agh/zybo-agh.xsa" \
  -c "${ROOTDIR}/sw/arm/build/conf/" \
  -l "${ROOTDIR}/sw/arm/build/conf/local.conf" \
  --machine-name zybo-agh \
  --native-sysroot "${ROOTDIR}/sw/arm/build/tmp/sysroots-components/x86_64/kconfig-frontends-native"

cd "$START_DIR"

  