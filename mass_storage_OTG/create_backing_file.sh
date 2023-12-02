#!/usr/bin/env bash
source ./config.sh

sudo losetup -D
sudo modprobe -r g_mass_storage

# Remove the file in case it already exists
sudo rm $IMG_PATH

# Create new file that is IMG_SIZE large
sudo fallocate -l $IMG_SIZE  $IMG_PATH

# Create Partition
sudo echo "start=2048, type=b, bootable" | sudo sfdisk $IMG_PATH

# Create Filesystem
sudo mkfs.fat -F 32 -n $VOL_LABEL --mbr=no --offset=4 $IMG_PATH
