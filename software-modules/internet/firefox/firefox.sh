#!/bin/bash

#	firefox.sh
#	Script to build the modular software package of Firefox
#	for huronOS. It purges the unnecessary files on the FS
#	to allow AUFS add/del operations on the fly.
#
#	Copyright (C) 2022, huronOS Project:
#		<http://huronos.org>
#
#	Licensed under the GNU GPL Version 2
#		<http://www.gnu.org/licenses/gpl-2.0.html>	
#
#	Authors:
#		Enya Quetzalli <equetzal@huronos.org>

set -xe
NAME=firefox

## Install software
apt update
apt install --yes --no-install-recommends firefox-esr
apt autoremove --yes

## Prepare final files
cp ./$NAME.desktop /usr/share/applications/

## Create packed changes
savechanges /tmp/$NAME.hsm

## Clean package to maintain only relevant files
hsm2dir /tmp/$NAME.hsm
rm -rf /tmp/$NAME.hsm/var
rm -rf /tmp/$NAME.hsm/root
rm -rf /tmp/$NAME.hsm/home
rm -rf /tmp/$NAME.hsm/etc/hmm
rm -rf /tmp/$NAME.hsm/etc/hsync
rm -rf /tmp/$NAME.hsm/etc/timezone
rm -rf /tmp/$NAME.hsm/etc/localtime
rm -rf /tmp/$NAME.hsm/etc/ld.so.cache
rm -rf /tmp/$NAME.hsm/usr/share/mime
rm -rf /tmp/$NAME.hsm/usr/share/gnome
rm -rf /tmp/$NAME.hsm/usr/share/icons
rm -rf /tmp/$NAME.hsm/usr/share/pixmaps
rm -rf /tmp/$NAME.hsm/usr/share/mime-info
rm -rf /tmp/$NAME.hsm/usr/share/backgrounds
rm -rf /tmp/$NAME.hsm/usr/share/applications/bamf-2.index
rm -rf /tmp/$NAME.hsm/usr/share/applications/mimeinfo.cache
rm -rf /tmp/$NAME.hsm/usr/share/applications/firefox-esr.desktop
dir2hsm /tmp/$NAME.hsm

cp /tmp/$NAME.hsm /run/initramfs/memory/system/huronOS/internet/
echo "Finished creating $NAME.hsm!"
