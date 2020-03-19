################################################################################
#
# python-resampy
#
################################################################################

PYTHON_RESAMPY_VERSION = 0.2.2
PYTHON_RESAMPY_SOURCE = resampy-$(PYTHON_RESAMPY_VERSION).tar.gz
PYTHON_RESAMPY_SITE = https://pypi.python.org/packages/79/75/e22272b9c2185fc8f3af6ce37229708b45e8b855fd4bc38b4d6b040fff65
PYTHON_RESAMPY_SETUP_TYPE = setuptools
PYTHON_RESAMPY_LICENSE = BSD
PYTHON_RESAMPY_LICENSE_FILES = LICENSE
PYTHON_RESAMPY_INSTALL_STAGING = YES

$(eval $(python-package))
