require sd-image.inc

DEPENDS:starfive-visionfive2 += "opensbi starfive-tool-native"
DEPENDS:starfive-jh8100 += "u-boot-starfive"

# Generate QSPI firmware & SD rootfs for Dubhe (NFS rootfs will be auto-generated by default IMAGE_FSTYPES, which is tar.gz)
IMAGE_FSTYPES:starfive-dubhe += "\
	qspi \
	qspi_sd \
	tar.gz \
	"

IMAGE_TYPEDEP:qspi_sd = "ext4 wic wic.gz wic.bmap"

do_image_qspi[depends] += "\
	deploy-bootfiles:do_deploy \
	u-boot-starfive:do_deploy \
	dubhe-image-initramfs:do_rootfs \
        "

IMAGE_FEATURES += " allow-empty-password empty-root-password"

IMAGE_INSTALL += " \
	packagegroup-starfive-essentials \
	systemd-analyze \
	e2fsprogs-resize2fs \
	parted \
        "

IMAGE_INSTALL:starfive-dubhe += "\
	packagegroup-core-boot \
	${CORE_IMAGE_EXTRA_INSTALL} \
	packagegroup-starfive-essentials \
	packagegroup-starfive-dubhe-essentials \
	"

IMAGE_INSTALL:starfive-jh8100 += "\
	i3c-tools \
	"

TOOLCHAIN_TARGET_TASK += "packagegroup-starfive-toolchain"

# Generate a boot firmware image that contains bootcode, bootjump, U-Boot SPL, U-Boot proper & OpenSBI
IMAGE_CMD:qspi() {
	dd if=${DEPLOY_DIR_IMAGE}/bootcode.bin of=${DEPLOY_DIR_IMAGE}/${MACHINE}-qspi-firmware.bin bs=32 seek=0 count=128
	dd if=${DEPLOY_DIR_IMAGE}/bootjump.bin of=${DEPLOY_DIR_IMAGE}/${MACHINE}-qspi-firmware.bin bs=32 seek=128 count=128
	dd if=${DEPLOY_DIR_IMAGE}/u-boot-spl.bin of=${DEPLOY_DIR_IMAGE}/${MACHINE}-qspi-firmware.bin bs=32 seek=256 count=8192
	dd if=${DEPLOY_DIR_IMAGE}/u-boot.itb of=${DEPLOY_DIR_IMAGE}/${MACHINE}-qspi-firmware.bin bs=32 seek=8448 count=32768
}

# Generate SD image using bmaptool
IMAGE_CMD:qspi_sd() {
	cd ${IMGDEPLOYDIR}
	bmaptool copy ${PN}-${MACHINE}.wic.gz ${DEPLOY_DIR_IMAGE}/Image-sd-${MACHINE}.img
}

# Set image naming as such: Image-<boot_mode>-<machine>
#   Image-initramfs-starfive-dubhe (initramfs boot)
#   Image-nfs-starfive-dubhe       (NFS boot)
#   Image-sd-starfive-dubhe        (SD boot)

# Create an output folder for all machine variations across Dubhe series
do_create_output_folder() {
}
do_create_output_folder:starfive-dubhe() {
        rm -rf ${DEPLOY_DIR_IMAGE}/Dubhe-*0

        mkdir -p ${DEPLOY_DIR_IMAGE}/Dubhe-80
        cp ${DEPLOY_DIR_IMAGE}/${MACHINE}-qspi-firmware.bin ${DEPLOY_DIR_IMAGE}/Dubhe-80
        cp ${DEPLOY_DIR_IMAGE}/Image ${DEPLOY_DIR_IMAGE}/Dubhe-80
        cp ${DEPLOY_DIR_IMAGE}/Image-initramfs-${MACHINE}.bin ${DEPLOY_DIR_IMAGE}/Dubhe-80
        cp ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.tar.gz ${DEPLOY_DIR_IMAGE}/Dubhe-80/Image-nfs-${MACHINE}.tar.gz
        cp ${DEPLOY_DIR_IMAGE}/Image-sd-${MACHINE}.img ${DEPLOY_DIR_IMAGE}/Dubhe-80

        cp -r ${DEPLOY_DIR_IMAGE}/Dubhe-80 ${DEPLOY_DIR_IMAGE}/Dubhe-90

        cp ${DEPLOY_DIR_IMAGE}/dubhe80_fpga.dtb ${DEPLOY_DIR_IMAGE}/Dubhe-80/dubhe_fpga.dtb
        cp ${DEPLOY_DIR_IMAGE}/dubhe90_fpga.dtb ${DEPLOY_DIR_IMAGE}/Dubhe-90/dubhe_fpga.dtb
}
addtask do_create_output_folder before do_populate_lic_deploy after do_image_complete
