#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_boot \
    vendor_dlkm

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lahaina
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := lahaina
QCOM_BOARD_PLATFORMS += lahaina

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk

TARGET_KERNEL_ARCH := $(TARGET_ARCH)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_KERNEL_CONFIG := vendor/lahaina-qgki_defconfig
TARGET_KERNEL_SOURCE := kernel/oneplus/sm8350
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc LLVM=1

BOARD_KERNEL_CMDLINE := \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    cgroup.memory=nokmem,nosocket \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    pcie_ports=compat \
    service_locator.enable=1 \
    swiotlb=0 \
    ip6table_raw.raw_before_defrag=1 \
    iptable_raw.raw_before_defrag=1

# Kernel modules
BOARD_RECOVERY_KERNEL_MODULES_LOAD := $(TW_LOAD_VENDOR_MODULES)
TW_LOAD_VENDOR_MODULES := "aw8697.ko ns.ko oplus_bsp_tp_notify.ko oplus_notify.ko service-locator.ko snd_event_dlkm.ko apr_dlkm.ko oplus_chg.ko q6_notifier_dlkm.ko adsp_loader_dlkm.ko msm_drm.ko phy-qcom-ufs.ko q6_pdr_dlkm.ko apr_dlkm.ko modules.dep modules.softdep oplus_chg.ko q6_pdr_dlkm.ko adsp_loader_dlkm.ko modules.alias modules.load msm_drm.ko q6_notifier_dlkm.ko androidboot.ko gcc-lahaina.ko oplus_bsp_tp_notify.ko qbt_handler.ko rpmhpd.ko aw8697.ko gcc-shima.ko oplus_charger_present.ko qcom-arm-smmu-mod.ko rpmh-regulator.ko boot_mode.ko gcc-yupik.ko oplus_ftm_mode.ko qcom_glink_native.ko sdhci-msm.ko buildvariant.ko hwkm.ko oplus_notify.ko qcom_glink_smem.ko secure_buffer.ko cdt_integrity.ko icc-bcm-voter.ko oplus_project.ko qcom-pdc.ko service-locator.ko clk-dummy.ko icc-rpmh.ko phy-qcom-ufs.ko qcom_rpmh.ko simcardnum.ko clk-qcom.ko iommu-logger.ko phy-qcom-ufs-qmp-v4-lahaina.ko _qcom_scm.ko smem.ko clk-rpmh.ko memory_dump_v2.ko phy-qcom-ufs-qmp-v4-yupik.ko qmi_helpers.ko snd_event_dlkm.ko cmd-db.ko modules.alias phy-qcom-ufs-qrbtc-sdm845.ko qnoc-lahaina.ko stub-regulator.ko cqhci-crypto.ko modules.dep pinctrl-lahaina.ko qnoc-qos.ko subsystem_restart.ko cqhci-crypto-qti.ko modules.load pinctrl-msm.ko qnoc-shima.ko ufshcd-crypto-qti.ko cqhci.ko modules.softdep pinctrl-shima.ko qnoc-yupik.ko ufs-qcom.ko crypto-qti-common.ko  msm-poweroff.ko pinctrl-yupik.ko qpnp-power-on.ko crypto-qti-hwkm.ko ns.ko proxy-consumer.ko refgen.ko"

# Enable Permissive kernel
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := \
    --dtb $(DEVICE_PATH)/prebuilt/dtb \
    --board RE58B2L1 \
    --kernel_offset 0x00008000 \
    --ramdisk_offset 0x01000000 \
    --tags_offset 0x00000100 \
    --dtb_offset 0x01f00000 \
    --header_version 3

BOARD_ROOT_EXTRA_FOLDERS := \
    carrier \
    efs \
    omr \
    optics \
    prism \
    spu

# Android Verified Boot
BOARD_AVB_ENABLE := false

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 237598617600
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 81788928

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Dynamic partitions
BOARD_SUPER_PARTITION_SIZE := 11190403072
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 11186208768
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor vendor_dlkm
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# Encryption
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99

# TWRP specific build flags
TW_THEME := portrait_hdpi
TW_NO_SCREEN_BLANK := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 1000
TW_DEFAULT_BRIGHTNESS := 500
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone50/temp"
TW_Y_OFFSET := 104
TW_H_OFFSET := -104
TW_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_CUSTOM_BATTERY_POS := 740
TW_CUSTOM_CLOCK_POS := 500
TW_CUSTOM_CPU_POS := 180
TW_NO_EXFAT_FUSE := true
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FASTBOOTD := true

TW_OVERRIDE_SYSTEM_PROPS := \
     "ro.build.date.utc;ro.bootimage.build.date.utc=ro.build.date.utc;ro.odm.build.date.utc=ro.build.date.utc;ro.product.build.date.utc=ro.build.date.utc;ro.system.build.date.utc=ro.build.date.utc;ro.system_ext.build.date.utc=ro.build.date.utc;ro.vendor.build.date.utc=ro.build.date.utc;ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"

# TWRP Configuration: Logd
TWRP_EVENT_LOGGING := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
