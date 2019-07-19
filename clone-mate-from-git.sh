#!/bin/bash
if [ ! -d mate-common ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-common.git
fi

if [ ! -d mate-desktop ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-desktop.git
fi

if [ ! -d libmatekbd ]; then
	git clone -b 1.22 https://github.com/mate-desktop/libmatekbd.git
fi

if [ ! -d libmateweather ]; then
	git clone -b 1.22 https://github.com/mate-desktop/libmateweather.git
fi

if [ ! -d mate-icon-theme ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-icon-theme.git
fi

if [ ! -d caja ]; then
	git clone -b 1.22 https://github.com/mate-desktop/caja.git
fi

if [ ! -d marco ]; then
	git clone -b 1.22 https://github.com/mate-desktop/marco.git
fi

if [ ! -d mate-settings-daemon ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-polkit.git
fi

if [ ! -d mate-settings-daemon ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-settings-daemon.git
fi

if [ ! -d mate-session-manager ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-session-manager.git
fi

if [ ! -d mate-menus ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-menus.git
fi

if [ ! -d mate-panel ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-panel.git
fi

if [ ! -d mate-control-center ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-control-center.git
fi

if [ ! -d mate-system-monitor ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-system-monitor.git
fi

if [ ! -d mate-utils ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-utils.git
fi

if [ ! -d mate-terminal ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-terminal.git
fi

if [ ! -d mate-backgrounds ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-backgrounds.git
fi

#Requires GTK2
if [ ! -d mate-themes ]; then
	git clone -b gtk3.22 https://github.com/mate-desktop/mate-themes.git
fi

if [ ! -d mate-notification-daemon ]; then
	git clone -b 1.22 https://github.com/mate-desktop/mate-notification-daemon.git
fi

if [ ! -d pluma ]; then
	git clone -b 1.22 https://github.com/mate-desktop/pluma.git
fi

if [ ! -d mate-university ]; then
	git clone https://github.com/mate-desktop/mate-university.git
fi

if [ ! -d mate-tweak ]; then
	git clone -b 19.10.1 --depth 1 https://github.com/ubuntu-mate/mate-tweak.git
fi

if [ ! -d brisk-menu ]; then
	#git clone https://github.com/solus-project/brisk-menu.git
	git clone https://github.com/getsolus/brisk-menu.git
fi

echo "Done"
