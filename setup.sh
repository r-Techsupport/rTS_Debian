#!/bin/bash

lb clean --purge
rm -rf config/binary config/bootstrap config/build config/chroot config/common
lb config \
	-b iso \
	--uefi-secure-boot auto \
	--cache false \
	--apt-recommends true \
	-a amd64 \
	--binary-images iso \
	--distribution buster \
	--backports true \
	--mode debian \
	--system live \
	--debian-installer-gui false \
	--archive-areas "main contrib non-free" \
	--security false \
	--win32-loader false \
	--apt-indices false \
	--memtest "memtest86+" \
	--updates true \
	--iso-application "r/techsupport testing and rescue media" \
	--iso-preparer "PipeItToDevNull" \
	--iso-publisher "r/techsupport" \
	--interactive false
