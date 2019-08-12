setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait rw cma=128M

mmc dev 0
fatload mmc 0 $kernel_addr_r zImage
fatload mmc 0 $fdt_addr_r sun8i-r16-bananapi-m2m.dtb

bootz $kernel_addr_r - $fdt_addr_r
