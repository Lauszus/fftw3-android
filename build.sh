#!/bin/sh -e
# Script used to generate the sources.mk files and then build the project.

for d in `find jni/fftw3 -type d`; do
    sources=$(find "$d" -maxdepth 1 -type f -name '*.c' | rev | cut -f1 -d'/' | rev | sort | tr '\n' ' ') # Find all .c files, extract filename, sort them and replace new line with space
    if [ -n "$sources" ]; then # No sources found in directory
        echo "\nDirectory: $d"
        echo "Sources: $sources"
        echo "sources := $sources" > $d/sources.mk
        echo "LOCAL_SRC_FILES += \$(addprefix $(echo $d | cut -f3- -d'/')/, \$(sources))" >> $d/sources.mk # Strip jni/fftw3/ in front of the directory name
    fi;
done

# Build project
ndk-build
