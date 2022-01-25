# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
# Copyright (C) 2021 CrystalOS Project
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

CRYSTAL_VERSION=1.0
CRYSTAL_REGULAR_VERSION_NAME=Amethyst
CRYSTAL_CLEAR_VERSION_NAME=Amber
CRYSTAL_BUILD_TYPE?=ARGENT
CRYSTAL_MAINTAINER?=NOBODY
CRYSTAL_PURITY?=VANILLA
CRYSTAL_CUSTOM_TYPE?=REGULAR
CRYSTAL_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

CRYSTAL_DATE_YEAR := $(shell date -u +%Y)
CRYSTAL_DATE_MONTH := $(shell date -u +%m)
CRYSTAL_DATE_DAY := $(shell date -u +%d)

CRYSTAL_BUILD_DATE := $(CRYSTAL_DATE_YEAR).$(CRYSTAL_DATE_MONTH).$(CRYSTAL_DATE_DAY)

ifeq ($(CRYSTAL_CUSTOM_TYPE),CRYSTALCLEAR)
    CRYSTAL_DISPLAY_VERSION=$(CRYSTAL_VERSION)-$(CRYSTAL_CLEAR_VERSION_NAME)
    CRYSTAL_VERSION_NAME=$(CRYSTAL_CLEAR_VERSION_NAME)
else
    CRYSTAL_DISPLAY_VERSION=$(CRYSTAL_VERSION)-$(CRYSTAL_REGULAR_VERSION_NAME)
    CRYSTAL_VERSION_NAME=$(CRYSTAL_REGULAR_VERSION_NAME)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.crystal.version=$(CRYSTAL_VERSION) \
    ro.crystal.buildtype=$(CRYSTAL_BUILD_TYPE) \
    ro.crystal.maintainer=$(CRYSTAL_MAINTAINER) \
    ro.crystal.purity=$(CRYSTAL_PURITY) \
    ro.crystal.custom.type=$(CRYSTAL_CUSTOM_TYPE) \
    ro.crystal.display.version=$(CRYSTAL_DISPLAY_VERSION) \
    ro.crystal.build.date=$(CRYSTAL_BUILD_DATE)