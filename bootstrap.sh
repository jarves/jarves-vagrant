#!/usr/bin/env bash

cd /vagrant/

./bootstrap_base.sh

curl -sS https://getcomposer.org/installer | php

if [ ! -d /vagrant/kryncms ]
then

    if [ ! -f v2.4.1.tar.gz ]
    then
        wget --no-check-certificate https://github.com/symfony/symfony-standard/archive/v2.4.1.tar.gz
        tar xf v2.4.1.tar.gz
    fi

    mv symfony-standard-* kryncms
    cd kryncms
    echo 'create database symfony; ' | mysql -uroot -pkryn

    cp ../meta/build.composer.json composer.json
    cp ../meta/build.parameters.yml app/config/parameters.yml
    cp ../meta/build.routing_dev.yml app/config/routing_dev.yml
    cp ../meta/build.routing.yml app/config/routing.yml
    cp ../meta/config.kryn.xml app/config/config.kryn.xml
    cp ../meta/build.appkernel.php.txt app/AppKernel.php

    mkdir /tmp/symfony-kryn
    mkdir /tmp/symfony-kryn/cache
    mkdir /tmp/symfony-kryn/logs

    chown -R www-data /tmp/symfony-kryn

    ../composer.phar update --prefer-dist

    chown -R www-data:www-data .

    app/console kryncms:models:build
    app/console kryncms:install:demo localhost /

    chown -R www-data:www-data /tmp/symfony-kryn
    chmod -R g+w /tmp/symfony-kryn
fi