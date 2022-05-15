#!/bin/bash

#	shared-libs.sh
#	This module preinstall most of the required dependencies
#	of the modular-software available for huronOS.
#	(eg. required software by ICPC or IOI)

#	Author, the huronOS team:
#		Enya Quetzalli <equetzal@huronos.org>

set -xe

systemctl stop hsync.timer
systemctl stop hsync.service
/usr/lib/hsync/hsync.apply /etc/hsync/default
hmm block-update /etc/hmm/any
rm -rf /etc/hsync/directives
rm -rf /etc/hmm/current
rm -rf /usr/share/backgrounds/custom*
rm -rf /var/log/hsync.log

LIBS="binutils binutils-common binutils-x86-64-linux-gnu ca-certificates-java cpp cpp-10 dirmngr gir1.2-gtksource-4 git gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client gpg-wks-server gpgconf gpgsm install-info java-common kded5 kinit kio kpackagetool5 ktexteditor-data kwayland-data liba52-0.7.4 libaccounts-glib0 libaccounts-qt5-1 libamtk-5-0 libamtk-5-common libapr1 libaprutil1 libaribb24-0 libasan6 libasound2 libassuan0 libastyle3 libatomic1 libavformat58 libbinutils libc-dev-bin libc6-dev libcc1-0 libcddb2 libclang1-11 libcodeblocks0 libcrypt-dev libctf-nobfd0 libctf0 libcurl4 libdbusmenu-qt5-2 libdouble-conversion3 libdvbpsi10 libebml5 libeditorconfig0 libevent-2.1-7 libfam0 libgbm1 libgcc-10-dev libgcrypt20 libgit2-1.1 libglib2.0-bin libgpgme11 libgpgmepp6 libgrantlee-templates5 libgspell-1-2 libgspell-1-common libgtk-3-0 libgtksourceview-4-0 libgtksourceview-4-common libhttp-parser2.9 libidn11 libisl23 libitm1 libixml10 libjs-underscore libkaccounts2 libkasten4controllers0 libkasten4core0 libkasten4gui0 libkasten4okteta2controllers0 libkasten4okteta2core0 libkasten4okteta2gui0 libkf5activities5 libkf5archive5 libkf5attica5 libkf5auth-data libkf5auth5 libkf5authcore5 libkf5bluezqt-data libkf5bluezqt6 libkf5bookmarks-data libkf5bookmarks5 libkf5calendarevents5 libkf5codecs-data libkf5codecs5 libkf5completion-data libkf5completion5 libkf5config-data libkf5configcore5 libkf5configgui5 libkf5configwidgets-data libkf5configwidgets5 libkf5coreaddons-data libkf5coreaddons5 libkf5crash5 libkf5dbusaddons-data libkf5dbusaddons5 libkf5declarative-data libkf5declarative5 libkf5doctools5 libkf5globalaccel-bin libkf5globalaccel-data libkf5globalaccel5 libkf5globalaccelprivate5 libkf5guiaddons5 libkf5i18n-data libkf5i18n5 libkf5iconthemes-data libkf5iconthemes5 libkf5itemmodels5 libkf5itemviews-data libkf5itemviews5 libkf5jobwidgets-data libkf5jobwidgets5 libkf5kcmutils-data libkf5kcmutils5 libkf5kiocore5 libkf5kiofilewidgets5 libkf5kiogui5 libkf5kiontlm5 libkf5kiowidgets5 libkf5newstuff-data libkf5newstuff5 libkf5newstuffcore5 libkf5notifications-data libkf5notifications5 libkf5notifyconfig-data libkf5notifyconfig5 libkf5package-data libkf5package5 libkf5parts-data libkf5parts5 libkf5plasma5 libkf5plasmaquick5 libkf5purpose-bin libkf5purpose5 libkf5quickaddons5 libkf5service-bin libkf5service-data libkf5service5 libkf5solid5 libkf5solid5-data libkf5sonnet5-data libkf5sonnetcore5 libkf5sonnetui5 libkf5syntaxhighlighting-data libkf5syntaxhighlighting5 libkf5sysguard-data libkf5texteditor-bin libkf5texteditor5 libkf5textwidgets-data libkf5textwidgets5 libkf5threadweaver5 libkf5wallet-bin libkf5wallet-data libkf5wallet5 libkf5waylandclient5 libkf5widgetsaddons-data libkf5widgetsaddons5 libkf5windowsystem-data libkf5windowsystem5 libkf5xmlgui-data libkf5xmlgui5 libkomparediff2-5 libksba8 libksysguardformatter1 libkuserfeedbackcore1 libkuserfeedbackwidgets1 libkwalletbackend5-5 liblirc-client0 liblsan0 libm17n-0 libmad0 libmatroska7 libmbedcrypto3 libmbedtls12 libmbedx509-0 libmd4c0 libminizip1 libmpc3 libmpeg2-4 libmpfr6 libmtp-common libmtp9 libmysofa1 libnfs13 libnorm1 libnotify4 libnpth0 libnsl-dev libnss3 libokteta-l10n libokteta3core0 libokteta3gui0 libopenmpt-modplug1 libotf0 libpcre2-16-0 libpgm-5.3-0 libphonon4qt5-4 libphonon4qt5-data libplacebo72 libpolkit-qt5-1-1 libpostproc55 libprocesscore9 libprocessui9 libprotobuf-lite23 libqca-qt5-2 libqt5core5a libqt5dbus5 libqt5gui5 libqt5help5 libqt5network5 libqt5positioning5 libqt5printsupport5 libqt5qml5 libqt5qmlmodels5 libqt5qmlworkerscript5 libqt5quick5 libqt5quickcontrols2-5 libqt5quicktemplates2-5 libqt5quickwidgets5 libqt5script5 libqt5sensors5 libqt5sql5 libqt5svg5 libqt5texttospeech5 libqt5waylandclient5 libqt5webchannel5 libqt5webengine-data libqt5webenginecore5 libqt5webenginewidgets5 libqt5webkit5 libqt5widgets5 libqt5x11extras5 libqt5xml5 libqt5xmlpatterns5 libquadmath0 librabbitmq4 libre2-9 libresid-builder0c2a libsdl-image1.2 libsdl1.2debian libserf-1-1 libsidplay2 libsignon-qt5-1 libsodium23 libspatialaudio0 libspeexdsp1 libssh-gcrypt-4 libstdc++-10-dev libsvn1 libswscale5 libtcl8.6 libtepl-5-0 libtinyxml2.6.2v5 libtirpc-dev libtsan0 libubsan1 libupnp13 libutf8proc2 libva-wayland2 libvlc5 libvlccore9 libwxbase3.0-0v5 libwxgtk3.0-gtk3-0v5 libx11-xcb1 libxcb-composite0 libxcb-damage0 libxcb-dri3-0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-xinerama0 libxcb-xinput0 libxcb-xv0 libxkbfile1 libxss1 libxtst6 libyaml-0-2 libzmq5 linux-libc-dev m17n-db phonon4qt5 phonon4qt5-backend-vlc pinentry-curses plasma-framework pypy3-lib python3-cairo python3-gi python3-gi-cairo qml-module-org-kde-bluezqt qml-module-org-kde-kconfig qml-module-org-kde-kquickcontrols qml-module-org-kde-kquickcontrolsaddons qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings qml-module-qtgraphicaleffects qml-module-qtqml qml-module-qtqml-models2 qml-module-qtquick-controls qml-module-qtquick-controls2 qml-module-qtquick-dialogs qml-module-qtquick-layouts qml-module-qtquick-privatewidgets qml-module-qtquick-templates2 qml-module-qtquick-window2 qml-module-qtquick-xmllistmodel qml-module-qtquick2 qml-module-qtwebkit ruby-minitest ruby-net-telnet ruby-power-assert ruby-test-unit ruby-xmlrpc rubygems-integration tmux vlc-data vlc-plugin-base vlc-plugin-video-output xdg-utils"
apt update
apt install --yes --no-install-recommends $LIBS

mkdir -p /usr/share/glib-2.0/schemas/
cp gschemas.compiled /usr/share/glib-2.0/schemas/

savechanges /tmp/04-shared-libs.hsm
cp /tmp/04-shared-libs.hsm /run/initramfs/memory/data/huronOS/base --verbose
