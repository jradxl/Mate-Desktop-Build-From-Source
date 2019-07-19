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


