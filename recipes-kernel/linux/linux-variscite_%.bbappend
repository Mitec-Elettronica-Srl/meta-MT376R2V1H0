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

    kernel_defconf_variable CONFIG_OVERLAY_FS y
    kernel_defconf_variable CONFIG_BTRFS_FS y
    kernel_defconf_variable CONFIG_BTRFS_FS_POSIX_ACL y
    kernel_defconf_variable CONFIG_BTRFS_FS_CHECK_INTEGRITY n
    kernel_defconf_variable CONFIG_BTRFS_FS_RUN_SANITY_TESTS n
    kernel_defconf_variable CONFIG_BTRFS_DEBUG n
    kernel_defconf_variable CONFIG_BTRFS_ASSERT n
    kernel_defconf_variable CONFIG_BTRFS_FS_REF_VERIFY n

    # security features
    kernel_defconf_variable CONFIG_ARM64_SW_TTBR0_PAN y

    # Software Shadow Stack or PAC
    kernel_defconf_variable CONFIG_SHADOW_CALL_STACK y
    kernel_defconf_variable CONFIG_UNWIND_PATCH_PAC_INTO_SCS y
    
    # Pointer authentication (ARMv8.3 and later). If hardware actually supports
    # it, one can turn off CONFIG_STACKPROTECTOR_STRONG with this enabled.
    kernel_defconf_variable CONFIG_ARM64_PTR_AUTH y
    kernel_defconf_variable CONFIG_ARM64_PTR_AUTH_KERNEL y
    
    # Available in ARMv8.5 and later.
    kernel_defconf_variable CONFIG_ARM64_BTI y
    kernel_defconf_variable CONFIG_ARM64_BTI_KERNEL y
    kernel_defconf_variable CONFIG_ARM64_MTE y
    kernel_defconf_variable CONFIG_KASAN_HW_TAGS y
    kernel_defconf_variable CONFIG_ARM64_E0PD y
    
    # Available in ARMv8.7 and later.
    kernel_defconf_variable CONFIG_ARM64_EPAN y
}
