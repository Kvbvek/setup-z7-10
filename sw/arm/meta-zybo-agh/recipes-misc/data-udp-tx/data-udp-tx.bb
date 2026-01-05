SUMMARY = "My custom python script"
LICENSE = "MIT"
LIC_FILES_CHKSUM = " \
    file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
"

FILESEXTRAPATHS:append := "${THISDIR}/files:"

SRC_URI:append := " \
    file://data-udp-tx.py \
"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 data-udp-tx.py ${D}${bindir}/data-udp-tx
}

RDEPENDS:${PN} = "python3-core"
