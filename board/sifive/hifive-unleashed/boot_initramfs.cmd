setenv bootargs console=ttySIF0 root=/dev/ram rootwait rw

sf read $kernel_addr_r 0x525000 0xe00000
bootm $kernel_addr_r
