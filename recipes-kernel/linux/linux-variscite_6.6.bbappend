FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://defconfig"

# use the "defconfig" file
KBUILD_DEFCONFIG:imx8mm-var-dart = ""

KERNEL_SRC = "git://github.com/Mitec-Elettronica-Srl/linux-imx.git;protocol=https"
SRCBRANCH:imx8mm-var-dart = "scarthgap"
SRCREV:imx8mm-var-dart = "dac18e7d347be986d8a3e7df6b18d3df4399dec3"
