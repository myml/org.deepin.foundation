#!/bin/sh

dirs="$PREFIX /runtime /usr ''"
for dir in $dirs; do
    dir=$(echo "$dir" | tr -d "'")
    PATH=$dir/bin:$PATH
    LIBRARY_PATH=$dir/lib:$dir/lib/$TRIPLET:$LIBRARY_PATH
    PKG_CONFIG_PATH=$dir/lib/pkgconfig:$dir/lib/$TRIPLET/pkgconfig:$dir/share/pkgconfig:$PKG_CONFIG_PATH
done

export PATH="${PATH%:}"
export LIBRARY_PATH="${LIBRARY_PATH%:}"
export LD_LIBRARY_PATH="$LIBRARY_PATH"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH%:}"