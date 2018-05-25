#!/bin/bash
set -e
source /tmp/vars.sh

# run ldconfig
ldconfig

# get and build mbot
mkdir -p $TMP_DIR/mbot
git clone https://github.com/ticklemynausea/mbot $TMP_DIR/mbot
cd $TMP_DIR/mbot
wget https://s3-eu-west-1.amazonaws.com/ticklemynausea/sources/alice.tgz
tar xfvz alice.tgz
./configure
make
cp ./mbot /usr/local/bin
cp ./mod/* /usr/local/lib
