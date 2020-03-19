################################################################################
#
# python-llvmlite
#
################################################################################

PYTHON_LLVMLITE_VERSION = 0.31.0
PYTHON_LLVMLITE_SOURCE = llvmlite-$(PYTHON_LLVMLITE_VERSION).tar.gz
PYTHON_LLVMLITE_SITE = $(call github,numba,llvmlite,v$(PYTHON_LLVMLITE_VERSION))
PYTHON_LLVMLITE_SETUP_TYPE = setuptools
PYTHON_LLVMLITE_LICENSE = BSD
PYTHON_LLVMLITE_LICENSE_FILES = LICENSE
PYTHON_LLVMLITE_INSTALL_STAGING = YES
PYTHON_LLVMLITE_DEPENDENCIES = llvm

$(eval $(python-package))
