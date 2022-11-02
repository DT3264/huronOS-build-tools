#!/bin/bash

#	clean.sh
#	Cleaner for all the installed utilities used to build the kernel
#
#	Copyright (C) 2022, huronOS Project:
#		<http://huronos.org>
#
#	Licensed under the GNU GPL Version 2
#		<http://www.gnu.org/licenses/gpl-2.0.html>	
#
#	Authors:
#		Enya Quetzalli <equetzal@huronos.org>


export PACKAGES="asciidoctor autoconf automake autopoint autotools-dev bc binutils binutils-common binutils-x86-64-linux-gnu bison bsdextrautils build-essential bzip2 ca-certificates cpp cpp-10 debhelper dh-autoreconf dh-exec dh-python dh-strip-nondeterminism diffstat docutils-common dpkg-dev dvipng dwarves dwz ed file flex fontconfig fontconfig-config fonts-dejavu-core fonts-font-awesome fonts-lato fonts-lmodern fonts-urw-base35 g++ g++-10 gcc gcc-10 gcc-10-multilib gcc-multilib gettext ghostscript git graphviz groff-base intltool-debian kernel-wedge lib32asan6 lib32atomic1 lib32gcc-10-dev lib32gcc-s1 lib32gomp1 lib32itm1 lib32quadmath0 lib32stdc++6 lib32ubsan1 libann0 libapache-pom-java libarchive-zip-perl libasan6 libatomic1 libaudit-dev libavahi-client3 libavahi-common-data libavahi-common3 libbabeltrace-dev libbabeltrace1 libbinutils libblkid-dev libc-dev-bin libc6-dev libc6-dev-i386 libc6-dev-x32 libc6-i386 libc6-x32 libcairo2 libcap-dev libcap-ng-dev libcc1-0 libcdt5 libcgraph6 libcommons-logging-java libcommons-parent-java libcrypt-dev libctf-nobfd0 libctf0 libcups2 libdatrie1 libdbus-1-3 libdebhelper-perl libdeflate0 libdpkg-perl libdw-dev libdw1 libelf-dev libexpat1-dev libffi-dev libfile-stripnondeterminism-perl libfontbox-java libfontconfig1 libfribidi0 libgcc-10-dev libgd3 libglib2.0-0 libglib2.0-bin libglib2.0-data libglib2.0-dev libglib2.0-dev-bin libgomp1 libgraphite2-3 libgs9 libgs9-common libgts-0.7-5 libgvc6 libgvpr2 libharfbuzz0b libiberty-dev libice6 libicu67 libidn11 libijs-0.35 libisl23 libitm1 libjbig0 libjbig2dec0 libjpeg62-turbo libjs-jquery libjs-sphinxdoc libjs-underscore libkpathsea6 liblab-gamut1 liblcms2-2 liblsan0 libltdl7 liblzma-dev libmagic-mgc libmagic1 libmount-dev libmpc3 libmpdec3 libmpfr6 libncurses5-dev libncursesw5-dev libnewt-dev libnsl-dev libnuma-dev libnuma1 libopencsd-dev libopencsd0 libopenjp2-7 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpaper-utils libpaper1 libpathplan4 libpci-dev libpcre16-3 libpcre2-16-0 libpcre2-32-0 libpcre2-dev libpcre2-posix2 libpcre3-dev libpcre32-3 libpcrecpp0v5 libpdfbox-java libperl-dev libpipeline1 libpixman-1-0 libpng-dev libptexenc1 libpython3-dev libpython3-stdlib libpython3.9 libpython3.9-dev libpython3.9-minimal libpython3.9-stdlib libquadmath0 libruby2.7 libselinux1-dev libsepol1-dev libsigsegv2 libslang2-dev libsm6 libsqlite3-0 libssl-dev libstdc++-10-dev libsub-override-perl libsynctex2 libteckit0 libtexlua53 libtexluajit2 libthai-data libthai0 libtiff5 libtirpc-dev libtool libtsan0 libubsan1 libuchardet0 libudev-dev libunwind-dev libunwind8 libwebp6 libwrap0 libwrap0-dev libx11-6 libx11-data libx32asan6 libx32atomic1 libx32gcc-10-dev libx32gcc-s1 libx32gomp1 libx32itm1 libx32quadmath0 libx32stdc++6 libx32ubsan1 libxau6 libxaw7 libxcb-render0 libxcb-shm0 libxcb1 libxdmcp6 libxext6 libxi6 libxml2 libxmu6 libxpm4 libxrender1 libxt6 libyaml-0-2 libzzip-0-13 linux-libc-dev lz4 m4 make man-db media-types openssl patch patchutils pkg-config po-debconf poppler-data preview-latex-style python-babel-localedata python3 python3-alabaster python3-babel python3-certifi python3-chardet python3-dev python3-distutils python3-docutils python3-idna python3-imagesize python3-jinja2 python3-lib2to3 python3-markupsafe python3-minimal python3-packaging python3-pkg-resources python3-pygments python3-pyparsing python3-requests python3-roman python3-six python3-snowballstemmer python3-sphinx python3-sphinx-rtd-theme python3-tz python3-urllib3 python3.9 python3.9-dev python3.9-minimal quilt rake rsync ruby ruby-asciidoctor ruby-minitest ruby-net-telnet ruby-power-assert ruby-rubygems ruby-test-unit ruby-xmlrpc ruby2.7 rubygems-integration sgml-base sphinx-common sphinx-rtd-theme-common t1utils tex-common texlive-base texlive-binaries texlive-latex-base texlive-latex-extra texlive-latex-recommended texlive-pictures uuid-dev x11-common xdg-utils xml-core xz-utils zlib1g-dev"

apt remove --yes $PACKAGES
for KERNEL_PACKAGE in $(dpkg --list | grep -Ei 'linux-image|linux-headers|linux-modules' | awk '{ print $2 }'); do
	yes | apt purge "$KERNEL_PACKAGE"
done

apt autoremove --purge --yes
apt clean --yes
