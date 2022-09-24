#!/bin/bash

echo ""
echo "Neoxa Pool Restarting..."
echo ""

source ~/.bashrc
source /etc/os-release

## who am i? ##
SCRIPTNAME="$(readlink -f ${BASH_SOURCE[0]})"
BASEDIR="$(dirname $SCRIPTNAME)"

## Okay, print it ##
echo "Script name : $SCRIPTNAME"
echo "Current working dir : $PWD"
echo "Script location path (dir) : $BASEDIR"
echo ""

~/.nvm/versions/node/v12.13.0//bin/pm2 restart pool

sudo renice -n -18 -p $(pidof node)
sudo renice -n -18 -p $(pidof nodejs)

echo ""
echo "Neoxa Pool Restarted!"
echo ""

exit 0
