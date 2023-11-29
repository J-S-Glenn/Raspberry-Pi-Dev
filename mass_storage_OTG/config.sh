#!/usr/bin/env bash

source ./config.sh

IMG_SIZE="50GiB"
IMG_PATH="/piusb.bin"
VOL_LABEL="PiUSB"
GMO_PARAM="stall=0 ro=1"
LB_DEV="/dev/loop0"
MOUNT_LOC=/mnt/usb