FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://power-usb1.service \
    file://power-usb2.service \
"

DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','systemd',' systemd',' update-rc.d-native',d)}"

RDEPENDS:${PN} = "\
    base-files \
    var-gpio-utils \
"

do_install:append () {
    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
        install -d ${D}${systemd_unitdir}/system
        install -m 0644 ${WORKDIR}/power-usb1.service ${D}${systemd_unitdir}/system
        install -m 0644 ${WORKDIR}/power-usb2.service ${D}${systemd_unitdir}/system
    else
        #install -d ${D}${sysconfdir}/init.d
        #install -m 0755 ${WORKDIR}/bluealsa ${D}${sysconfdir}/init.d
        #update-rc.d -r ${D} bluealsa defaults
    fi
}