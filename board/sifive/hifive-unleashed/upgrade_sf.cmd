echo Probe flash
sf probe

echo Program loader1
sf erase 0x5000 0x100000
if tftpboot $kernel_addr_r u-boot-spl.bin ; then
else
	echo file u-boot-spl.bin not found in mmc 0:3
	exit
fi
sf write $kernel_addr_r 0x5000 $filesize

echo Program loader2
sf erase 0x105000 0x100000
if tftpboot $kernel_addr_r u-boot.itb ; then
else
	echo file u-boot.itb not found in mmc 0:3
	exit
fi
sf write $kernel_addr_r 0x105000 $filesize

echo Program uImage.itb
sf erase 0x525000 0xE00000
if tftpboot $kernel_addr_r uImage.itb ; then
else
	echo file uImage.itb not found in mmc 0:3
	exit
fi
sf write $kernel_addr_r 0x525000 $filesize

echo Program boot_initramfs.scr
sf erase 0x1FFF000 0x1000
if tftpboot $kernel_addr_r boot_initramfs.scr ; then
else
	echo file boot_initramfs.scr not found in mmc 0:3
	exit
fi
sf write $kernel_addr_r 0x1FFF000 $filesize

echo Done!
