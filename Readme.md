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
* [gparted](https://rtech.support/books/troubleshooting-with-a-live-session/page/manipulating-partitions-and-disks-with-gparted)
* [smartmontools](https://rtech.support/books/software-we-recommend/page/verifying-disk-health#bkmrk-smartmontools)
* [gsmartcontrol](https://rtech.support/books/troubleshooting-with-a-live-session/page/checking-the-health-of-disks)
* [nwipe](https://rtech.support/books/troubleshooting-with-a-live-session/page/wiping-disks#bkmrk-hdd)
* [hdparm](https://ata.wiki.kernel.org/index.php/ATA_Secure_Erase)
* ntfs-3g
* hfsprogs
* [nvme-cli](https://rtech.support/books/troubleshooting-with-a-live-session/page/wiping-disks#bkmrk-nvme-ssd)
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
* [testdisk](https://rtech.support/books/troubleshooting-with-a-live-session/page/data-recovery#bkmrk-testdisk-to-recover-)
* gddrescue
* clonezilla

### hardware
* usbutils
* pciutils
* hardinfo
