#!/bin/bash

# setup
lb clean --purge
rm -rf config/binary config/bootstrap config/build config/chroot config/common
lb config \
	-b iso \
	--uefi-secure-boot auto \
	--cache false \
	--apt-recommends true \
	-a arm64 \
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
	--memtest "memtest86+" \
	--updates true \
	--iso-application "r/techsupport testing and rescue media" \
	--iso-preparer "PipeItToDevNull" \
	--iso-publisher "r/techsupport" \
	--interactive false

# build
lb build
