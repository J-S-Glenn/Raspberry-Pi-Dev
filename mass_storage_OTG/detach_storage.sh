#!/usr/bin/env bash
source ./config.sh

sudo umount $MOUNT_LOC
sudo losetup -D
