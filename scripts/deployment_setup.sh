#!/usr/bin/env bash
syncFolder="/var/www/html/portfolio"
. $syncFolder'/scripts/config.sh'

jsVendorFolder="$syncFolder/js/vendor"

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

sh $syncFolder"/scripts/deployment_apt.sh"
sh $syncFolder"/scripts/deployment_npm_global.sh"
