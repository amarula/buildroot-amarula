################################################################################
#
# python-threadpoolctl
#
################################################################################

PYTHON_THREADPOOLCTL_VERSION = 2.0.0
PYTHON_THREADPOOLCTL_SOURCE = threadpoolctl-$(PYTHON_THREADPOOLCTL_VERSION).tar.gz
PYTHON_THREADPOOLCTL_SITE = https://pypi.python.org/packages/49/f9/0c328a665dc97892b867b98b94565f6c397b1c0bf92297ffc700e7b90b0f
PYTHON_THREADPOOLCTL_SETUP_TYPE = distutils
PYTHON_THREADPOOLCTL_LICENSE = BSD
PYTHON_THREADPOOLCTL_LICENSE_FILES = LICENSE

$(eval $(python-package))
