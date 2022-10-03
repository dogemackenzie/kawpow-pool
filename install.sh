#!/bin/sh

# This is the Pool install script.
echo "Pool install script."

echo "$(tput setaf 1)$(tput setab 7)Installing... Please wait, have a pancake and a smoke! Its going to take a while!$(tput sgr 0)"

sleep 3

rm -rf /usr/lib/node_modules
rm -rf node_modules
apt remove --purge -y nodejs node
rm /etc/apt/sources.list.d/*
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt install -y apt-transport-https software-properties-common build-essential autoconf pkg-config make gcc g++ screen wget curl ntp fail2ban 

sudo apt update
sudo apt install -y libdb4.8-dev libdb4.8++-dev libssl-dev libboost-all-dev libminiupnpc-dev libtool autotools-dev redis-server
sudo apt install -y sudo git npm nodejs  

service fail2ban start
service fail2ban enable
service redis-server start
service redis-server enable
service ntp start
service ntp enable

echo "$(tput setaf 1)$(tput setab 7)Still Installing...5 more minutes Turkish!$(tput sgr 0)"

rm -rf ~/.nvm
rm -rf ~/.npm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
chown -R $USER:$GROUP ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install v12.13.0
nvm use v12.13.0
npm update -g

npm install -g webpack@4.46.0
npm install -g pm2@4.5.6

npm install
npm update
npm audit fix
npm install sha3
npm install logger

echo "$(tput setaf 0)$(tput setab 7)Installation completed Ya Bastard!! Must construct additional Pylons!$(tput sgr 0)"

exit 0
