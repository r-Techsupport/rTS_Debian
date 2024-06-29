# r/Techsupport Bootable Diagnostics and Recovery

This media was created to assist users trying to rescue their systems and data. It contains the tools required to recover files, check network issues, and manipulate or verify disks and their health.

This is build is for Bullseye (11).

See `config\package-lists\` for included packages.

## Build
This process has been containerized and put into a DevOps pipeline requiring `podman` and `buildah`. The pipeline will produce an ISO based on the files contained in `/config`.

## Tools list
### basics
* curl
* wget
* mousepad
* firefox-esr

### efi
* [efibootmgr](https://wiki.archlinux.org/title/EFISTUB#efibootmgr)

### disk tools
* [gparted](https://rtech.support/docs/disks/gparted)
* [smartmontools](https://rtech.support/docs/disks/disk-health.html#smartmontools)
* [gsmartcontrol](https://rtech.support/docs/disks/disk-health.html#gsmartcontrol-gui-method)
* [nwipe](https://rtech.support/docs/disks/disk-wipe.html)
* [hdparm](https://ata.wiki.kernel.org/index.php/ATA_Secure_Erase)
* ntfs-3g
* hfsprogs
* [nvme-cli](https://rtech.support/docs/disks/disk-wipe.html#nvme-ssd)
* mdadm

### files
* p7zip-full

### net tools
* dnsutils
* traceroute
* gnome-nettool
* wireshark-gtk

### encryption
* cryptsetup
* dislocker

### recovery tools
* [testdisk](https://rtech.support/docs/disks/data-recovery/testdisk.html)
* gddrescue
* clonezilla

### hardware
* usbutils
* pciutils
* hardinfo

#### A note on sudo in podman and --privileged
It is required for the `chroot` stage of livebuild. See https://github.com/containers/podman/issues/4619
