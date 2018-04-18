#!/bin/bash

TMP_DIR=/tmp
MBOT_HOME=/home/mbot
MBOT_DIR=$MBOT_HOME/mbot
MBOT_SHELL_DIR=$MBOT_HOME/mbot-shell

# create mbot user
useradd -c 'mbot user' -m -d /home/mbot -s /bin/bash mbot

# update repositories and install dependencies
apt-get update
apt-get -y install git build-essential autoconf \
    automake libtool libboost-regex-dev libboost-dev \
    libcurl4-openssl-dev

# get, build and install popen-noshell
mkdir $TMP_DIR/popen-noshell
git clone https://github.com/ticklemynausea/popen-noshell $TMP_DIR/popen-noshell
cd $TMP_DIR/popen-noshell
./autogen.sh
./configure
make
make install

# get, build and install easycurl
mkdir $TMP_DIR/easycurl
git clone https://github.com/ticklemynausea/easycurl $TMP_DIR/easycurl
cd $TMP_DIR/easycurl
./autogen.sh
./configure
make
make install

# run ldconfig
ldconfig

# get and build mbot
mkdir -p $MBOT_DIR
git clone https://github.com/ticklemynausea/mbot $MBOT_DIR
cd $MBOT_DIR
./configure
make

# get latest mbot shell scripts
mkdir -p $MBOT_SHELL_DIR
git clone https://github.com/ticklemynausea/mbot-shell $MBOT_SHELL_DIR

# return to home
cd

# move config to mbot folder
mv $TMP_DIR/mbot-config/* /home/mbot/mbot

# change ownership of all created files to mbot user
chown -R mbot:mbot /home/mbot

# remove temporary stuff
rm -rf $TMP_DIR/*

# yay
echo "+-------------------------+"
echo "| provisioning completed! |"
echo "+-------------------------+"