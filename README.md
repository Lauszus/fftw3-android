# FFTW3 for Android
_________
[![Build Status](https://travis-ci.org/Lauszus/fftw3-android.svg?branch=master)](https://travis-ci.org/Lauszus/fftw3-android)

Repository for compiling [FFTW3](http://www.fftw.org/) on Android. Based on the following project: <https://github.com/sfomra/FFTW3_MOD-for-Android>.

In order to built this project you need to download and install [Android NDK](https://developer.android.com/studio/projects/add-native-code.html#download-ndk). Then simply run the following command to build FFTW3:

```bash
./build.sh
```

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

### Single-precision 

If you want to compile a single-precision version of FFTW you need add the following defines to [config.h](jni/fftw3/config.h)

```C
#define BENCHFFT_SINGLE 1
#define FFTW_SINGLE 1
```
Then follow the intructions at: <http://www.fftw.org/fftw3_doc/Precision.html#Precision>.

For more information send me an email at <lauszus@gmail.com>.
