#!/bin/bash

set -xe
NAME=gvim

## Install software
apt update
apt install --yes --no-install-recommends vim-gtk3
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
rm -rf /tmp/$NAME.hsm/usr/share/gnome
rm -rf /tmp/$NAME.hsm/usr/share/mime
rm -rf /tmp/$NAME.hsm/usr/share/icons/hicolor/icon-theme.cache
rm -rf /tmp/$NAME.hsm/usr/share/applications/bamf-2.index
rm -rf /tmp/$NAME.hsm/usr/share/applications/mimeinfo.cache
rm -rf /tmp/$NAME.hsm/usr/bin/vim
rm -rf /tmp/$NAME.hsm/usr/bin/vimdiff
rm -rf /tmp/$NAME.hsm/usr/bin/rvim
rm -rf /tmp/$NAME.hsm/usr/bin/rview
rm -rf /tmp/$NAME.hsm/usr/bin/vi
rm -rf /tmp/$NAME.hsm/usr/bin/view
rm -rf /tmp/$NAME.hsm/usr/bin/ex
rm -rf /tmp/$NAME.hsm/etc/alternatives/vim
rm -rf /tmp/$NAME.hsm/etc/alternatives/vimdiff
rm -rf /tmp/$NAME.hsm/etc/alternatives/rvim
rm -rf /tmp/$NAME.hsm/etc/alternatives/rview
rm -rf /tmp/$NAME.hsm/etc/alternatives/vi
rm -rf /tmp/$NAME.hsm/etc/alternatives/view
rm -rf /tmp/$NAME.hsm/etc/alternatives/ex
dir2hsm /tmp/$NAME.hsm

cp /tmp/$NAME.hsm /run/initramfs/memory/data/huronOS/programming/
echo "Finished creating $NAME.hsm!"