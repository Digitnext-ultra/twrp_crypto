#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit some common recovery stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from digitnext device
$(call inherit-product, device/digit/digitnext/device.mk)

# Virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs - 
# SDCard replacement functionality
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

PRODUCT_DEVICE := digitnext
PRODUCT_NAME := twrp_digitnext
PRODUCT_MODEL := digitnext
PRODUCT_MANUFACTURER := Digit
PRODUCT_GMS_CLIENTID_BASE := android-digit
