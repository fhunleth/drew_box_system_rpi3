################################################################################
#
# Golights
#
################################################################################
GOLIGHTS_VERSION = v0.1.3
GOLIGHTS_SITE = $(call github,laibulle,golights,$(GOLIGHTS_VERSION))
GOLIGHTS_LICENSE = BSD-3-Clause
GOLIGHTS_LICENSE_FILES = LICENSE
GOLIGHTS_DEPENDENCIES = host-go

GOLIGHTS_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
    CGO_ENABLED=1 \
    CGO_NO_EMULATION=1 \
    PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
    $(TARGET_MAKE_ENV)

define GOLIGHTS_CONFIGURE_CMDS
    cd $(@D) && $(GOLIGHTS_ENGINE_MAKE_ENV)$(HOST_DIR)/bin/go get ./
endef

define GOLIGHTS_BUILD_CMDS
    cd $(@D) && $(GOLIGHTS_ENGINE_MAKE_ENV) $(HOST_DIR)/bin/go \
        build -v -o $(@D)/bin/golights .
endef

$(eval $(golang-package))