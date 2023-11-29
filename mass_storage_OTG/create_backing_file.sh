IMG_SIZE="50GiB"
IMG_PATH="/piusb.bin"
VOL_LABEL="PiUSB"
GMO_PARAM="stall=0 ro=1"

# Remove the file in case it already exists
rm $IMG_PATH

# Create new file that is IMG_SIZE large
sudo fallocate -l $IMG_SIZE  $IMG_PATH

# Create Partition
echo "start=1, type=7" | sfdisk $IMG_PATH

# Setup loopback device
losetup -o 512 /dev/loop0 /piusb.bin

# Create Filesystem
sudo mkfs.ntfs -L $VOL_LABEL --fast -F /dev/loop0

# Expose USB device
sudo modprobe g_mass_storage file=$IMG_PATH

