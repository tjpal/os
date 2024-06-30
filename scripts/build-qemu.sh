#!/bin/bash

TARGET_PATH=$1

if [ -z $TARGET_PATH ]; then
    echo "Usage: $0 <path to target src directory>"
    exit 1
fi

echo "This script uses sudo to install dependencies with dnf (Fedora only)"
echo "Press Enter to continue."
read

sudo dnf install -y git glib2-devel libfdt-devel pixman-devel zlib-devel bzip2 ninja-build python3

QEMU_VERSION_TAG="v9.0.1"
mkdir -p $TARGET_PATH
git clone https://gitlab.com/qemu-project/qemu.git --branch $QEMU_VERSION_TAG --depth 1 $TARGET_PATH

cd $TARGET_PATH
./configure --target-list=aarch64-softmmu --enable-modules --enable-tcg-interpreter --enable-debug-tcg --python=$(which python3)
make -j$(nproc)

echo "Install qemu with sudo? yes/no"
read install_yes_no

if [ "$install_yes_no" == "yes" ]; then
    sudo make install
fi