ifneq ($(TARGET_SIMULATOR),true)
LOCAL_PATH:= $(call my-dir)
ifeq ($(strip $(CONFIG_64KERNEL_32FRAMEWORK)),true)
MIDGARD_ARCH_ := arm64
else
MIDGARD_ARCH_ := $(TARGET_ARCH)
endif

ifeq ($(strip $(MIDGARD_ARCH_)),x86_64)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libGLES_mali.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/egl
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/egl
LOCAL_MULTILIB := both
LOCAL_SRC_FILES_32 :=  usr/sp9853i/libGLES_mali.so
LOCAL_SRC_FILES_64 :=  usr/sp9853i/libGLES_mali_64.so

# Symlink libOpenCL
#LOCAL_POST_INSTALL_CMD = $(hide)\
#        ln -sf egl/$(notdir $(LOCAL_INSTALLED_MODULE)) $(dir $(LOCAL_INSTALLED_MODULE))../libOpenCL.so.1.1;\
#        ln -sf libOpenCL.so.1.1 $(dir $(LOCAL_INSTALLED_MODULE))../libOpenCL.so.1;\
#        ln -sf libOpenCL.so.1 $(dir $(LOCAL_INSTALLED_MODULE))../libOpenCL.so;

#Symlink Vulkan
#LOCAL_POST_INSTALL_CMD += mkdir -p $(dir $(LOCAL_INSTALLED_MODULE))../hw;\
#	ln -sf ../egl/$(notdir $(LOCAL_INSTALLED_MODULE)) $(dir $(LOCAL_INSTALLED_MODULE))../hw/vulkan.$(TARGET_BOARD_PLATFORM).so

include $(BUILD_PREBUILT)

#gralloc
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := gralloc.$(TARGET_BOARD_PLATFORM).so

LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/hw
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/hw
LOCAL_MULTILIB := both

LOCAL_SRC_FILES_32 :=  usr/sp9853i/gralloc.midgard.so
LOCAL_SRC_FILES_64 :=  usr/sp9853i/gralloc.midgard_64.so

include $(BUILD_PREBUILT)

#OpenCL
#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libRSDriverArm.so
#LOCAL_MODULE_CLASS := SHARED_LIBRARIES
#LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib
#LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64
#LOCAL_MULTILIB := both
#LOCAL_SRC_FILES_32 :=  usr/sp9853i/libRSDriverArm.so
#LOCAL_SRC_FILES_64 :=  usr/sp9853i/libRSDriverArm_64.so

#include $(BUILD_PREBUILT)

#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libbccArm.so
#LOCAL_MODULE_CLASS := SHARED_LIBRARIES
#LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib
#LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64
#LOCAL_MULTILIB := both
#LOCAL_SRC_FILES_32 :=  usr/sp9853i/libbccArm.so
#LOCAL_SRC_FILES_64 :=  usr/sp9853i/libbccArm_64.so

#include $(BUILD_PREBUILT)


#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libmalicore.bc
#LOCAL_MODULE_OWNER := arm
#LOCAL_MODULE_CLASS := STATIC_LIBRARIES
#LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib
#LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64
#LOCAL_MULTILIB := both
#LOCAL_SRC_FILES_32 :=  usr/sp9853i/libmalicore.bc
#LOCAL_SRC_FILES_64 :=  usr/sp9853i/libmalicore_64.bc
#$(shell mkdir -p $(LOCAL_MODULE_PATH_64))
#$(shell mkdir -p $(LOCAL_MODULE_PATH_32))
#$(shell cp -rf $(LOCAL_PATH)/usr/sp9853i/libmalicore_64.bc $(LOCAL_MODULE_PATH_64)/libmalicore.bc)
$(shell cp -rf $(LOCAL_PATH)/usr/sp9853i/libmalicore.bc $(LOCAL_MODULE_PATH_32)/libmalicore.bc)

include $(BUILD_PREBUILT)




else





ifeq ($(strip $(MIDGARD_ARCH_)),arm64)

$(warning  "GPU: include $(LOCAL_PATH)/midgard_arm64.mk")
include  $(LOCAL_PATH)/midgard_arm64.mk

else ifeq ($(strip $(MALI_PLATFORM_NAME)),sharkle)

$(warning  "GPU sharkl2: include $(LOCAL_PATH)/midgard_arm64.mk")
include  $(LOCAL_PATH)/midgard_arm64.mk

else
ifneq ($(strip $(MALI_PLATFORM_NAME)),sharkl2)
$(warning  "GPU  Android.mk: include $(LOCAL_PATH)/midgard_arm64.mk")
include  $(LOCAL_PATH)/midgard_arm64.mk
else
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libGLES_mali.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/egl
ifeq ($(strip $(MALI_PLATFORM_NAME)),sharkl2)
LOCAL_SRC_FILES := usr/sp9833/libGLES_mali.so
else
LOCAL_SRC_FILES := usr/libGLES_mali.so
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

#hw
include $(CLEAR_VARS)
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_TAGS := optional
ifeq ($(strip $(TARGET_BOARD_PLATFORM)),)
LOCAL_MODULE := gralloc.default.so
else
LOCAL_MODULE := gralloc.$(TARGET_BOARD_PLATFORM).so
endif

LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MULTILIB := both
ifeq ($(strip $(MALI_PLATFORM_NAME)),sharkl2)
LOCAL_SRC_FILES :=  usr/sp9833/gralloc.midgard.so
else
LOCAL_SRC_FILES :=  usr/gralloc.midgard.so
endif

include $(BUILD_PREBUILT)

#OpenCL
#include $(CLEAR_VARS)

#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libRSDriverArm.so
#LOCAL_MODULE_CLASS := SHARED_LIBRARIES
#LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
#ifeq ($(strip $(MALI_PLATFORM_NAME)),sharkl2)
#LOCAL_SRC_FILES :=  usr/sp9833/libRSDriverArm.so
#else
#LOCAL_SRC_FILES :=  usr/libRSDriverArm.so
#endif

#include $(BUILD_PREBUILT)


#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libbccArm.so
#LOCAL_MODULE_CLASS := SHARED_LIBRARIES
#LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
#ifeq ($(strip $(MALI_PLATFORM_NAME)),sharkl2)
#LOCAL_SRC_FILES :=  usr/sp9833/libbccArm.so
#else
#LOCAL_SRC_FILES :=  usr/libbccArm.so
#endif

#include $(BUILD_PREBUILT)

#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libmalicore.bc
#LOCAL_MODULE_OWNER := arm
#LOCAL_MODULE_CLASS := STATIC_LIBRARIES
#LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
#ifeq ($(strip $(MALI_PLATFORM_NAME)),sharkl2)
#LOCAL_SRC_FILES :=  usr/sp9833/libmalicore.bc
#else
#LOCAL_SRC_FILES :=  usr/libmalicore.bc
#endif
#$(shell mkdir -p $(LOCAL_MODULE_PATH)/)
#$(shell cp -rf $(LOCAL_PATH)/usr/sp9833/libmalicore.bc $(LOCAL_MODULE_PATH)/libmalicore.bc)

#include $(BUILD_PREBUILT)
endif

endif

endif

endif
