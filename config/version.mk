# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

CRYSTAL_MOD_VERSION = v12.1
CRYSTAL_BUILD_TYPE := UNOFFICIAL
CRYSTAL_BUILD_ZIP_TYPE := VANILLA

ifeq ($(CRYSTAL_BETA),true)
    CRYSTAL_BUILD_TYPE := BETA
endif

ifeq ($(CRYSTAL_GAPPS), true)
    $(call inherit-product, vendor/gapps/common/common-vendor.mk)
    CRYSTAL_BUILD_ZIP_TYPE := GAPPS
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(CRYSTAL_OFFICIAL), true)
   LIST = $(shell cat infrastructure/devices/crystal.devices | awk '$$1 != "#" { print $$2 }')
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_OFFICIAL=true
      CRYSTAL_BUILD_TYPE := OFFICIAL

PRODUCT_PACKAGES += \
    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       CRYSTAL_BUILD_TYPE := UNOFFICIAL
       $(error Device is not official "$(CURRENT_DEVICE)")
    endif
endif

ifeq ($(CRYSTAL_COMMUNITY), true)
   LIST = $(shell cat infrastructure/devices/crystal-community.devices | awk '$$1 != "#" { print $$2 }')
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_COMMUNITY=true
      CRYSTAL_BUILD_TYPE := COMMUNITY
    endif
    ifneq ($(IS_COMMUNITY), true)
       CRYSTAL_BUILD_TYPE := UNOFFICIAL
       $(error This isn't a community device "$(CURRENT_DEVICE)")
    endif
endif

CRYSTAL_VERSION := Crystal-$(CRYSTAL_MOD_VERSION)-$(CURRENT_DEVICE)-$(CRYSTAL_BUILD_TYPE)-$(shell date -u +%Y%m%d)-$(CRYSTAL_BUILD_ZIP_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.crystal.version=$(CRYSTAL_VERSION) \
  ro.crystal.releasetype=$(CRYSTAL_BUILD_TYPE) \
  ro.crystal.ziptype=$(CRYSTAL_BUILD_ZIP_TYPE) \
  ro.modversion=$(CRYSTAL_MOD_VERSION)

CRYSTAL_DISPLAY_VERSION := Crystal-$(CRYSTAL_MOD_VERSION)-$(CRYSTAL_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.crystal.display.version=$(CRYSTAL_DISPLAY_VERSION)
