set IMG_SIZE_GB = 50
set  IMG_PATH = /piusb.bin

if [%IMG_PATH%]; then
    echo "The file already exists!"
    exit 1
fi

sudo fallocate -l 50G %IMG_PATH%

sudo mkfs -t ext4 %IMG_PATH%

