FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS += "u-boot-mkimage-native"

UBOOT_CONFIG_FRAGMENTS += "uboot-fragment.cfg"

SRC_URI += " file://boot.txt"
SRC_URI += " file://fpga.bin"
SRC_URI += " file://uboot-fragment.cfg"

do_compile:append() {
    mkimage -A arm -O linux -T script -C none \
        -n "Boot Script" \
        -d ${WORKDIR}/boot.txt ${WORKDIR}/boot.scr
}

do_install:append() {
    install -d ${D}/boot
    install -m 0644 ${WORKDIR}/boot.scr ${D}/boot/boot.scr
    install -m 0644 ${WORKDIR}/fpga.bin ${D}/boot/fpga.bin
}

FILES:${PN} += "/boot/boot.scr"
FILES:${PN} += "/boot/fpga.bin"
FILES:${PN} += "/boot/*"
