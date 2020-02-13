################################################################################
#
# arm-gnu-a-toolchain
#
################################################################################

ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel
ARM_GNU_A_TOOLCHAIN_VERSION = 9.2-2019.12
ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
ARM_GNU_A_TOOLCHAIN_LICENSE = GPL-3.0+
ARM_GNU_A_TOOLCHAIN_LICENSE_FILES =

HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi

define HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_CMDS
    rm -rf $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
    mkdir -p $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
    cp -rf $(@D)/* $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)

    cd $(HOST_DIR)/bin && \
	for i in $(HOST_DIR)/opt/gcc-arm-none-eabi/bin/*; do \
	ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
    done

endef

$(eval $(host-generic-package))
