#!/bin/bash

EXTRA_ARGS=""

if [ "$1" == "release" ]; then
    EXTRA_ARGS="--release"
fi

cargo build --target=aarch64-unknown-none-softfloat $EXTRA_ARGS