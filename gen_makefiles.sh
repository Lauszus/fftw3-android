#!/bin/sh -e
# Script used to generate the sources.mk files

cd jni/fftw3

for d in `find . -type d`; do
    d=$(echo $d | cut -c 3-) # Strip ./ in front of directory name
    if [ ! -d "$d" ]; then
        continue # Skip root directory
    fi;
    echo "\nDirectory: $d"
    sources=$(find "$d" -maxdepth 1 -type f -name '*.c' | rev | cut -f1 -d'/' | rev | tr '\n' ' ') # Find all .c files, extract filename and replace new line with space
    if [ -n "$sources" ]; then
    	echo "Sources: $sources"
    	echo "sources := $sources" > $d/sources.mk
    	echo "LOCAL_SRC_FILES += \$(addprefix $d/, \$(sources))" >> $d/sources.mk
    else
    	echo "No sources found in directory"
    fi;
done
