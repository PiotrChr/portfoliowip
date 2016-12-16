#!/usr/bin/env bash
syncFolder="/var/www/html/portfolio"
. $syncFolder'/scripts/config.sh'

# NPM
msg "Installing Node"

nodePath='/usr/bin/node'
if [ ! -d "$nodePath" ]; then
    sudo apt-get -y install nodejs
    sudo ln -s `which nodejs` "$nodePath"
    sudo npm install npm -g
fi

