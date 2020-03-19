################################################################################
#
# python-numba
#
################################################################################

PYTHON_NUMBA_VERSION = 0.48.0
PYTHON_NUMBA_SOURCE = numba-$(PYTHON_NUMBA_VERSION).tar.gz
PYTHON_NUMBA_SITE = https://pypi.python.org/packages/c3/81/453926761dc00b02b22d1cd6935aaa8a736fca011d33615315bc7c132788
PYTHON_NUMBA_SETUP_TYPE = setuptools
PYTHON_NUMBA_LICENSE = BSD
PYTHON_NUMBA_LICENSE_FILES = LICENSE
PYTHON_NUMBA_DEPENDENCIES += \
	host-python-numpy \
	python-numpy \
	python-llvmlite

# Use the target numpy pkg-config configuration files modified for target
# cross-compilation.  Without this, numpy distutils will cause the linker to
# link with host libnpymath.a.
PYTHON_NUMBA_ENV += NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)

$(eval $(python-package))
