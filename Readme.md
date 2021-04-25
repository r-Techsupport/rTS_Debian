# r/Techsupport Rescue Media

This media was created to assist users trying to rescue their systems and data. It contains the tools required to recover files, check network issues, and manipulate or verify disks and their health.

This is build is for Buster with backports of `linux-image-amd64` 5.9 and AMD firmware.

See `config\package-lists\` for included packages.

### Tools list
#### basics
* curl
* wget

#### efi
* efibootmgr

#### disk tools
* gparted
* smartmontools
* gsmartcontrol
* nwipe
* hdparm
* ntfs-3g
* hfsprogs
* nvme-cli

#### files
* p7zip-full

#### net tools
* dnsutils
* traceroute
* gnome-nettool
* wireshark-gtk

#### encryption
* cryptsetup
* dislocker

#### recovery tools
* testdisk
* gddrescue
* clonezilla