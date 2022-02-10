ifneq ($(TARGET_SIMULATOR),true)
LOCAL_PATH := $(call my-dir)

ifeq ($(strip $(TARGET_ARCH)),x86_64)
#/vendor/lib/rs_intrinsics/*.o
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := 3dlut.o
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/rs_intrinsics
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/rs_intrinsics
LOCAL_SRC_FILES_32 :=  usr/lib/rs_intrinsics/3dlut.o
LOCAL_SRC_FILES_64 :=  usr/lib/rs_intrinsics/3dlut.o
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := blend.o
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/rs_intrinsics
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/rs_intrinsics
LOCAL_SRC_FILES_32 :=  usr/lib/rs_intrinsics/blend.o
LOCAL_SRC_FILES_64 :=  usr/lib/rs_intrinsics/blend.o
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := blur.o
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/rs_intrinsics
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/rs_intrinsics
LOCAL_SRC_FILES_32 :=  usr/lib/rs_intrinsics/blur.o
LOCAL_SRC_FILES_64 :=  usr/lib/rs_intrinsics/blur.o
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := colormatrix.o
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/rs_intrinsics
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/rs_intrinsics
LOCAL_SRC_FILES_32 :=  usr/lib/rs_intrinsics/colormatrix.o
LOCAL_SRC_FILES_64 :=  usr/lib/rs_intrinsics/colormatrix.o
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := convolve3x3.o
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/rs_intrinsics
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/rs_intrinsics
LOCAL_SRC_FILES_32 :=  usr/lib/rs_intrinsics/convolve3x3.o
LOCAL_SRC_FILES_64 :=  usr/lib/rs_intrinsics/convolve3x3.o
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := convolve5x5.o
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/rs_intrinsics
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/rs_intrinsics
LOCAL_SRC_FILES_32 :=  usr/lib/rs_intrinsics/convolve5x5.o
LOCAL_SRC_FILES_64 :=  usr/lib/rs_intrinsics/convolve5x5.o
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := histogram.o
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/rs_intrinsics
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/rs_intrinsics
LOCAL_SRC_FILES_32 :=  usr/lib/rs_intrinsics/histogram.o
LOCAL_SRC_FILES_64 :=  usr/lib/rs_intrinsics/histogram.o
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := lut.o
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/rs_intrinsics
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/rs_intrinsics
LOCAL_SRC_FILES_32 :=  usr/lib/rs_intrinsics/lut.o
LOCAL_SRC_FILES_64 :=  usr/lib/rs_intrinsics/lut.o
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := resize.o
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/rs_intrinsics
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/rs_intrinsics
LOCAL_SRC_FILES_32 :=  usr/lib/rs_intrinsics/resize.o
LOCAL_SRC_FILES_64 :=  usr/lib/rs_intrinsics/resize.o
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := yuv_to_rgb.o
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/rs_intrinsics
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/rs_intrinsics
LOCAL_SRC_FILES_32 :=  usr/lib/rs_intrinsics/yuv_to_rgb.o
LOCAL_SRC_FILES_64 :=  usr/lib/rs_intrinsics/yuv_to_rgb.o
include $(BUILD_PREBUILT)


else
include $(CLEAR_VARS)

include $(BUILD_PREBUILT)
endif

endif
