# Configure Raspberry Pi Zero W as NTFS USB Drive

This guide was created to provide step-by-step instructions
to configure your Raspberry Pi W as a USB storage device.

The reason I wanted to do this was because I wanted to be able to transfer
files to my 3D printer ([Ankermake M5](https://www.ankermake.com/products/m5?variant=42744298373269&discount=WSPECW1DCQ)) without physically carrying a USB to it each time.

Future improvements will include setting up a SAMBA server so that I can drop
the files over the network.

## General Flow Overview
## General Flow Overview
* Backing File Setup
   1. Cleanup pre-existing backing file if it exists.
   2. Create backing file and format as FAT32 using the `mkfs.vfat` command.
* Activating USB functionality
   1. Ensure nothing is accessing the backing file. It is not mounted and there is not a loopback device that is using it.
   2. Enable `g_mass_storage`
* Deactivating USB functionality
  1. Eject the mass storage device from the system safely 
  2. Disable `g_mass_storage`
* Mounting the backing file
  1. Setup loopback device*
  2. If one does not exist, create a mount point
  3. Mount the loopback device

## Quick Start:
1. Update the variables in `config.sh`
<div><table>
<tr><td><strong>IMG_SIZE_GB</strong>="50"<td>Size of the image file to be created in GB</td></tr>
<tr><td><strong>IMG_PATH</strong>="/piusb.bin"<td>Image file name and location</td></tr>
<tr><td><strong>VOL_LABEL</strong>="PiUSB"<td>USB device label when connected to a computer</td></tr>
<tr><td><strong>GMO_PARAM</strong>="stall=0 ro=0"<td>modprobe command parameters sent when activating g_mass_storage</td></tr>
<tr><td><strong>LB_DEV</strong>="/dev/loop0"<td>Name of the loopback device for mounting the backing file. Warning!
Make sure that this variable is set to a loopback device that does not already exist.

You can use the `losetup` command to see the currently active loopback devices.</td></tr>
<tr><td><strong>MOUNT_LOC</strong>=/mnt/usb<td>Location where the loopback device will be mounted.</td></tr>
</table></div>

2. Run `./create_backing_file.sh` to generate and configure the backing file.
3. Run `./activate_usb_device.sh` to expose the backing file as storage through the USB port.

References:

https://linuxlink.timesys.com/docs/wiki/engineering/HOWTO_Use_USB_Gadget_File_Storage
https://magpi.raspberrypi.com/articles/pi-zero-w-smart-usb-flash-drive
https://gist.github.com/kumbasar/49906cb704ce9213c972a3e008c74c0c
