################################################################################
#
# python-pybind11
#
################################################################################

PYTHON_PYBIND11_VERSION = 2.4.3
PYTHON_PYBIND11_SOURCE = pybind11-$(PYTHON_PYBIND11_VERSION).tar.gz
PYTHON_PYBIND11_SITE = https://pypi.python.org/packages/aa/91/deb6743e79e22ab01502296570b39b8404f10cc507a6692d612a7fee8d51
PYTHON_PYBIND11_SETUP_TYPE = setuptools
PYTHON_PYBIND11_LICENSE = BSD
PYTHON_PYBIND11_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
