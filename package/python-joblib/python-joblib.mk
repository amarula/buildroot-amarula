################################################################################
#
# python-joblib
#
################################################################################

PYTHON_JOBLIB_VERSION = 0.14.1
PYTHON_JOBLIB_SOURCE = joblib-$(PYTHON_JOBLIB_VERSION).tar.gz
PYTHON_JOBLIB_SITE = https://pypi.python.org/packages/77/c4/26ba5eb6f494d2c307b74ee9bc591bc8153ec4c4fb2a54e780973526cfb5
PYTHON_JOBLIB_SETUP_TYPE = distutils
PYTHON_JOBLIB_LICENSE = BSD-3-Clause
PYTHON_AUDIOREAD_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
