#!/usr/bin/env bash

set -ex

ARCH_TYPE=$1
USB_DISK=$2

# From MacOS
if [[ $OSTYPE == 'darwin'* ]]; then
    curl -LO "https://github.com/rancher/k3os/releases/download/$(curl https://api.github.com/repos/rancher/k3os/releases/latest | jq '.tag_name' | xargs)/k3os-$ARCH_TYPE.iso"
    diskutil unmountDisk "$USB_DISK"
    hdiutil convert -format UDRW -o k3os.img "k3os-$ARCH_TYPE.iso"
    mv k3os.img.dmg k3os.img
    sudo dd if=k3os.img of="${USB_DISK//disk/rdisk}" bs=1m
    diskutil eject "$USB_DISK"
    rm -rf k3os
fi
