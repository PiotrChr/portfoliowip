#!/usr/bin/env bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

# Includes
. "$DIR/config.sh"

JSVENDORFOLDER="$DIR/../js/vendor"

function clone {
    NAME=$1
    DIR=$2
    REPO=$3

    msg "Cloning $NAME library"

    if [ ! -d "$DIR" ]; then
        mkdir "$DIR"
        msg "$DIR created"

        cd "$DIR" && git clone "$REPO" .
        msg "$NAME cloned"
    else
        warn "$DIR directory already exists"
    fi

}


# DEPLOYMENT
clone "HexList" "$JSVENDORFOLDER/hexList" "git@bitbucket.org:PiotrChr/hexlist.git"
clone "ShootingStar" "$JSVENDORFOLDER/shootingStar" "git@github.com:manufosela/shootingstar.git"
clone "TwinkleStar" "$JSVENDORFOLDER/twinkleStar" "git@bitbucket.org:PiotrChr/twinkleStar.git"

. "$DIR/deployment_apt.sh"
. "$DIR/deployment_npm_global.sh"
