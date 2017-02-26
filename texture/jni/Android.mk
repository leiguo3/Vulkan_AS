CODE_PATH := $(call my-dir)/../../code

# assimp

include $(CLEAR_VARS)

LOCAL_MODULE := assimp
LOCAL_SRC_FILES := $(CODE_PATH)/libs/assimp/$(TARGET_ARCH_ABI)/libassimp.a
include $(PREBUILT_STATIC_LIBRARY)

# vulkan example

DATADIR := $(CODE_PATH)/data

include $(CLEAR_VARS)

LOCAL_MODULE := vulkanTexture

PROJECT_FILES := $(wildcard $(CODE_PATH)/texture/*.cpp)
PROJECT_FILES += $(wildcard $(CODE_PATH)/base/*.cpp)

LOCAL_CPPFLAGS := -std=c++11
LOCAL_CPPFLAGS += -D__STDC_LIMIT_MACROS
LOCAL_CPPFLAGS += -DVK_NO_PROTOTYPES
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR

LOCAL_C_INCLUDES := $(CODE_PATH)/external/
LOCAL_C_INCLUDES += $(CODE_PATH)/external/glm
LOCAL_C_INCLUDES += $(CODE_PATH)/external/gli
LOCAL_C_INCLUDES += $(CODE_PATH)/external/assimp
LOCAL_C_INCLUDES += $(CODE_PATH)/base/
#LOCAL_C_INCLUDES += $(CODE_PATH)/base/android

LOCAL_SRC_FILES := $(PROJECT_FILES)

LOCAL_LDLIBS := -landroid -llog -lz

LOCAL_DISABLE_FORMAT_STRING_CHECKS := true
LOCAL_DISABLE_FATAL_LINKER_WARNINGS := true

LOCAL_STATIC_LIBRARIES += android_native_app_glue
LOCAL_STATIC_LIBRARIES += cpufeatures
LOCAL_STATIC_LIBRARIES += libassimp

include $(BUILD_SHARED_LIBRARY)

$(call import-module, android/native_app_glue)
$(call import-module, android/cpufeatures)
