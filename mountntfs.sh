#!/bin/bash


DeviceName=disk3
MountName=NtfsRW
DIR1=/Volumes/${MountName}1
DIR2=/Volumes/${MountName}2
DIR3=/Volumes/${MountName}3

echo ====== Device Name is $DeviceName
echo ====== I am $(whoami) 

if [ `whoami` != "root" ];then
	echo "run me as root."
	exit
fi

if [ ! -b /dev/disk3s1 ];then
	echo "cannot find disk3."
	exit
fi

if [ -d /Volumes/新加卷 ];then
	echo hdiutil eject 新加卷...
	hdiutil eject /Volumes/新加卷
fi

if [ -d $DIR1 ];then
	echo hdiutil eject $DIR1 ...
	hdiutil eject $DIR1
else
	echo mount_ntfs -o rw,nobrowse diskname dir...
	mkdir $DIR1
	mkdir $DIR2
	mkdir $DIR3
	mount_ntfs -o rw,nobrowse /dev/${DeviceName}s1 $DIR1
	mount_ntfs -o rw,nobrowse /dev/${DeviceName}s2 $DIR2
	mount_ntfs -o rw,nobrowse /dev/${DeviceName}s3 $DIR3
	echo mount_ntfs finish.
	open $DIR1
	open $DIR2
	open $DIR3
fi

