#!/usr/bin/env bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

# Includes
. "$DIR/config.sh"

jsVendorFolder="$DIR/../js/vendor"

# Download hexList library
hexListDir=$jsVendorFolder"/hexList"
hexListGitUrl="git@bitbucket.org:PiotrChr/hexlist.git"

msg "Cloning HexList library"
if [ ! -d "$hexListDir" ]; then
    mkdir "$hexListDir"
    cd "$hexListDir" && git clone "$hexListGitUrl" .
else
    warn "hexList directory already exists"
fi

. "$DIR/deployment_apt.sh"
. "$DIR/deployment_npm_global.sh"
