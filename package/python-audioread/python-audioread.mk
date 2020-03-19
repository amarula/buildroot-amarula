################################################################################
#
# python-audioread
#
################################################################################

PYTHON_AUDIOREAD_VERSION = 2.1.8
PYTHON_AUDIOREAD_SOURCE = audioread-$(PYTHON_AUDIOREAD_VERSION).tar.gz
PYTHON_AUDIOREAD_SITE = https://pypi.python.org/packages/2e/0b/940ea7861e0e9049f09dcfd72a90c9ae55f697c17c299a323f0148f913d2
PYTHON_AUDIOREAD_SETUP_TYPE = setuptools
PYTHON_AUDIOREAD_LICENSE = MIT
PYTHON_AUDIOREAD_LICENSE_FILES = LICENSE

$(eval $(python-package))
