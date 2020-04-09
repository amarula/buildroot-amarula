SiFive HiFive Unleashed
=======================

This file describes how to use the pre-defined Buildroot
configuration for the SiFive HiFive Unleashed board.

Further information about the HiFive Unleashed board can be found
at https://www.sifive.com/boards/hifive-unleashed

Building
========

Configure Buildroot using the default board configuration:

  $ make hifive_unleashed_defconfig

Customise the build as necessary:

  $ make menuconfig

Start the build:

  $ make

Result of the build
===================

Once the build has finished you will have the following files:

    output/images/
    +-- fw_jump.bin
    +-- fw_jump.elf
    +-- fw_dynamic.bin
    +-- fw_dynamic.elf
    +-- u-boot-spl.bin
    +-- u-boot.itb
    +-- Image
    +-- rootfs.ext2
    +-- rootfs.ext4
    +-- rootfs.tar
    +-- sdcard.img

Booting from MMC on the board
=============================

Buildroot builds a SD card image for you. All you need to do is dd the
image to your SD card, which can be done with the following command:

  $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0

Make sure that the DIP switches MSEL[3:0] are set to 1011 for booting
from MMC. Insert the SD card and power up the board.

Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).

You will get a warning reported by fdisk when you examine the SD card.
This is because the genimage.cfg file doesn't specify the SD card size
(as people will naturally have different sized cards), so the
secondary GPT header is placed after the rootfs rather than at the end
of the disk where it is expected to be.

You will see something like this at boot time:

[    2.318722] GPT:Primary header thinks Alt. header is not at the end of the disk.
[    2.325390] GPT:190496 != 122142719
[    2.328843] GPT:Alternate GPT header not at the end of the disk.
[    2.334824] GPT:190496 != 122142719
[    2.338302] GPT: Use GNU Parted to correct GPT errors.
[    2.343456]  mmcblk0: p1 p2

Documentation
=============
See the 'SiFive HiFive Unleashed Getting Started Guide' for
more details (https://www.sifive.com/documentation).

See the Amarula Solutions BSP sifive wiki for information of
usage and indetail steps.
https://wiki.amarulasolutions.com/bsp/riscv/sifive/hifive-unleashed.html
