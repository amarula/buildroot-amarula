################################################################################
#
# python-soundfile
#
################################################################################

PYTHON_SOUNDFILE_VERSION = 0.10.3.post1
PYTHON_SOUNDFILE_SOURCE = SoundFile-$(PYTHON_SOUNDFILE_VERSION).tar.gz
PYTHON_SOUNDFILE_SITE = https://pypi.python.org/packages/bc/7c/440d411e1bf2ef40ec450bb65a2b85ed8b23aaf12b7a99a1888ab551029c
PYTHON_SOUNDFILE_SETUP_TYPE = setuptools
PYTHON_SOUNDFILE_LICENSE = BSD-3-Clause License
PYTHON_SOUNDFILE_LICENSE_FILES = LICENSE
PYTHON_SOUNDFILE_DEPENDENCIES =	host-python-cffi

$(eval $(python-package))
