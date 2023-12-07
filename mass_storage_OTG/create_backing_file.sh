#!/usr/bin/env bash
source ./config.sh

sudo losetup -D
sudo modprobe -r g_mass_storage

# Remove the file in case it already exists
sudo rm $IMG_PATH
echo $IMG_SIZE_SEC
sudo mkfs.vfat -C -F 32 -n $VOL_LABEL --mbr=yes -v $IMG_PATH $IMG_SIZE_SEC
