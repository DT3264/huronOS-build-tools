#!/bin/bash

#	install.sh
#	Script to select, partition, format, configure and install 
#	huronOS on a removable USB storage device.
#	Author:
#		Enya Quetzalli <equetzal@huronos.org>

# $1 = message to print
print_step(){
	echo -e "$(tput setab 2)$(tput bold)$1$(tput sgr0)"
}

print_step "Starting huronOS installation"

## Save the directory where the script is running, it should match the ISO of huronOS
ISO_DIR=$(dirname $(readlink -f $0))
print_step "[1/n] Locating huronOS image -> $ISO_DIR"

## Select the device we want to install huronOS to
print_step "[2/n] Selecting removable device to install huronOS on"
DEVICES=$(lsblk --pairs --output NAME,PATH,HOTPLUG,TYPE,VENDOR,MODEL,SIZE,LABEL --sort NAME) 
COPY_DEVICES="$DEVICES"
DEVNUM=0
echo "Disks compatible with huronOS installation"
while read -r NAME DEV HOTPLUG TYPE VENDOR MODEL SIZE LABEL; do
	## Replace PATH with DEV to avoid replacing the bash-path
	DEV="$(echo $DEV | sed 's/PATH/DEV/g')"

	## The vars contain a literal declaration (eg. 'TYPE="disk"')
	## by declaring them, we make their value usable
	declare "${NAME}"
	declare "${DEV}"
	declare "${HOTPLUG}"
	declare "${TYPE}"
	declare "${VENDOR}"
	declare "${MODEL}"
	declare "${SIZE}"
	declare "${LABEL}"
	#echo -e "$NAME $DEV $HOTPLUG $TYPE $VENDOR $MODEL $SIZE $LABEL"
	
	## Mark disks as green, partitions indented on disk
	if [ "$HOTPLUG" = "1" ] && [ "$TYPE" = "disk" ]; then
		echo -e "\t$(tput setab 2)$(tput setaf 1)$(tput bold)$TYPE $DEVNUM  $DEV  $SIZE  $VENDOR  $MODEL $(tput sgr0)"
		DEVNUM=$((DEVNUM+1))
	elif [ "$HOTPLUG" = "1" ] && [ "$TYPE" = "part" ]; then
		echo -e "\t    $NAME $TYPE $SIZE  $LABEL"
	fi
done < <(echo "$COPY_DEVICES" | xargs -n 8)


## Ask the user the number of the selected disk
read -p "Please, select the disk where you want to install huronOS on:" SELECTION
COPY_DEVICES="$DEVICES"
DEVNUM=0
while read -r NAME DEV HOTPLUG TYPE VENDOR MODEL SIZE LABEL; do
	DEV="$(echo $DEV | sed 's/PATH/DEV/g')"
	declare "${NAME}"
	declare "${DEV}"
	declare "${HOTPLUG}"
	declare "${TYPE}"
	declare "${VENDOR}"
	declare "${MODEL}"
	declare "${SIZE}"
	declare "${LABEL}"
	if [ "$HOTPLUG" = "1" ] && [ "$TYPE" = "disk" ]; then
		if [ $DEVNUM -eq $SELECTION ]; then
			TARGET="$DEV"
		fi
		DEVNUM=$((DEVNUM+1))
	fi
done < <(echo "$COPY_DEVICES" | xargs -n 8)
read -p "The selected disk is $(tput setab 2)$(tput setaf 1)$(tput bold)$TARGET$(tput sgr0), $(tput bold)ALL DATA WILL BE LOST (includes partitions) $(tput sgr0), do you want to continue? (Y/n) " CONFIRM

## Exit if answer is not Y or y
if [ "$CONFIRM" != "Y" ] && [ "$CONFIRM" != "y" ]; then
	print_step "Exiting installer"
	exit 1
fi

## User confirmed, continue

