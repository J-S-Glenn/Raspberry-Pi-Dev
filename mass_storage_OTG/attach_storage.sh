#!/usr/bin/env bash

source ./config.sh

MOUNT_LOC=/mnt/usb
IMG_PATH="/piusb.bin"
LB_DEV="/dev/loop0"

# Setup loopback device
sudo losetup -o 512 $LB_DEV $IMG_PATH

# Create mounting directory
sudo mkdir -p $MOUNT_LOC

# Mount the loopback device
sudo mount -t ntfs $LB_DEV MOUNT_LOC