#!/usr/bin/env bash

apt-get update

apt-get install -y python-software-properties
add-apt-repository -y ppa:ondrej/php5

apt-get update
apt-get install -y htop iotop vim git curl
cp /vagrant/vimrc /etc/vim/vimrc

apt-get install -y php5-cli
#apt-get install -y php5-xdebug
apt-get install -y php5-gd
apt-get install -y php5-mysql
apt-get install -y php-apc
apt-get install -y php5-fpm
cp /vagrant/php.ini /etc/php5/fpm/php.ini
cp /vagrant/php-opcache.ini /etc/php5/fpm/conf.d/05-opcache.ini
cp /vagrant/php-apc.ini /etc/php5/fpm/conf.d/20-apcu.ini
service php5-fpm restart

debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password jarves'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password jarves'

apt-get install -y mysql-server
apt-get install -y --force-yes nginx

sudo mkdir /var/www/
sudo chown vagrant /var/www/
cp nginx-default.conf /etc/nginx/sites-available/default
/etc/init.d/nginx restart
