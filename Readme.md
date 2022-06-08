# r/Techsupport Rescue Media

This media was created to assist users trying to rescue their systems and data. It contains the tools required to recover files, check network issues, and manipulate or verify disks and their health.

This is build is for Bullseye (11).

See `config\package-lists\` for included packages.

## Build
This process has been containerized requiring `podman` and `buildah`. Execute the respective scripts (`Buildah.sh` and `PodmanRun.sh`) to produce an ISO based on the files contained in `/config`.

## Tools list
### basics
* curl
* wget
* mousepad
* firefox-esr

### efi
* efibootmgr

### disk tools
* gparted
* smartmontools
* gsmartcontrol
* nwipe
* hdparm
* ntfs-3g
* hfsprogs
* nvme-cli

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
* testdisk
* gddrescue
* clonezilla
