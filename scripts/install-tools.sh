#!/bin/bash

echo "This script uses sudo to install tools with dnf (Fedora only)"
echo "Press Enter to continue."

read

sudo dnf -y install qemu