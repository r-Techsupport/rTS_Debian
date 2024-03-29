#!/bin/bash

# setup
lb clean --purge
rm -rf config/binary config/bootstrap config/build config/chroot config/common
lb config \
	-b iso \
	--uefi-secure-boot auto \
	--cache false \
	--apt-recommends true \
	-a amd64 \
	--binary-images iso \
	--distribution bullseye \
	--backports false \
	--mode debian \
	--system live \
	--debian-installer-gui false \
	--archive-areas "main contrib non-free" \
	--security false \
	--win32-loader false \
	--apt-indices false \
	--memtest none \
	--updates true \
	--iso-application "rts bootable diagnostics and recovery" \
	--iso-preparer "PipeItToDevNull" \
	--iso-publisher "r/techsupport" \
	--interactive false

# build
lb build
