#!/usr/bin/env bash
source ./config.sh

sudo losetup -D
sudo modprobe -r g_mass_storage

# Remove the file in case it already exists
sudo rm $IMG_PATH

# Create new file that is IMG_SIZE large
sudo fallocate -l $IMG_SIZE  $IMG_PATH

# Create Partition
sudo echo "start=1, type=7" | sudo sfdisk $IMG_PATH

# Setup loopback device
sudo losetup -o 512 $LB_DEV $IMG_PATH

# Create Filesystem
sudo mkfs.ntfs -L $VOL_LABEL --fast -F $LB_DEV

# Destroy loopback device
sudo losetup -D

# Update volume attributes to read only
{ sudo head -c $READ_ONLY_GUID_START; sudo printf $READ_ONLY_GUID; sudo tail -c $READ_ONLY_GUID_END } > /piusb_ro.bin