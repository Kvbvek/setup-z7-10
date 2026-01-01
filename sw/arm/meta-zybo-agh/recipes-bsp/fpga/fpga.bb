LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
FILESEXTRAPATHS:append := "${THISDIR}/files:"
 
SRC_URI := " \
    file://fpga.bin \
"
 
S = "${WORKDIR}"
 
FILES:${PN} += "/boot/fpga.bin"
 
do_install() {
    install -d ${D}/boot
    install -m 0644 ${S}/fpga.bin ${D}/boot/
}
 
