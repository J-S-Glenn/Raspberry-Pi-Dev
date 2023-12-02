#!/usr/bin/env bash
source ./config.sh

# Setup loopback device
sudo losetup $LB_DEV $IMG_PATH

# Create mounting directory
sudo mkdir -p $MOUNT_LOC

# Mount the loopback device
sudo mount -t vfat $LB_DEV $MOUNT_LOC
