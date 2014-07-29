#!/usr/bin/env bash

cd /vagrant/

. bootstrap_base.sh

curl -sS https://getcomposer.org/installer | php

if [ ! -f /vagrant/jarvescms ]
then

    git clone https://github.com/jarvescms/jarvescms.git

    cd jarvescms

    echo 'create database symfony; ' | mysql -uroot -pjarves

    ../composer.phar update --prefer-dist

    chown -R www-data:www-data .

    Tests/Integration/skeletion/app/console jarves:models:build
    Tests/Integration/skeletion/app/console jarves:install:demo localhost /
fi