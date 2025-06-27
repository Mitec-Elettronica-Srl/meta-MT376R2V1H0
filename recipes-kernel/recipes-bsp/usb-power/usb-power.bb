SUMMARY = "USB power service"
DESCRIPTION = "Manage USB power on the mt376r2v1h0"
LICENSE = "GPLv2"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://power-usb1.service \
    file://power-usb2.service \
"

PROVIDES = "mt376r2v1h0-usbpower"
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

COMPATIBLE_MACHINE = "(imx6ul-var-dart|imx7-var-som|imx8mm-var-dart|imx8mn-var-som|imx8mq-var-dart|imx8qm-var-som|imx8qxp-var-som|imx8qxpb0-var-som|imx8mp-var-dart)"
