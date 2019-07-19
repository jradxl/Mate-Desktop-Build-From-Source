#!/bin/bash

#I know this is verbose, but I wanted to easily comment things out.

apt update
apt upgrade
apt install build-essential
apt install terminator

#This installs too many dependences
## apt install git-all

apt install git
apt install automake
apt install autoconf

apt install libglib2.0-dev
apt install intltool
apt install gtk-doc-tools
apt install libtool
apt install gobject-introspection
apt install libdconf-dev
apt install xorg-dev
apt install libgdk-pixbuf2.0-dev
apt install libgtk-3-dev
apt install librsvg2-dev
apt install librsvg2-bin
apt install libxklavier-dev
apt install libsoup2.4-dev
##??? apt install xml2
apt install libxml2-utils
apt install icon-naming-utils
apt install libnotify-dev
apt install libgail-3-dev
apt install yelp-tools
apt install libcanberra-gtk3-dev
apt install libdbus-glib-1-dev
##??? apt install libwnck-dev
apt install libwnck-3-dev

apt install libpolkit-agent-1-dev
apt install libgtop2-dev
apt install libgtkmm-3.0-dev
#apt install libgio3.0-cil-dev
apt install libvte-2.91-dev
apt install dconf-cli

##Needed for the Mate University Applet examples
apt install libenchant-dev
apt install libgtksourceview-3.0-dev
apt install libpeas-dev
apt install python3-setuptools
apt install python3-distutils-extra
apt install python3-setproctitle

##Needed for Brisk-Menu
apt install meson
apt install python-gi-dev
apt install clang-format

