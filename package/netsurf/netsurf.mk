################################################################################
#
# netsurf
#
################################################################################

NETSURF_VERSION = 3.8
NETSURF_SOURCE = netsurf-all-$(NETSURF_VERSION).tar.gz
NETSURF_SITE = http://download.netsurf-browser.org/netsurf/releases/source-full
NETSURF_LICENSE = GPL-2.0
NETSURF_LICENSE_FILES = netsurf/COPYING
NETSURF_DEPENDENCIES = expat jpeg libcurl libpng openssl \
	host-bison host-flex host-gperf host-pkgconf

ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
NETSURF_DEPENDENCIES += libgtk2
NETSURF_FRONTEND = gtk
ifeq ($(BR2_PACKAGE_LIBRSVG),y)
NETSURF_DEPENDENCIES += librsvg
define NETSURF_SVG_CONFIGURE_CMDS
	echo "override NETSURF_USE_RSVG := YES"         >> $(@D)/netsurf/Makefile.config
	echo "override NETSURF_USE_NSSVG := NO"         >> $(@D)/netsurf/Makefile.config
endef
endif
endif

ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
NETSURF_DEPENDENCIES += sdl
NETSURF_FRONTEND = framebuffer
endif

ifeq ($(BR2_PACKAGE_LIBICONV),y)
NETSURF_DEPENDENCIES += libiconv
define NETSURF_ICONV_CONFIGURE_CMDS
	echo "CFLAGS += -DWITH_ICONV_FILTER"            >> $(@D)/libparserutils/Makefile.config.override
	echo "override NETSURF_USE_LIBICONV_PLUG := NO" >> $(@D)/netsurf/Makefile.config
endef
endif

define NETSURF_CONFIGURE_CMDS
	echo "override NETSURF_USE_DUKTAPE := NO"       >  $(@D)/netsurf/Makefile.config
	$(NETSURF_ICONV_CONFIGURE_CMDS)
	$(NETSURF_SVG_CONFIGURE_CMDS)
endef

NETSURF_MAKE_OPTS = \
	TARGET=$(NETSURF_FRONTEND) \
	BISON="$(HOST_DIR)/bin/bison" \
	FLEX="$(HOST_DIR)/bin/flex" \
	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
	BUILD_CC="$(HOSTCC)" \
	CC="$(TARGET_CC)" \
	AR="$(TARGET_AR)" \
	TMP_PREFIX=$(STAGING_DIR)/usr \
	PREFIX=/usr

define NETSURF_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(NETSURF_MAKE_OPTS) \
		build
endef

define NETSURF_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(NETSURF_MAKE_OPTS) \
		DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))