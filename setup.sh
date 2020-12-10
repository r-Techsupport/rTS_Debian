#!/bin/bash

lb clean --purge
lb config \
	-b iso \
	--cache false \
	--apt-recommends true \
	-a amd64 \
	--binary-images iso \
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
	--iso-publisher "r/techsupport"
