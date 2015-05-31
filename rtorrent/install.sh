#!/bin/bash

echo "Rtorrent installation script (xmlrpc, libtorrent 0.13.4, rtorrent 0.9.4)"
echo "USER=$USER"
echo "HOME=$HOME"
echo "MEDIAHOME=$MEDIAHOME"
echo "RTORDLDIR=$RTORDLDIR"
echo "SERVERIP=$SERVERIP"

exit

sudo apt-get update

# TODO: Consolidate these packages into the ones only needed to build rtorrent

sudo apt-get install -y git-core subversion build-essential automake libtool libcppunit-dev libcurl4-openssl-dev libsigc++-2.0-dev libncurses5-dev zip rar unrar apache2 apache2-utils php5 php5-curl php5-geoip python-cheetah mediainfo libav-tools

# Build and install xmlrpc from svn

# svn checkout http://svn.code.sf.net/p/xmlrpc-c/code/advanced xmlrpc-c
tar -xzf xmlrpc.tar.gz
cd xmlrpc-c
./configure
make
sudo make install
cd ..

# Build and install libtorent

# sudo git clone https://github.com/rakshasa/libtorrent.git
tar -xzf libtorrent-0.13.4.tar.gz
cd libtorrent-0.13.4
./autogen.sh
./configure
make
sudo make install
cd ..

# Build and install rtorrent

# sudo git clone https://github.com/rakshasa/rtorrent.git
tar -xzf rtorrent-0.9.4.tar.gz
cd rtorrent-0.9.4
./autogen.sh
./configure --with-xmlrpc-c
make
sudo make install
sudo ldconfig
cd ..

mkdir -p $HOME/{.session,watch,downloads,Media}

cp ./rtorrent.rc $HOME/.rtorrent.rc

sudo chown -R $USER:$USER $HOME
chmod 755 $HOME/{.session,watch,downloads,.rtorrent.rc}


