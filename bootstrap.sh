#!/usr/bin/env bash

cd /vagrant/

. bootstrap_base.sh

curl -sS https://getcomposer.org/installer | php

if [ ! -f /vagrant/kryncms ]
then

    wget --no-check-certificate https://github.com/symfony/symfony-standard/archive/v2.4.1.tar.gz
    tar xf v2.4.1.tar.gz

    mv symfony-standard-* kryncms
    cd kryncms

    echo 'create database symfony; ' | mysql -uroot -pkryn

    cp ../meta/build.composer.json composer.json
    cp ../meta/build.parameters.yml app/config/parameters.yml
    cp ../meta/build.routing_dev.yml app/config/routing_dev.yml
    cp ../meta/build.appkernel.php.txt app/AppKernel.php

    ../composer.phar update --prefer-dist --no-dev

    chown -R www-data:www-data .

    app/console kryncms:models:build
    app/console kryncms:schema:update
    app/console kryncms:install:demo localhost /
fi