## For each mountpoint that the device is using, kill and unmount
print_step "[3/n] Unmounting selected device partitions"
for MNT_PNT in $(lsblk --output PATH,MOUNTPOINT | grep -E "${TARGET}[1-9]+" | awk '{ print $2 }'); do
	echo "Cleaning $MNT_PNT"
	fuser -k -m "$MNT_PNT" || true
	umount "$MNT_PNT"
done

print_step "[4/n] Partitioning device $TARGET"
## Set positions on the target device
DISK_SIZE=$(blockdev --getsize64 $TARGET)
DISK_SECTORS=$(blockdev --getsz $TARGET)
DISK_SIZE_MB=$(( $DISK_SIZE / 1024 / 1024 )) #Convert disk size to MiB
SYSTEM_PART_END=$(( 5*1024 )) #Set 5GiB to store huronOS
EVENT_PART_END=$(( ( ($DISK_SIZE_MB - $SYSTEM_PART_END) / 2) + SYSTEM_PART_END ))

## Clean possible partition tables, asuming 512 block size dev (hope there's no 1ZiB usbs soon)
dd bs=512 if=/dev/zero of=$TARGET count=34
dd bs=512 if=/dev/zero of=$TARGET count=34 seek=$(( $DISK_SECTORS-34 ))

## Do de partioning
# 0% = minimal start alignment between sector size vs optimal I/O speed
# 100% = maximal end alignment
# part1 = system partition aka. huronOS partition
# part2 = event-persistence partition
# part3 = contest-persistence partition
parted -a optimal --script $TARGET \
	unit MiB \
	mklabel msdos \
	mkpart primary 0% $SYSTEM_PART_END \
	mkpart primary $SYSTEM_PART_END $EVENT_PART_END \
	mkpart primary $EVENT_PART_END 100% \
	set 1 boot on

## Create the filesystems
print_step "[5/n] Creating filesystems"
mkfs.vfat -F 32 -n HURONOS -I "${TARGET}1"
mkfs.ext4 -L event-data -F "${TARGET}2"
mkfs.ext4 -L contest-data -F "${TARGET}3"

## Get the UUIDs
SYSTEM_UUID=$(blkid -o value -s UUID "${TARGET}1")
EVENT_UUID=$(blkid -o value -s UUID "${TARGET}2")
CONTEST_UUID=$(blkid -o value -s UUID "${TARGET}3")
echo "system.uuid=$SYSTEM_UUID"
echo "event.uuid=$EVENT_UUID"
echo "contest.uuid=$CONTEST_UUID"

## Mount filesystems
SYSTEM_MNT=/tmp/$$/SYS
mkdir -p $SYSTEM_MNT
mount UUID=$SYSTEM_UUID $SYSTEM_MNT

## Start copying the contents of huronOS installation
print_step "[6/n] Copying huronOS system data"
cp --verbose -rf $ISO_DIR/huronOS/ $SYSTEM_MNT
cp --verbose -rf $ISO_DIR/boot/ $SYSTEM_MNT
mv --verbose $SYSTEM_MNT/boot/EFI/ $SYSTEM_MNT

## Configure the bootloader
print_step "[7/n] Making device bootable"
sed "s|system.partition=UUID|system.partition=$SYSTEM_UUID|g" -i "$SYSTEM_MNT/boot/huronos.cfg"
sed "s|event.partition=UUID|event.partition=$EVENT_UUID|g" -i "$SYSTEM_MNT/boot/huronos.cfg"
sed "s|contest.partition=UUID|contest.partition=$CONTEST_UUID|g" -i "$SYSTEM_MNT/boot/huronos.cfg"
$SYSTEM_MNT/boot/extlinux.x64 --install $SYSTEM_MNT/boot/

## Configure root password and other things

## Unmount fylesystems
print_step "[8/n] Unmounting device"
umount $SYSTEM_MNT
rm -rf /tmp/$$/

print_step "Done!, you can remove your device now :)"
