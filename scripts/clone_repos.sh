#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Includes
. "$DIR/deployment_setup.sh"

JSVENDORFOLDER="$DIR/../js/vendor"

# DEPLOYMENT
clone "TwinkleStars" "$JSVENDORFOLDER/twinkleStars" "git@github.com:PiotrChr/twinkleStars.git"
clone "HexList" "$JSVENDORFOLDER/hexList" "git@bitbucket.org:PiotrChr/hexlist.git"
clone "ShootingStar" "$JSVENDORFOLDER/shootingStar" "git@github.com:PiotrChr/shootingstar.git"
clone "Malihu custom scrollbar plugin" "$JSVENDORFOLDER/malihu-custom-scrollbar-plugin-master" "git@github.com:malihu/malihu-custom-scrollbar-plugin.git"