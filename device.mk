#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/digit/digitnext

# API
PRODUCT_SHIPPING_API_LEVEL := 31

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31

 # VIRTUAL A/B
ENABLE_VIRTUAL_AB := true

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    init_boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-recovery \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    bootctrl.$(TARGET_BOARD_PLATFORM) \
    bootctrl.$(TARGET_BOARD_PLATFORM).recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctrl \
    update_engine_client

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_verifier \
    update_engine_sideload \

PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock

# MTK PlPath Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libkeymaster41

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so
