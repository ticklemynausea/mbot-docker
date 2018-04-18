#!/bin/bash
set -e
source /tmp/vars.sh

# get latest mbot shell scripts
mkdir -p $MBOT_SHELL_DIR
git clone --recurse-submodules https://github.com/ticklemynausea/mbot-shell $MBOT_SHELL_DIR
