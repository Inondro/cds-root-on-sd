# rootOnNVMe
Switch the rootfs to a SD-Card on the Jetson Xavier NX and Jetson AGX Xavier

These scripts install a service which runs at startup to point the rootfs to a SD-Card installed on /dev/mmcblk1

This is taken from the NVIDIA Jetson AGX Xavier forum https://forums.developer.nvidia.com/t/how-to-boot-from-nvme-ssd/65147/22, written by user crazy_yorik (https://forums.developer.nvidia.com/u/crazy_yorick). Thank you crazy_yorik!

This procedure should be done on a fresh install of the SD card. Install the SD-Card into the slot of the Jetson, and format it gpt, ext4, and setup a partition (p1).

Next, copy the rootfs of the SD card to the SSD
```
$ ./copy-rootfs-sd.sh
```

Then, setup the service. This will copy the .service file to the correct location, and install a startup script to set the rootfs to the SD.
```
$ ./setup-service.sh
```

After setting up the service, reboot for the changes to take effect.

### Boot Notes
These script changes the rootfs to the SD after the kernel image is loaded from the eMMC.