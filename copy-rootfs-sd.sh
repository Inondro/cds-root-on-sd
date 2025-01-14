#!/bin/bash
# Mount the SD as /mnt
sudo mount /dev/mmcblk1p1 /mnt
# Copy over the rootfs from the SD card to the SSD
sudo rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt
# We want to keep the SD mounted for further operations
# So we do not unmount the SD
