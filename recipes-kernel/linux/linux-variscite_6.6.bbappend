FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://defconfig"

# use the "defconfig" file
KBUILD_DEFCONFIG:imx8mm-var-dart = ""

LINUX_VERSION = "6.6.53"

LINUX_VERSION_EXTENSION = "-mt376r2v1h0"

KERNEL_SRC = "git://github.com/Mitec-Elettronica-Srl/linux-imx.git;protocol=https"
SRCBRANCH:imx8mm-var-dart = "scarthgap"
SRCREV:imx8mm-var-dart = "ba018ed802cab693f50baf1107a16abe42e2e2af"
