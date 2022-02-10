
LOCAL_PATH:= $(call my-dir)

$(warning  "GPU: MALI_PLATFORM_NAME: $(MALI_PLATFORM_NAME)")
$(warning  "GPU: TARGET_BOARD_PLATFORM: $(TARGET_BOARD_PLATFORM)")


ifeq ($(strip $(MALI_PLATFORM_NAME)),)
$(error  "GPU: MALI_PLATFORM_NAME:$(MALI_PLATFORM_NAME)")
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)),)
$(error  "GPU: TARGET_BOARD_PLATFORM: $(TARGET_BOARD_PLATFORM)")
endif

ifeq ($(strip $(TARGET_ARCH)),)
$(error  "GPU: TARGET_ARCH: $(TARGET_ARCH)")
endif


BUILD_BOTH_32_AND_64 := false;

ifeq ($(strip $(TARGET_ARCH)),x86_64)
  BUILD_BOTH_32_AND_64 := true
endif

ifeq ($(strip $(TARGET_ARCH)),arm64)
  BUILD_BOTH_32_AND_64 := true
endif

$(warning  "GPU: TARGET_ARCH:$(TARGET_ARCH), BUILD_BOTH_32_AND_64: $(BUILD_BOTH_32_AND_64)")

#libGLES_mali
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libGLES_mali.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

ifeq ($(strip $(BUILD_BOTH_32_AND_64)), true)
  LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/egl
  LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/egl
  LOCAL_MULTILIB := both
  LOCAL_SRC_FILES_32 :=  usr/$(MALI_PLATFORM_NAME)/libGLES_mali.so
  LOCAL_SRC_FILES_64 :=  usr/$(MALI_PLATFORM_NAME)/libGLES_mali_64.so
else
  LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/egl
  LOCAL_SRC_FILES := usr/$(MALI_PLATFORM_NAME)/libGLES_mali.so
  $(warning  "GPU MALI: 32 LOCAL_MODULE: $(LOCAL_MODULE)")
  $(warning  "GPU MALI: 32 LOCAL_SRC_FILES: $(LOCAL_SRC_FILES)")
endif

# Symlink libOpenCL
#LOCAL_POST_INSTALL_CMD = $(hide)\
#        ln -sf egl/$(notdir $(LOCAL_INSTALLED_MODULE)) $(dir $(LOCAL_INSTALLED_MODULE))../libOpenCL.so.1.1;\
#        ln -sf libOpenCL.so.1.1 $(dir $(LOCAL_INSTALLED_MODULE))../libOpenCL.so.1;\
#        ln -sf libOpenCL.so.1 $(dir $(LOCAL_INSTALLED_MODULE))../libOpenCL.so;

#Symlink Vulkan
#ifeq ($(strip $(ENABLE_VULKAN)),true)
#LOCAL_POST_INSTALL_CMD += mkdir -p $(dir $(LOCAL_INSTALLED_MODULE))../hw;\
#	ln -sf ../egl/$(notdir $(LOCAL_INSTALLED_MODULE)) $(dir $(LOCAL_INSTALLED_MODULE))../hw/vulkan.$(TARGET_BOARD_PLATFORM).so
#endif

include $(BUILD_PREBUILT)

#gralloc.xxxx.so
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := gralloc.$(TARGET_BOARD_PLATFORM).so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

ifeq ($(strip $(BUILD_BOTH_32_AND_64)), true)
  LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/hw
  LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/hw
  LOCAL_MULTILIB := both
  LOCAL_SRC_FILES_32 :=  usr/$(MALI_PLATFORM_NAME)/gralloc.midgard.so
  LOCAL_SRC_FILES_64 :=  usr/$(MALI_PLATFORM_NAME)/gralloc.midgard_64.so

  $(warning  "GPU: 64 TARGET_OUT_VENDOR: $(TARGET_OUT_VENDOR)")
  $(warning  "GPU: 64 LOCAL_MODULE: $(LOCAL_MODULE)")
  $(warning  "GPU: 64 LOCAL_SRC_FILES_64: $(LOCAL_SRC_FILES_64)")
else
  LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/hw
  LOCAL_SRC_FILES :=  usr/$(MALI_PLATFORM_NAME)/gralloc.midgard.so
  $(warning  "GPU: 32 LOCAL_MODULE: $(LOCAL_MODULE)")
  $(warning  "GPU: 32 LOCAL_SRC_FILES: $(LOCAL_SRC_FILES)")
endif

include $(BUILD_PREBUILT)

#OpenCL.so
#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libRSDriverArm.so
#LOCAL_MODULE_CLASS := SHARED_LIBRARIES

#ifeq ($(strip $(BUILD_BOTH_32_AND_64)), true)
#  LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib
#  LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64
#  LOCAL_MULTILIB := both
#  LOCAL_SRC_FILES_32 :=  usr/$(MALI_PLATFORM_NAME)/libRSDriverArm.so
#  LOCAL_SRC_FILES_64 :=  usr/$(MALI_PLATFORM_NAME)/libRSDriverArm_64.so
#else
#  LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
#  LOCAL_SRC_FILES :=  usr/$(MALI_PLATFORM_NAME)/libRSDriverArm.so
#endif
#include $(BUILD_PREBUILT)

