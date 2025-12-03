FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS += "u-boot-mkimage-native"

UBOOT_CONFIG_FRAGMENTS += "uboot-fragment.cfg"

SRC_URI:append = " \
    file://boot.txt \
    file://fpga.bin \
    file://uboot-fragment.cfg \
"

do_compile:append() {
    mkimage -A arm -O linux -T script -C none \
        -n "Boot Script" \
        -d ${WORKDIR}/boot.txt ${WORKDIR}/boot.scr
}

do_deploy:append() {
    install -m 0644 ${WORKDIR}/fpga.bin ${DEPLOYDIR}/fpga.bin
}

