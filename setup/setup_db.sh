#!/bin/bash

isLocal=true
if [ "$1" == "local" ]; then
    syncFolder="/srv/www/"
else
    syncFolder="/var/www/html/portfolio/"
fi


syncFolder="/srv/www/"
. $syncFolder'/setup/config.sh'

dbPath="/var/lib/mysql/$dbName"
dbDumpPath=$syncFolder$sources"db/dump.sql"

if sudo bash -c "! [[ -d $dbPath ]]"; then
    msg "Creating $dbName Database"
    mysql -u$dbUser -p$dbPassword -e "create database $dbName"

#    TODO: Add structure verification separately
    msg "Creating initial database structure"
    mysql -u$dbUser -p$dbPassword $dbName < $dbDumpPath
fi
