#!/bin/bash
set -e
source /tmp/vars.sh

# create mbot user
useradd -c 'mbot user' -m -d /home/mbot -s /bin/bash mbot

# create volume mountpoint
mkdir /vol
chown mbot:mbot /vol

# update repositories and install dependencies
apt-get update
apt-get -y install git build-essential autoconf \
    automake libtool libboost-regex-dev libboost-dev \
    libcurl4-openssl-dev wget pkg-config python curl \
    python-pip

# install python packages
pip install feedparser requests pylast
