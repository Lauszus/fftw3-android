# fftw3 for Android
_________
[![Build Status](https://travis-ci.org/Lauszus/fftw3-android.svg?branch=master)](https://travis-ci.org/Lauszus/fftw3-android)

Repository for compiling [fftw3](https://github.com/FFTW/fftw3) on Android. Based on the following project: <https://github.com/sfomra/FFTW3_MOD-for-Android>.

The library can then be included as a static library in another project. An example Android.mk can be seen below:

```Makefile
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := fftw3
LOCAL_SRC_FILES := $(LOCAL_PATH)/fftw3/lib/$(TARGET_ARCH_ABI)/libfftw3.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/fftw3/include
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := foo
LOCAL_SRC_FILES := foo.c
LOCAL_CFLAGS := -std=c99
LOCAL_LDLIBS := -llog -lm
LOCAL_STATIC_LIBRARIES := fftw3
include $(BUILD_SHARED_LIBRARY)
```

Where the include directory ```$(LOCAL_PATH)/fftw3/include``` simply contains [fftw3.h](jni/fftw3/api/fftw3.h) and ```$(LOCAL_PATH)/fftw3/lib``` contains the static libraries for each architecture (x86_64, armeabi, armeabi-v7a etc) compiled using this project.

For more information send me an email at <lauszus@gmail.com>.
