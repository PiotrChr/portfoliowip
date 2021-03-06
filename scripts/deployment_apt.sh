#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Includes
. "$DIR/config.sh"

# NODE & NPM
msg "Installing Node"

nodePath='/usr/bin/node'
if [ ! -d "$nodePath" ]; then
    sudo apt-get -y install nodejs
    sudo ln -s `which nodejs` "$nodePath"
fi

npmPath='/usr/bin/npm'
if [ ! -d "$npmPath" ]; then
    sudo apt-get -y install npm
    sudo ln -s `which npm` "$npmPath"
    sudo npm install npm -g
fi
