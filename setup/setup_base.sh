#!/bin/bash
syncFolder="/srv/www/"
. $syncFolder'/setup/config.sh'

sudo export DEBIAN_FRONTEND=noninteractive
ppa1="ppa:ondrej/php"
ppa2="ppa:webupd8team/java"

msg "Adding Repositories"

if ! grep -q "$ppa1" /etc/apt/sources.list /etc/apt/sources.list.d/* ; then
	msg "Adding repository:"${ppa1}
    sudo apt-add-repository -y ${ppa1}
    sudo apt-get -y update
fi
if ! grep -q "$ppa2" /etc/apt/sources.list /etc/apt/sources.list.d/* ; then
	msg "Adding repository:"${ppa2}
    sudo apt-add-repository -y ${ppa2}
    sudo apt-get -y update
fi

sudo apt-get -y install apache2 
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password '$mysqlPassword
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password '$mysqlPassword

# PHP & APACHE
msg "Installing PHP and Apache2"
sudo apt-get -y install mysql-server
sudo apt-get -y install ${phpVer}
sudo apt install php libapache2-mod-php7.0
#sudo apt-get -y install libapache2-mod-${phpVer}
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
sudo phpenmod imagick
sudo apt-get -y install php-pear
sudo apt-get -y install ${phpVer}-intl
sudo apt-get -y install ${phpVer}-gd
sudo apt-get -y install ${phpVer}-curl
sudo apt-get -y install php-apcu
sudo a2enmod rewrite
sudo a2enmod php7.0
sudo service apache2 restart
sudo apt-get -y install zip unzip

#Apache virtual host
msg "Configuring Apache"
sudo cp -rf $syncFolder$sources"apache/000-default.conf" /etc/apache2/sites-available/000-default.conf
sudo cp -rf $syncFolder$sources"apache/apache2.conf" /etc/apache2/apache2.conf
sudo cp -rf $syncFolder$sources"apache/envvars" /etc/apache2/envvars


#Symfony Permissions
msg "Fixing Permissions"
sudo chmod -R 777 $syncFolder

#Composer
msg "Installing Composer"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

#Java
# msg "Installing Java"
# echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
# sudo apt-get -y install oracle-java8-installer

#TMP Folder
msg "Checking for tmp folder"
if [ ! -d "$tmp" ]; then
	msg "Creating tmp folder"
	mkdir $tmp
fi

# NPM
msg "Installing Node"

nodePath='/usr/bin/node'
sudo apt-get -y install nodejs
if [ ! -d "$nodePath" ]; then
    sudo ln -s `which nodejs` "$nodePath"
fi

msg "Finished!"
