DISTRO_VERSION_MAJOR ?= "1"
DISTRO_VERSION_MINOR ?= "0"
DISTRO_VERSION_PATCH ?= "0"
DISTRO_VERSION = " \
    ${DISTRO_VERSION_MAJOR}. \
    ${DISTRO_VERSION_MINOR}. \
    ${DISTRO_VERSION_PATCH} \
"
DISTRO_FEATURES:remove = "eudev"
DISTRO_FEATURES:append = " \
    systemd \
    usrmerge \
"
DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " \
    sysvinit \
"
PREFERRED_PROVIDER_virtual/kernel = "linux-xlnx"
PREFERRED_PROVIDER_virtual/bootloader = "u-boot-xlnx"

VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
VIRTUAL-RUNTIME_login_manager = "shadow-base"
VIRTUAL-RUNTIME_dev_manager = "systemd"
