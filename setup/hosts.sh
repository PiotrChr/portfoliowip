#!/usr/bin/env bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

# Includes
. "$DIR/config.sh"

vagrantboxIp='10.1.1.34'
localDomain='portfolio'

if ! grep -q $vagrantboxIp /etc/hosts ; then
    sudo bash -c "echo '$vagrantboxIp $localDomain' >> /etc/hosts"
    msg "New local domain 'portfolio' has beed added."
else
    warn "Vagrant entry already in etc/hosts. Please check if uncommented."
fi
