#!/bin/bash
SCRIPT_DIR=$(dirname $(readlink -f $0))
KERNEL_PATH=$SCRIPT_DIR/../target/aarch64-unknown-none-softfloat/debug/os

qemu-system-aarch64 -machine raspi4b -kernel $KERNEL_PATH -d in_asm -display none