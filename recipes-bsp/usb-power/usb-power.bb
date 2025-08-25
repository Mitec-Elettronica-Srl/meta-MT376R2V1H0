SUMMARY = "USB power service"
DESCRIPTION = "Manage USB power on the mt376r2v1h0"
LICENSE = "CLOSED"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://power-usb1.service \
    file://power-usb2.service \
"

PROVIDES = "mt376r2v1h0-usbpower"
DEPENDS += " systemd"

RDEPENDS:${PN} = "\
    systemd \
    base-files \
    var-gpio-utils \
"

FILES:${PN} += " \
    ${systemd_unitdir}/system/power-usb1.service \
    ${systemd_unitdir}/system/power-usb2.service \
    ${sysconfdir}/systemd/system/multi-user.target.wants/power-usb1.service \
    ${sysconfdir}/systemd/system/multi-user.target.wants/power-usb2.service \
"

do_install:append () {
    install -d ${D}/${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/power-usb1.service ${D}/${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/power-usb2.service ${D}/${systemd_unitdir}/system

    ln -sf ${systemd_unitdir}/system/power-usb1.service \
        ${D}/${sysconfdir}/systemd/system/multi-user.target.wants/power-usb1.service
    ln -sf ${systemd_unitdir}/system/power-usb2.service \
        ${D}/${sysconfdir}/systemd/system/multi-user.target.wants/power-usb2.service
}

COMPATIBLE_MACHINE = "(imx6ul-var-dart|imx7-var-som|imx8mm-var-dart|imx8mn-var-som|imx8mq-var-dart|imx8qm-var-som|imx8qxp-var-som|imx8qxpb0-var-som|imx8mp-var-dart)"
