#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Includes
. "$DIR/deployment_setup.sh"

JSVENDORFOLDER="$DIR/../js/vendor"

# DEPLOYMENT
clone "TwinkleStars" "$JSVENDORFOLDER/twinkleStars" "git@github.com:PiotrChr/twinkleStars.git"
clone "HexList" "$JSVENDORFOLDER/hexList" "git@bitbucket.org:PiotrChr/hexlist.git"
clone "ShootingStar" "$JSVENDORFOLDER/shootingStar" "git@github.com:manufosela/shootingstar.git"
