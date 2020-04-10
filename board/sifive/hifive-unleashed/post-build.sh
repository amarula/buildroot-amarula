#!/bin/sh

MKIMAGE=$HOST_DIR/bin/mkimage
BOARD_DIR="$(dirname $0)"

if grep -Eq "^BR2_TARGET_ROOTFS_INITRAMFS=y$" ${BR2_CONFIG}; then
	# create spi, for required images
	mkdir -p $BINARIES_DIR/spi

	# copy bootloaders
	install -m 0644 -D $BINARIES_DIR/u-boot-spl.bin $BINARIES_DIR/spi
	install -m 0644 -D $BINARIES_DIR/u-boot.itb $BINARIES_DIR/spi

	# create fit output image
	install -m 0644 -D $BOARD_DIR/kernel.its $BINARIES_DIR
	cd $BINARIES_DIR; $MKIMAGE -f kernel.its $BINARIES_DIR/spi/uImage.itb; cd - > /dev/null

	# create bootcmd for initramfs
	$MKIMAGE -A riscv -O linux -T script -C none -d $BOARD_DIR/boot_initramfs.cmd $BINARIES_DIR/spi/boot_initramfs.scr
	$MKIMAGE -A riscv -O linux -T script -C none -d $BOARD_DIR/upgrade_sf.cmd $BINARIES_DIR/spi/upgrade_sf.scr
else
	install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
fi
