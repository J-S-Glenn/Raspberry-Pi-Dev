IMG_SIZE="50GiB"
IMG_PATH="/piusb.bin"
VOL_LABEL="PiUSB"
GMO_PARAM="stall=0 ro=1"
LB_DEV="/dev/loop0"

# Remove the file in case it already exists
sudo rm $IMG_PATH

# Create new file that is IMG_SIZE large
sudo fallocate -l $IMG_SIZE  $IMG_PATH

# Create Partition
sudo echo "start=1, type=7" | sfdisk $IMG_PATH

# Setup loopback device
sudo losetup -o 512 $LB_DEV $IMG_PATH

# Create Filesystem
sudo mkfs.ntfs -L $VOL_LABEL --fast -F $LB_DEV

# Destroy loopback device
sudo losetup -D

# Expose USB device
sudo modprobe g_mass_storage file=$IMG_PATH

