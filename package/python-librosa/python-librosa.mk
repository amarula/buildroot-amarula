################################################################################
#
# python-librosa
#
################################################################################

PYTHON_LIBROSA_VERSION = 0.7.2
PYTHON_LIBROSA_SOURCE = librosa-$(PYTHON_LIBROSA_VERSION).tar.gz
PYTHON_LIBROSA_SITE = https://pypi.python.org/packages/77/b5/1817862d64a7c231afd15419d8418ae1f000742cac275e85c74b219cbccb
PYTHON_LIBROSA_SETUP_TYPE = setuptools
PYTHON_LIBROSA_LICENSE =  ISC License
PYTHON_LIBROSA_LICENSE_FILES = LICENSE
PYTHON_LIBROSA_INSTALL_STAGING = YES
PYTHON_LIBROSA_DEPENDENCIES += \
	python-audioread \
	python-numpy \
	python-scipy \
	python-scikit-learn \
	python-joblib \
	python-decorator \
	python-resampy \
	python-numba \
	python-soundfile

$(eval $(python-package))
