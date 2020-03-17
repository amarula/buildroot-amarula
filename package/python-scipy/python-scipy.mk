################################################################################
#
# python-scipy
#
################################################################################

PYTHON_SCIPY_VERSION = 1.4.1
PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
PYTHON_SCIPY_SITE = https://pypi.python.org/packages/04/ab/e2eb3e3f90b9363040a3d885ccc5c79fe20c5b8a3caa8fe3bf47ff653260
PYTHON_SCIPY_LICENSE = BSD-3-Clause, BSD-2-Clause, BSD, BSD-Style, \
	Apache-2.0, MIT
PYTHON_SCIPY_LICENSE_FILES = \
	LICENSE.txt \
	scipy/linalg/src/lapack_deprecations/LICENSE \
	scipy/ndimage/LICENSE.txt \
	scipy/optimize/tnc/LICENSE \
	scipy/sparse/linalg/dsolve/SuperLU/License.txt \
	scipy/sparse/linalg/eigen/arpack/ARPACK/COPYING \
	scipy/spatial/qhull_src/COPYING.txt
PYTHON_SCIPY_SETUP_TYPE = setuptools
PYTHON_SCIPY_DEPENDENCIES += \
	host-python-numpy \
	host-python-pybind11 \
	lapack \
	openblas \
	python-numpy

PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
PYTHON_SCIPY_ENV += F90=$(TARGET_CROSS)gfortran F77=$(TARGET_CROSS)gfortran

# Provide system configuration options to numpy distutils extenions, telling
# to find all include files and libraries in staging directory.
define PYTHON_SCIPY_CONFIGURE_CMDS
	-rm -f $(@D)/site.cfg
	echo "[DEFAULT]" >> $(@D)/site.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
endef

# Use the target numpy pkg-config configuration files modified for target
# cross-compilation.  Without this, numpy distutils will cause the linker to
# link with host libnpymath.a.
PYTHON_SCIPY_ENV += NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)
PYTHON_SCIPY_INSTALL_STAGING = YES

$(eval $(python-package))
