#!/usr/bin/env bash

cd /vagrant

if [ ! -f v2.4.1.tar.gz ]
then
    wget --no-check-certificate https://github.com/symfony/symfony-standard/archive/v2.4.1.tar.gz
fi

tar xf v2.4.1.tar.gz
sudo rm -rf /var/www/jarvescms
mv symfony-standard-* /var/www/jarvescms
rm v2.4.1.tar.gz
cd /var/www/jarvescms
rm -r /var/www/jarvescms/src
ln -s /vagrant/src /var/www/jarvescms/src
echo 'create database symfony; ' | mysql -uroot -pjarves

cp /vagrant/meta/build.composer.json composer.json
cp /vagrant/meta/build.composer.lock composer.lock
cp /vagrant/meta/build.parameters.yml app/config/parameters.yml
cp /vagrant/meta/build.routing_dev.yml app/config/routing_dev.yml
cp /vagrant/meta/build.routing.yml app/config/routing.yml
cp /vagrant/meta/config.jarves.xml app/config/config.jarves.xml
cp /vagrant/meta/build.appkernel.php.txt app/AppKernel.php

sudo rm -r /tmp/symfony-jarves
mkdir /tmp/symfony-jarves
mkdir /tmp/symfony-jarves/cache
mkdir /tmp/symfony-jarves/logs

sudo chown -R www-data /tmp/symfony-jarves

/vagrant/composer.phar install --prefer-dist
/vagrant/composer.phar dump-autoload --optimize

sudo chown -R www-data:www-data .

sudo chown -R www-data:www-data /tmp/symfony-jarves
sudo chmod -R g+w /tmp/symfony-jarves

echo "Environment set. See README.md to see what you have to do now."
