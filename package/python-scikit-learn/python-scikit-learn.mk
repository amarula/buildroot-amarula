################################################################################
#
# python-scikit-learn
#
################################################################################

PYTHON_SCIKIT_LEARN_VERSION = 0.22.1
PYTHON_SCIKIT_LEARN_SOURCE = scikit-learn-$(PYTHON_SCIKIT_LEARN_VERSION).tar.gz
PYTHON_SCIKIT_LEARN_SITE = https://pypi.python.org/packages/18/28/5a48b00599b476875415b97bdfdb3849bafb31183c1d785501dbc8a77aa2
PYTHON_SCIKIT_LEARN_SETUP_TYPE = setuptools
PYTHON_SCIKIT_LEARN_LICENSE = new BSD
PYTHON_SCIKIT_LEARN_INSTALL_STAGING = YES
PYTHON_SCIKIT_LEARN_DEPENDENCIES += \
	host-python-numpy \
	host-python-scipy

$(eval $(python-package))
