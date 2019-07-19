# Mate-Desktop Build From Source
Notes and scripts to build Mate Desktop 1.22 from sources

Perhaps like many, I was disappointed that Mate-Desktop 1.22 didn't make it to Ubuntu 19.04 Disco.
I thought I would try building the source, but was surprised how out of date the build info was.
In trying, I thought I'd gave big problems, but in fact using the old info and that provided by the Arch Wiki,
it was possible to achieve a working Mate Desktop.
I endeavoured to only add those packages that the AutoGen script complained about, as I didn't want to
blankit install lots of stuff and Mate Desktop is GTK3 now anyway.
This repository details I what I did, and allows me to repeat on other Ubuntu installations.

This is work in progress...

1. Install Xubuntu 19.04 into VirtualBox, and configure how you want.
By using Xubuntu, I was sure that had a working Xorg and Lightdm.
I add the GuestAdditions of course, and the Terminator terminal
apt update
apt upgrade
apt install build-essential
apt install terminator.

2. Clone this repository to access some helpful scripts

3. Run apt-install.sh
This will install all dependency packages I found necessary

4. Run clone-mate-from-git.sh
This will clone the 1.22 version of Mate Desktop, plus Mate Tweak, Mate University and Brisk Menu

5. Optional - review arch-build-args.txt
This will show the ./configure args and dependencies that the kind maintainer uses for Arch
(You could of course install Manjaro Linux and the Mate respositories, and not bother with my humble efforts)

6. Optional - cd into a application's directorty and run build-mate-single.sh
This is a script to edit for your own individual build requirements.
I used it initially to work out what to do!

7. Run build-base.sh
Hopefully, this will run to completion and build all applications into /usr/local

8. Create SymLink 
ln -s /usr/local/share/xsessions/mate.desktop /usr/share/xsessions
This will make Mate Desktop available to select from the Lightdm login page.

9. Reboot, select MATE and it might work!

10. Run update-clones.py
This will update the clones if changes have been made
This happens quite frequently!!
I've not yet modified build-base.sh to detect any updates. You'll have to do it manually, or use clean argument, which will
recompile all.

//END




