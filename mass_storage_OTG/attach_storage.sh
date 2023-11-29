#!/usr/bin/env bash
source ./config.sh

# Setup loopback device
sudo losetup -o 512 $LB_DEV $IMG_PATH

# Create mounting directory
sudo mkdir -p $MOUNT_LOC

# Mount the loopback device
sudo mount -t ntfs $LB_DEV $MOUNT_LOC
