FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS += "u-boot-mkimage-native"

UBOOT_CONFIG_FRAGMENTS += "uboot-fragment.cfg"

SRC_URI:append = " \
    file://boot.txt \
    file://uboot-fragment.cfg \
"

do_compile:append() {
    echo "Compiling custom boot.scr..."
    mkimage -A arm -T script -C none -n 'Custom Boot Script' \
        -d ${WORKDIR}/boot.txt ${WORKDIR}/boot.scr
}

do_install:append() {
    install -m 0644 ${WORKDIR}/boot.scr ${D}/boot/boot.scr
}

do_deploy:append() {
    install -m 0644 ${WORKDIR}/boot.scr ${DEPLOYDIR}/boot.scr
}

