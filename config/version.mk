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
CRYSTAL_VERSION_NAME=Amethyst
CRYSTAL_BUILD_TYPE?=BIJOU
CRYSTAL_MAINTAINER?=NOBODY
CRYSTAL_PURITY?=VANILLA
CRYSTAL_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

CRYSTAL_DATE_YEAR := $(shell date -u +%Y)
CRYSTAL_DATE_MONTH := $(shell date -u +%m)
CRYSTAL_DATE_DAY := $(shell date -u +%d)

CRYSTAL_BUILD_DATE := $(CRYSTAL_DATE_YEAR).$(CRYSTAL_DATE_MONTH).$(CRYSTAL_DATE_DAY)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.crystal.version=$(CRYSTAL_VERSION) \
    ro.crystal.version.name=$(CRYSTAL_VERSION_NAME) \
    ro.crystal.buildtype=$(CRYSTAL_BUILD_TYPE) \
    ro.crystal.maintainer=$(CRYSTAL_MAINTAINER) \
    ro.crystal.purity=$(CRYSTAL_PURITY) \
    ro.crystal.build.date=$(CRYSTAL_BUILD_DATE)
