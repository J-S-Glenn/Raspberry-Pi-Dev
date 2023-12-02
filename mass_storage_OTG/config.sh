#!/usr/bin/env bash
IMG_SIZE_GB="80"
IMG_SIZE_SEC=$(( "$IMG_SIZE_GB * 1048576" )) #Convert GB to Blocks
IMG_PATH="/piusb.bin"
VOL_LABEL="PiUSB"
GMO_PARAM="stall=0 ro=0"
LB_DEV="/dev/loop0"
MOUNT_LOC=/mnt/usb
