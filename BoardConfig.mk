#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/digit/Digitnext_Ultra

# Building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# enable boosting optimizations
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := k62v1_64_bsp
TARGET_NO_BOOTLOADER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := Digitnext_Ultra

# Kernel
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel

BOARD_HASH_TYPE := sha1
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_DTB_OFFSET := 0x07808000
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_RAMDISK_OFFSET := 0x11a88000

# BOARD_NAME :=                                                             # Manually Added
BOARD_DTB_SIZE := 108601
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

# BOARD_MKBOOTIMG_ARGS += --board $(BOARD_NAME)                             # Manually Added
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Treble
# BOARD_VNDK_VERSION := current                                               # ENABLE AT LAST, all modules are checked. Enabling that, the build system enforces the dependency and header requirements.

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296                                 # original boot size - 33554432
BOARD_FLASH_BLOCK_SIZE := 131072                                            # (BOARD_KERNEL_PAGESIZE * 64)

# Filesystem
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
# BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4                            # on this device system_ext is in system
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
# TARGET_USERIMAGES_USE_F2FS := true                                        # Not available in fstab 

# Dynamic Partition (super)     # Refer Partition Table in Readme.MD
# BOARD_SUPER_PARTITION_SIZE: total size of the super partition including all snapshots/slots (a/b)
#   system_a  : 1842224 blocks
#   system_b  :  235140 blocks
#   vendor_a  :  525652 blocks
#   product_a : 2280880 blocks
#   Total calculated from device mapper: 5001109504 bytes
#
# BOARD_DIGIT_DYNAMIC_PARTITIONS_SIZE: sum of active dynamic partitions only (currently active slots)
#   system_a  : 1842224 blocks
#   vendor_a  :  525652 blocks
#   product_a : 2280880 blocks
#   Total active size: 4760326144 bytes

BOARD_SUPER_PARTITION_SIZE := 5001109504
BOARD_SUPER_PARTITION_GROUPS := digit_dynamic_partitions
BOARD_DIGIT_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    product \
    vendor
#    system_ext
BOARD_DIGIT_DYNAMIC_PARTITIONS_SIZE := 4760326144

# Workaround for error copying vendor and product files to recovery ramdisk
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
# TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Board-specific configuration
# BOARD_BUILD_SYSTEM_ROOT_IMAGE := false                                # with this booting to os but disabled to see if decryption is not availabe due to this 
BOARD_SUPPRESS_SECURE_ERASE := true

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TW_HAS_NO_RECOVERY_PARTITION := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Platform
TARGET_BOARD_PLATFORM := mt6762
PLATFORM_VERSION :=  99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Properties (no props required)
# TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/init.recovery.mt6762.rc

# TWRP Configuration
TARGET_DISABLE_TRIPLE_BUFFERING := false
TARGET_USES_MKE2FS := true

TW_FRAMERATE := 60
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_REPACKTOOLS := true          			# enables Install Recovery Ramdisk
TW_INCLUDE_RESETPROP := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_FASTBOOT_BOOT := true
TW_SCREEN_BLANK_ON_BOOT := true         			# produces touch issue on some devices
TW_USE_TOOLBOX := true

# CRYPTO:
TW_INCLUDE_CRYPTO := true             					# TWRP stucks at logo     if proper crypto blobs are not imported
TW_INCLUDE_CRYPTO_FBE := true         				# Stuck at SPlash Logo    if proper crypto blobs are not imported
TW_INCLUDE_METADATA_DECRYPT := true
TW_PREPARE_DATA_MEDIA_EARLY := true

PRODUCT_ENFORCE_VINTF_MANIFEST := true

TW_USE_FSCRYPT_POLICY := 2
TW_FORCE_KEYMASTER_VER := true
TW_INCLUDE_DM_VERITY := true

# Display
TARGET_SCREEN_DENSITY := 320
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone3/temp
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 150
TW_THEME := portrait_hdpi
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1600

# STOCK NOTCH DATA

# Statusbar icons flags 720 x 1600 : [NOTCH] : 286-434 - Notch width = 434 - 286 = 148px - center_x = left + (width / 2) = 286 + (148 / 2) = 286 + 74 = 360 px
# TW_STATUS_ICONS_ALIGN := 
# TW_CUSTOM_CPU_POS := 
# TW_CUSTOM_CLOCK_POS := 
# TW_CUSTOM_BATTERY_POS := 

TW_X_OFFSET := 0        # no horizontal shift
TW_Y_OFFSET := 45       # move status bar below notch
TW_W_OFFSET := 0        # no width adjustment
TW_H_OFFSET := -40      # fix sinked nav bar

# FastbootD
TW_INCLUDE_FASTBOOTD := true

TW_EXTRA_LANGUAGES := false
TW_DEFAULT_LANGUAGE := en

# USB Mass Storage
TW_NO_USB_STORAGE := false
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file

# Internal Storage
#TW_INTERNAL_STORAGE_PATH := "/data/media/0"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Fuse
#TW_INCLUDE_NTFS_3G    := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS  := true

# Firmware version & Developer Display name
TW_DEVICE_VERSION :=  by inscrutable


TW_EXCLUDE_APEX := true
TW_EXCLUDE_BASH := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_LPDUMP := true
TW_EXCLUDE_NANO := true
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_TZDATA := true
TW_NO_EXTRAS_ABOUT := true

# MediaTek Hardware Support
TARGET_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

