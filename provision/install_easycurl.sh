#!/bin/bash
set -e
source /tmp/vars.sh

# update repositories and install dependencies
apt-get update
apt-get -y install git build-essential autoconf \
    automake libtool libboost-regex-dev libboost-dev \
    libcurl4-openssl-dev wget pkg-config
# get, build and install easycurl
mkdir $TMP_DIR/easycurl
git clone https://github.com/ticklemynausea/easycurl $TMP_DIR/easycurl
cd $TMP_DIR/easycurl
./autogen.sh
./configure
make
make install
