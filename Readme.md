# r/Techsupport Bootable Diagnostics and Recovery

This media was created to assist users trying to rescue their systems and data. It contains the tools required to recover files, check network issues, and manipulate or verify disks and their health.

This build is for Trixie (13). The desktop environment is XFCE4.

See `config\package-lists\` for included packages.

## Build
This process has been containerized and put into a DevOps pipeline requiring `podman` and `buildah`. The pipeline will produce an ISO based on the files contained in `/config`.

### Local build
Ensure you have docker installed. If running Windows, it is highly recommended to clone the repository to a Linux environment, such as [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).

Within the Docker Desktop app, head to Resources > WSL Integration and `Enable integration with additional distros` and turn on the toggle switch for the distro you are using. Note: You do not need to manually install Docker within the WSL Linux environment separately, docker will provide this automatically.

Test if Docker works by running `docker --version` in the shell.

Compile and run the build with the following commands:
```sh
docker build -t rts-debian .
docker run --rm --privileged -v "$(pwd):/repo" rts-debian
```

#### Common issues:
* Errors were encountered while processing X package - Manually pull the Debian for docker directly by running `docker pull debian:trixie`.
* Removing build files - The following command will remove everything excess from the build toolchain as per .gitignore (Including the ISO, so make sure you back it up elsewhere for testing!): `sudo git clean -Xdf`

## Tools list

### Basic utilities
* curl - Command-line tool for transferring data with URLs
* wget - Network downloader for retrieving files via HTTP/HTTPS/FTP
* vim - Terminal text editor
* nano - Simple terminal text editor (pre-included with Debian)
* mousepad - Simple GTK+ text editor
* firefox-esr - Mozilla Firefox Extended Support Release web browser
* openssh-client - SSH client for remote access
* rsync - Fast file transfer and synchronization tool (pre-included with Debian)
* sudo - Execute commands as another user (pre-included with Debian)
* tar, gzip, bzip2 - Archive and compression utilities (pre-included with Debian)

### EFI
* [efibootmgr](https://wiki.archlinux.org/title/EFISTUB#efibootmgr) - Manage UEFI boot entries and boot order

### Memory testing
* [memtest86+](https://rtech.support/guides/memtest/memtest86/) - RAM testing tool (select from GRUB menu)

### Stress tests
* stress-ng - Comprehensive system stress testing (CPU, memory, I/O, kernel, 200+ stressors)
* sysbench - Database and application benchmarking tool

### Disk benchmarking
* fio - Advanced storage I/O benchmark (professional-grade, multi-threaded)

### Disk tools
* [gparted](https://rtech.support/disks/disk-management/gparted/) - Partition editor
* [smartmontools](https://rtech.support/docs/disks/disk-health.html#smartmontools) - SMART health monitoring (command-line)
* [gsmartcontrol](https://rtech.support/docs/disks/disk-health.html#gsmartcontrol-gui-method) - GUI frontend for smartmontools
* [nwipe](https://rtech.support/docs/disks/disk-wipe.html) - Secure disk erasure (DoD-compliant wiping)
* [hdparm](https://ata.wiki.kernel.org/index.php/ATA_Secure_Erase) - Drive configuration and benchmarking
* [nvme-cli](https://rtech.support/docs/disks/disk-wipe.html#nvme-ssd) - NVMe SSD management and diagnostics
* [lvm2](https://wiki.archlinux.org/title/LVM) - Logical Volume Manager utilities
* [mdadm](https://wiki.archlinux.org/title/RAID) - Software RAID management
* fdisk - Partition table manipulator (pre-included with Debian)
* parted - Partition editor (pre-included with Debian)

### Filesystem support
* e2fsprogs - Linux ext2/ext3/ext4 filesystem utilities (includes badblocks, debugfs, resize2fs)
* ntfs-3g - Windows NTFS filesystem read/write support
* hfsprogs - Apple HFS/HFS+ filesystem utilities (Mac support)
* exfatprogs - exFAT filesystem support (modern cross-platform USB/SD cards)
* btrfs-progs - Btrfs filesystem utilities (modern Linux filesystem)

### File recovery tools
* [testdisk](https://rtech.support/docs/disks/data-recovery/testdisk.html) - Partition recovery and data recovery (includes photorec)
* gddrescue - Disk imaging and data recovery from failing drives
* clonezilla - Disk cloning and imaging
* safecopy - Data recovery from damaged media

### Encryption
* cryptsetup - LUKS disk encryption management
* [dislocker](https://rtech.support/disks/encryption/dislocker/) - BitLocker encrypted drive access (Windows drive recovery)

### General file utilities
* p7zip-full - 7-Zip compression utility (supports .7z, .zip, .rar archives)

### Windows recovery
* chntpw - Windows password reset and registry editing
* libhivex-bin - Advanced Windows registry manipulation tools (hivexsh, hivexregedit)

### Network tools
* dnsutils - DNS lookup utilities (dig, nslookup, host)
* traceroute - Network path tracing
* [mtr-tiny](https://rtech.support/networking/mtr/) - Network diagnostic tool combining ping and traceroute
* gnome-nettool - GUI network diagnostic tool (ping, netstat, traceroute, port scan)
* wireshark - Network protocol analyzer and packet capture
* ping - ICMP echo tool (pre-included via iputils-ping)
* iproute2 - Advanced IP routing and network configuration tools (ip, ss, etc.) (pre-included with Debian)

### Hardware info
* inxi - Comprehensive CLI hardware info
* usbutils - USB device info (lsusb)
* pciutils - PCI device info (lspci)
* hw-probe - Comprehensive hardware probing and reporting

### System monitoring and logging
* htop - Interactive process viewer
* iotop - I/O monitoring tool
* lm-sensors - Hardware sensor monitoring (temperature, voltage, fans)
* psensor - GUI temperature monitoring with graphs