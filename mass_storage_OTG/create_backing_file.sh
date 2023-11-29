IMG_SIZE_GB="50GiB"
IMG_PATH="/piusb.bin"

sudo fallocate -l $IMG_SIZE_GB  $IMG_PATH

sudo mkfs -t ext4 $IMG_PATH

