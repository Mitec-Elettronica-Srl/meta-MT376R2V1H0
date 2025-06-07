FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://linux_6.6.patch" 
SRC_URI += "file://defconfig"

# use the "defconfig" file
KBUILD_DEFCONFIG:imx8mm-var-dart = ""

KERNEL_SRC = "git://github.com/Mitec-Elettronica-Srl/linux-imx.git;protocol=https"
SRCBRANCH:imx8mm-var-dart = "experiment"
SRCREV:imx8mm-var-dart = "07a44d9f4b21a2fe7a4063483d970acde34414d5"
