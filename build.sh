#!/usr/bin/env bash

set -xe

# specify source files
SRC_FILES=(adder.c main.zig)

# find global C compiler include directories
CC_INCLUDE_DIRS+=$(cc -E -Wp,-v -xc /dev/null 2>&1 | sed -n '/#include </,/> search ends here:/p' | sed 's/ \//-I\//g' | grep -E '^-I' | tr '\n' ' ')
CC_INCLUDE_DIRS+="-I."

# zig build-exe flags
ZIG_FLAGS=(-OReleaseFast -fstrip)

# provide Zig compiler C include dirs, build flags and libraries to link (here just libc)
zig build-exe $CC_INCLUDE_DIRS "${ZIG_FLAGS[@]}" "${SRC_FILES[@]}" -lc
rm -f *.o
