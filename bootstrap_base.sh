#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ondrej/php5

sudo apt-get update
sudo apt-get install -y vim
sudo cp /vagrant/vimrc /etc/vim/vimrc

sudo apt-get install -y php5-cli
# sudo apt-get install -y php5-xdebug
sudo apt-get install -y php5-gd
sudo apt-get install -y php5-mysql
sudo apt-get install -y php-apc
sudo apt-get install -y php5-fpm

sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password kryn'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password kryn'

sudo apt-get install -y mysql-server
sudo apt-get install -y --force-yes nginx
sudo cp nginx-default.conf /etc/nginx/sites-available/default
sudo /etc/init.d/nginx restart

sudo apt-get install -y curl