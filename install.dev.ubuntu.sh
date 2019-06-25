#!/bin/bash

sudo apt-get update

sudo apt-get -y install --upgrade openjdk-8-jdk

sudo apt-get -y install --upgrade python python-pip python-tk
sudo apt-get -y install --upgrade python3 python3-pip python3-tk

sudo apt-get -y install --upgrade tar rar wget curl perl libswitch-perl hardinfo unzip zip unrar bc mkisofs smartmontools

sudo apt-get -y install git subversion gitg gitk git-review iptux

sudo apt-get -y install libssl-dev libxml-parser-perl m4 gparted

sudo apt-get -y install git-core gnupg flex bison gperf build-essential zlib1g-dev gcc-multilib g++-multilib 
sudo apt-get -y install libc6-dev-i386  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc  


#csv
#sudo apt-get -y install xfce4 xubuntu-desktop xrdp vnc4server 
# set windows manager and default apps

sudo apt-get -y install libncurses5-dev:i386 libx11-dev:i386 libreadline6-dev:i386  
sudo apt-get -y install tofrodos python-markdown zlib1g-dev:i386 
sudo apt-get -y install dpkg-dev libsdl1.2-dev libesd0-dev

#sudo apt-get -y install libcurl4-openssl-dev libp11-dev

sudo ln -sf /bin/bash /bin/sh

wget http://192.168.65.28/update/repo
sudo mv repo /usr/bin/repo
sudo chmod +x /usr/bin/repo

#git config --global user.email "zhaoyufeng@huaqin.com"
#git config --global user.name "101001775"
git config --global color.ui "auto"

sudo apt-get -y autoremove

#ssh-keygen

wget http://192.168.65.28/update/config
mv config ~/.ssh/config
