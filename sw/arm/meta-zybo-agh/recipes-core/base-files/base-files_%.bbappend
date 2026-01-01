FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://99-udp-buffer.conf \
    file://10-end0.network \
"

do_install:append() {
    install -d ${D}${sysconfdir}/sysctl.d
    install -m 0644 ${WORKDIR}/99-udp-buffer.conf \
        ${D}${sysconfdir}/sysctl.d/
    
    install -d ${D}/etc/systemd/network
    install -m 0644 ${WORKDIR}/10-end0.network \
        ${D}/etc/systemd/network/
}
