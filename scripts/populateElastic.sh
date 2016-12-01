#!/bin/sh
. /var/www/SymfonyTest/scripts/bootstrap.sh

pathToBin='/var/www/SymfonyTest/SymfonyTest/bin/'
commandQ=$(php $pathToBin'console' fos:elastica:populate)