#libbccArm.so
#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libbccArm.so
#LOCAL_MODULE_CLASS := SHARED_LIBRARIES

#ifeq ($(strip $(BUILD_BOTH_32_AND_64)), true)
#  LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib
#  LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64
#  LOCAL_MULTILIB := both
#  LOCAL_SRC_FILES_32 :=  usr/$(MALI_PLATFORM_NAME)/libbccArm.so
#  LOCAL_SRC_FILES_64 :=  usr/$(MALI_PLATFORM_NAME)/libbccArm_64.so
#else
#  LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
#  LOCAL_SRC_FILES :=  usr/$(MALI_PLATFORM_NAME)/libbccArm.so
#endif
#include $(BUILD_PREBUILT)

#libmalicore.bc
#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libmalicore.bc
#LOCAL_MODULE_OWNER := arm
#LOCAL_MODULE_CLASS := STATIC_LIBRARIES

#ifeq ($(strip $(BUILD_BOTH_32_AND_64)), true)
#  LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib
#  LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64
#  LOCAL_MULTILIB := both
#  LOCAL_SRC_FILES_32 :=  usr/$(MALI_PLATFORM_NAME)/libmalicore.bc
#  LOCAL_SRC_FILES_64 :=  usr/$(MALI_PLATFORM_NAME)/libmalicore_64.bc
#  $(shell mkdir -p $(LOCAL_MODULE_PATH_64))
#  $(shell mkdir -p $(LOCAL_MODULE_PATH_32))
#  $(shell cp -rf $(LOCAL_PATH)/usr/$(MALI_PLATFORM_NAME)/libmalicore_64.bc $(LOCAL_MODULE_PATH_64)/libmalicore.bc)
#  $(shell cp -rf $(LOCAL_PATH)/usr/$(MALI_PLATFORM_NAME)/libmalicore.bc $(LOCAL_MODULE_PATH_32)/libmalicore.bc)
#else
#  LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
#  LOCAL_SRC_FILES :=  usr/$(MALI_PLATFORM_NAME)/libmalicore.bc
#  $(shell mkdir -p $(LOCAL_MODULE_PATH)/)
#  $(shell cp -rf $(LOCAL_PATH)/usr/$(MALI_PLATFORM_NAME)/libmalicore.bc $(LOCAL_MODULE_PATH)/libmalicore.bc)
#endif
#include $(BUILD_PREBUILT)


$(warning  "GPU: BOARD_VNDK_VERSION: $(BOARD_VNDK_VERSION)")

#ifdef BOARD_VNDK_VERSION

#include $(CLEAR_VARS)
#LOCAL_MODULE := bcc.vendor
#LOCAL_MODULE_CLASS := EXECUTABLES
#LOCAL_PREBUILT_MODULE_FILE := $(TARGET_OUT_EXECUTABLES)/bcc
#LOCAL_MODULE_TAGS := optional
#LOCAL_INSTALLED_MODULE_STEM := bcc
#LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_EXECUTABLES)
#include $(BUILD_PREBUILT)

#include $(CLEAR_VARS)
#LOCAL_MODULE := libclcore.bc.vendor
#LOCAL_MODULE_CLASS := RENDERSCRIPT_BITCODE
#LOCAL_PREBUILT_MODULE_FILE := $(TARGET_OUT)/lib/libclcore.bc
#LOCAL_MODULE_TAGS := optional
#LOCAL_MULTILIB := 32
#LOCAL_INSTALLED_MODULE_STEM := libclcore.bc
#LOCAL_MODULE_SUFFIX := .bc
#LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
#include $(BUILD_PREBUILT)

#ifeq ($(TARGET_IS_64_BIT),true)
#  include $(CLEAR_VARS)
#  LOCAL_MODULE := libclcore.bc.vendor
#  LOCAL_MODULE_CLASS := RENDERSCRIPT_BITCODE
#  LOCAL_PREBUILT_MODULE_FILE := $(TARGET_OUT)/lib64/libclcore.bc
#  LOCAL_MODULE_TAGS := optional
#  LOCAL_MULTILIB := 64
#  LOCAL_INSTALLED_MODULE_STEM := libclcore.bc
#  LOCAL_MODULE_SUFFIX := .bc
#  LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
#  include $(BUILD_PREBUILT)
#endif

#ifeq ($(ARCH_ARM_HAVE_NEON),true)
#  include $(CLEAR_VARS)
#  LOCAL_MODULE := libclcore_neon.bc.vendor
#  LOCAL_MODULE_CLASS := RENDERSCRIPT_BITCODE
#  LOCAL_PREBUILT_MODULE_FILE := $(TARGET_OUT)/lib/libclcore_neon.bc
#  LOCAL_MODULE_TAGS := optional
#  LOCAL_MULTILIB := 32
#  LOCAL_INSTALLED_MODULE_STEM := libclcore_neon.bc
#  LOCAL_MODULE_SUFFIX := .bc
#  LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
#  include $(BUILD_PREBUILT)
#endif

#endif  # endif BOARD_VNDK_VERSION

