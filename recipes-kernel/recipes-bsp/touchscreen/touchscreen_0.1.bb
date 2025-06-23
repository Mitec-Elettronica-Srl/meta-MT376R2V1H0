SUMMARY = "Touchscreen configuration"
DESCRIPTION = "The touchscreen on the mt376r2v1h0"
LICENSE = "GPLv2"

SRC_URI += " \
    file://touch.rules \
"

DEPENDS += " udev"
RDEPENDS:${PN}:append = " base-files"

#S = "${WORKDIR}"

do_install:append () {
    install -m 0755 ${WORKDIR}/touch.rules ${D}/usr/lib/udev/rules.d/90-touch.rules
}

COMPATIBLE_MACHINE = "(imx6ul-var-dart|imx7-var-som|imx8mm-var-dart|imx8mn-var-som|imx8mq-var-dart|imx8qm-var-som|imx8qxp-var-som|imx8qxpb0-var-som|imx8mp-var-dart)"
