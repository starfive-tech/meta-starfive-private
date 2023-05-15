SRCREV:starfive-visionfive2 = "c6a092cd80112529cb2e92e180767ff5341b22a3"
SRC_URI:starfive-visionfive2 = "git://git@192.168.110.45/sbc/opensbi.git;protocol=ssh \
                                file://visionfive2-uboot-fit-image.its \
                               "

EXTRA_OEMAKE:starfive-visionfive2 += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n CLANG_TARGET= FW_TEXT_START=0x40000000"

DEPENDS:starfive-visionfive2:append = " u-boot-tools-native dtc-native"

do_deploy:append:starfive-visionfive2() {
        install -m 0644 ${WORKDIR}/visionfive2-uboot-fit-image.its ${DEPLOYDIR}/visionfive2-uboot-fit-image.its
        cd ${DEPLOYDIR}
        mkimage -f visionfive2-uboot-fit-image.its -A riscv -O u-boot -T firmware visionfive2_fw_payload.img
}

