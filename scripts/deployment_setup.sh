#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Includes
. "$DIR/config.sh"

function clone {
    NAME=$1
    REPODIR=$2
    REPO=$3

    msg "Cloning $NAME library"

    if [ ! -d "$REPODIR" ]; then
        mkdir "$REPODIR"
        msg "$REPODIR created"

        cd "$REPODIR" && git clone "$REPO" . && cd "$DIR"
        msg "$NAME cloned"
    else
        warn "$REPODIR directory already exists"
    fi

}
