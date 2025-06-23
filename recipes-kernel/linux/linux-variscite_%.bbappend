FILESEXTRAPATHS:prepend = "${THISDIR}/${PN}:"
SRC_URI:append = " file://logo_linux_clut224.ppm"

TARGET_DEFCONFIG="${B}/.config"

do_configure:prepend() {
    # Add the kernel_defconf_variable function
    kernel_defconf_variable() {
       CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
       if test "$2" = "n"
       then
           echo "# CONFIG_$1 is not set" >>  ${TARGET_DEFCONFIG}
       else
           echo "CONFIG_$1=$2" >>  ${TARGET_DEFCONFIG}
       fi
    }
    # logo support, if you supply logo_linux_clut224.ppm in SRC_URI, then it's going to be used
    if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
        install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm ${S}/drivers/video/logo/logo_linux_clut224.ppm
        kernel_defconf_variable LOGO y
        kernel_defconf_variable LOGO_LINUX_CLUT224 y
        kernel_defconf_variable LOGO_VARISCITE_CLUT224 n
    fi
}
