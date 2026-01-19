FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://defconfig \
    file://lto.cfg \
"

# use the "defconfig" file
KBUILD_DEFCONFIG:imx8mm-var-dart = ""

LINUX_VERSION = "6.6.53"

LINUX_VERSION_EXTENSION = "-mt376r2v1h0"

KERNEL_SRC = "git://github.com/Mitec-Elettronica-Srl/linux-imx.git;protocol=https"
SRCBRANCH:imx8mm-var-dart = "scarthgap"
SRCREV:imx8mm-var-dart = "e23f781587d45b51fa48fbe036770a12a93c5a9b"

do_compile:prepend:toolchain-clang() {
	export LLVM_IAS=1
}

do_compile_kernelmodules:prepend:toolchain-clang() {
	export LLVM_IAS=1
}
