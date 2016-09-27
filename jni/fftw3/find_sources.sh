#!/bin/sh -e
# Small script used to help me generate the sources.mk files

for d in rdft/scalar/*/ ; do
    d=$(echo $d | rev | cut -c 2- | rev) # Strip leading slash
    echo "\nDirectory: $d"
    sources=$(find "$d" -maxdepth 1 -type f -name '*.c' | rev | cut -f1 -d'/' | rev | tr '\n' ' ')
    if [ -n "$sources" ]; then
    	echo $sources
    	echo "sources := $sources" > $d/sources.mk
    	echo "LOCAL_SRC_FILES += \$(addprefix $d/, \$(sources))" >> $d/sources.mk
    else
    	echo "No sources found in directory"
    fi;
done
