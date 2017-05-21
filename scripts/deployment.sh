#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Includes
. "$DIR/deployment_setup.sh"

. "$DIR/clone_repos.sh"
. "$DIR/deployment_apt.sh"
. "$DIR/deployment_npm_global.sh"
