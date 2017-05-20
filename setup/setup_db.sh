#!/bin/bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

# Includes
. "$DIR/config.sh"

msg "Sync folder set to: "$syncFolder

dbPath="/var/lib/mysql/$dbName"
dbDumpPath=$syncFolder$sources"db/dump.sql"

if sudo bash -c "! [[ -d $dbPath ]]"; then
    msg "Creating $dbName Database"
    mysql -u$dbUser -p$dbPassword -e "create database $dbName"

#    TODO: Add structure verification separately
    msg "Creating initial database structure"
    mysql -u$dbUser -p$dbPassword $dbName < $dbDumpPath
else
    warn "Databse $dbName already exists."
fi
