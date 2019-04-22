Intro
=====

OrangePi RK3399 is an open source single board computer, it is RK3399 SOC
based ARM64 board.

Official Page: http://www.orangepi.org/Orange%20Pi%20RK3399/
Wiki: https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/neo4.html

Build
=====

Run NanoPi M4 configuration

  $ make orangepi_rk3399_defconfig

To build, run make comamnd.

  $ make

Files created in output directory
=================================
output/images/
├── bl31.bin
├── bl31.elf
├── Image
├── rk3399-nanopi-m4.dtb
├── rk3399-orangepi.dtb
├── rootfs.ext2
├── rootfs.ext4 -> rootfs.ext2
├── rootfs.tar
├── sdcard.img
├── u-boot.bin
├── u-boot.itb
├── u-boot-spl-dtb.bin
└── u-boot-spl-dtb.img

Creating bootable SD card:
=========================

Simply invoke (as root)

  # dd if=output/images/sdcard.img of=/dev/sdX && sync

Where X is your SD card device

Serial console
--------------
Baudrate for this board is 1500000
