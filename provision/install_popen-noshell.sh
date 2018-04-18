#!/bin/bash
set -e
source /tmp/vars.sh

# get, build and install popen-noshell
mkdir $TMP_DIR/popen-noshell
git clone https://github.com/ticklemynausea/popen-noshell $TMP_DIR/popen-noshell
cd $TMP_DIR/popen-noshell
./autogen.sh
./configure
make
make install
