#!/bin/bash
syncFolder="/srv/www/"
. $syncFolder'/setup/config.sh'

dbPath="/var/lib/mysql/$dbName"
dbDumpPath=$syncFolder$sources"db/dump.sql"

if ! [[ -d $dbPath ]] ; then
    msg "Creating $dbName Database"
    mysql -u$dbUser -p$dbPassword -e "create database $dbName"

    msg "Creating initial database structure"
    mysql -u$dbUser -p$dbPassword < $dbDumpPath
fi
