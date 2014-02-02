#!/usr/bin/env bash

cd /vagrant/

. bootstrap_base.sh

curl -sS https://getcomposer.org/installer | php

if [ ! -f /vagrant/KrynCmsBundle ]
then

    git clone https://github.com/kryncms/KrynCmsBundle.git

    cd KrynCmsBundle

    echo 'create database symfony; ' | mysql -uroot -pkryn

    ../composer.phar update --prefer-dist

    chown -R www-data:www-data .

    Tests/Integration/skeletion/app/console kryncms:models:build
    Tests/Integration/skeletion/app/console kryncms:install:demo localhost /
fi