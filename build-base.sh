#!/bin/bash -e

#REF
#https://wiki.mate-desktop.org/building

#Based on this script. Thanks to orginal author.
#https://wiki.mate-desktop.org/buildscript

#2019-07-19
#Enhanced to include Mate Tweak, Mate University and Brisk Menu
#Uninstall option completed.

listofpackages=(
    mate-common
    mate-desktop
    libmatekbd
    libmateweather
    mate-icon-theme
    caja
    marco
    mate-polkit
    mate-settings-daemon
    mate-session-manager
    mate-menus
    mate-panel
    mate-control-center
    mate-system-monitor
    mate-utils
    mate-terminal
    mate-backgrounds
    ##mate-themes requires GTK2
    mate-themes
    mate-notification-daemon
    mate-tweak
    pluma
    mate-university
)

##Not currently used
listofpackages2=(
	mate-common
	mate-conf
	libmatecomponent
	mate-mime-data
	mate-vfs
	libmate
	libmatecanvas
	libmatecomponentui
	libmatekeyring
	mate-keyring
	libmateui
	libmatenotify
	libmatekbd
	libmateweather
	mate-icon-theme
	mate-dialogs
	mate-desktop
	mate-file-manager
	mate-notification-daemon
	mate-backgrounds
	mate-menus
	marco
	mate-polkit
	mate-settings-daemon
	mate-control-center
	mate-panel
	mate-session-manager
)

# Currently not used
# ORGINAL AUTHOR COMMENT - some packages are commented out, as I am having trouble building them
listofpackagesextra=(
	mate-applets
	mate-file-manager-sendto
	#mate-bluetooth
	mate-calc
	mate-display-manager
	mate-document-viewer
	mate-file-archiver
	mate-image-viewer
	#mate-power-manager
	mate-screensaver
	mate-system-monitor
	#mate-system-tools
	mate-terminal
	mate-text-editor
	mate-themes
)

log="`pwd`/build_log.txt"
sublog="buildlog.txt"
#Not Used config_opts="--prefix=/usr/local --sysconfdir=/etc --localstatedir=/var --disable-static --disable-schemas-compile"

#Seems to work with just this group of base arguments
#Not that the .configure arguments can be different for each application, see exception clauses
config_opts="--prefix=/usr/local --sysconfdir=/etc --localstatedir=/var"

make_opts="-j`cat /proc/cpuinfo | grep processor | wc -l`"
 
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:/usr/local/share/pkgconfig/

#Only one path appears to be needed
export ACLOCAL_FLAGS="-I /usr/local/share/aclocal/"

#Not Used export PYTHONPATH=${PYTHONPATH}:/usr/local/lib/python2.7/site-packages/
export XDG_DATA_DIRS=/usr/local/share

export CFLAGS="-march=native"

clean=false
uninstall=false
base=false

#Trying to make script a little more robust against mistaken executions!
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please use clean, uninstall, base, extra."
    exit 1
fi

#Multiple can be specified but I've not tried them
#Defaults to the Base list of packages.
for arg in $@
do  
	echo "Found argument: $arg"
	case "$arg" in
		clean)
			clean=true  ;;
		uninstall)
			uninstall=true  ;;
		base)
			base=true  ;;
		extra)
			listofpackages=( ${listofpackagesextra[@]} ) ;;
		*)
			echo "Wrong argument(s): Please use clean, uninstall, base, extra." ; exit 1 ;;
	esac
done
 
fail() {
	name=$1
	action=$2
	echo $name "failed to" $action | tee -a $log
	echo "see log file" ${name}/$sublog  | tee -a $log
	exit 1
}

echo $clean
echo $uninstall
echo $base
echo $make_opts
echo $config_opts

#exit 1

for i in $(seq 0 $((${#listofpackages[@]} - 1))); do
	name=${listofpackages[$i]}

	echo "Building $name" `date` | tee -a $log

	if [[ -d $name ]]; then
		cd $name

		if [[ "${name}" == "mate-applets" ]]
		then
			config_opts_extra="--disable-cpufreq"
		else
			config_opts_extra=""
		fi

		if [[ "${name}" == "mate-panel" ]]
		then
			echo "Mate-Panel, enabling Introspection"
			config_opts_extra="--enable-introspection"
		else
			config_opts_extra=""
		fi

		##TODO support the INSTALLDONE
		##Currently will always build
		if [[ "${name}" == "mate-tweak" ]]
		then
			echo "Mate-Tweak is a python build"
            sudo ./setup.py install
			cd ..
			continue
		fi

		if [[ -f INSTALLDONE ]] && $uninstall ;
		then
			echo "$name Uninstalling..."  | tee -a $log
                        sudo make uninstall
			cd ..
			continue
		fi
 
		if [[ -f INSTALLDONE ]] && ! $clean;
		then
			echo "$name already done"  | tee -a $log
			cd ..
			continue
		fi

		rm $sublog INSTALLDONE 2>/dev/null || true

		if [[ ! -f configure ]] || $clean
		then
			echo "autogen.sh $name" `date` | tee -a $log
			./autogen.sh $config_opts $config_opts_extra &>> $sublog  || fail $name  "autogen" 
			echo "clean $name" `date` | tee -a $log
			make clean &>> $sublog  || fail $name  "clean" 
		else
			echo "./configure $name" `date` | tee -a $log
			echo ./configure $config_opts $config_opts_extra | tee -a $log
			./configure $config_opts $config_opts_extra &>> $sublog	|| fail $name  "configure" 
		fi
 
		echo "make $name" `date` | tee -a $log
		nice make $make_opts &>> $sublog	|| fail $name  "make" 
		echo "install $name" `date` | tee -a $log
		sudo -E make install || fail $name  "install" 
		touch INSTALLDONE
		cd ..
	else
		echo "$name directory missing" | tee -a $log
		exit 1
	fi
done

#Brisk Menu is compiled differently
#This was the only App that was difficult to get compiled and running.
if [ "$base" = "true" ]; then
	if [[ -d brisk-menu ]]; then
		cd brisk-menu
		if [[ -f INSTALLDONE ]] && ! $clean;
		then
			echo "Brisk Menu already done"  | tee -a $log
		else
			echo Building Brisk Menu
			rm -rf build 2>/dev/null || true
			meson build --prefix=/usr/local --bindir=/usr/local/bin --libexecdir=/usr/local/libexec
			ninja -C build
			sudo ninja -C build install
			touch INSTALLDONE
		fi
		cd ..
	fi
fi

echo "build done" `date` | tee -a $log

