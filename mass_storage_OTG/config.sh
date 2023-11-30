#!/usr/bin/env bash
IMG_SIZE="50GiB"
IMG_PATH="/piusb.bin"
VOL_LABEL="PiUSB"
GMO_PARAM="stall=0 ro=0"
LB_DEV="/dev/loop0"
MOUNT_LOC=/mnt/usb
READ_ONLY_GUID="\xA2\xA0\xD0\xEB\xE5\xB9\x33\x44\x87\xC0\x68\xB6\xB7\x26\x99\xC7\x00\x00\x00\x00\x00\x00\x00\x10"
READ_ONLY_GUID_START="400"
READ_ONLY_GUID_END="+424"