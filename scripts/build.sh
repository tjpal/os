#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $0))
EXTRA_ARGS=""

if [ "$1" == "release" ]; then
    EXTRA_ARGS="--release"
fi


# TODO: Make it configurable depending on the selected board/architecture
LINKER_LIBRARY_PATH=$SCRIPT_DIR/../src/board/raspi4/
LINKER_SCRIPT="linking.ld"

RUSTFLAGS="-C link-arg=--library-path=$LINKER_LIBRARY_PATH -C link-arg=--script=$LINKER_SCRIPT -C target-cpu=cortex-a72"

cargo rustc --target=aarch64-unknown-none-softfloat $EXTRA_ARGS -- $RUSTFLAGS