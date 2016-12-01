#!/bin/bash

mysqlPassword="asd"
phpVer="php7.0"
sources="setup/sources/"
syncFolder="/srv/www/"


sudo apt-add-repository -y ppa:ondrej/php
sudo apt-add-repository -y ppa:webupd8team/java
sudo apt-get -y update

sudo apt-get -y install apache2 
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password '$mysqlPassword
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password '$mysqlPassword



# PHP & APACHE
sudo apt-get -y install mysql-server
sudo apt-get -y install ${phpVer}
sudo apt-get -y install libapache2-mod-${phpVer}
sudo apt-get -y install ${phpVer}-mysql
sudo apt-get -y install php-gettext
sudo apt-get -y install ${phpVer}-mbstring
sudo apt-get -y install ${phpVer}-xsl
sudo apt-get -y install ${phpVer}-xmlrpc
sudo apt-get -y install ${phpVer}-tidy
# sudo apt-get -y install ${phpVer}-sqlite3
sudo apt-get -y install ${phpVer}-recode
sudo sudo apt-get -y install ${phpVer}-pspell
sudo apt-get -y install php-memcache
sudo apt-get -y install ${phpVer}-mcrypt
sudo apt-get -y install ${phpVer}-imap
sudo apt-get -y install php-imagick
sudo php5enmod imagick
sudo apt-get -y install php-pear
sudo apt-get -y install ${phpVer}-intl
sudo apt-get -y install ${phpVer}-gd
sudo apt-get -y install ${phpVer}-curl
sudo apt-get -y install php-apcu
sudo service apache2 restart

#Java
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer

# NPM
# sudo apt-get -y install nodejs
# sudo ln -s `which nodejs` /usr/bin/node

