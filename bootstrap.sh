#!/usr/bin/env bash

cd /vagrant/

./bootstrap_base.sh

curl -sS https://getcomposer.org/installer | php

if [ ! -d /vagrant/jarvescms ]
then

    if [ ! -f v2.4.1.tar.gz ]
    then
        wget --no-check-certificate https://github.com/symfony/symfony-standard/archive/v2.4.1.tar.gz
    fi

    tar xf v2.4.1.tar.gz
    mv symfony-standard-* jarvescms
    cd jarvescms
    echo 'create database symfony; ' | mysql -uroot -pjarves

    # cp ../meta/build.composer.json composer.json
    cp ../meta/build.parameters.yml app/config/parameters.yml
    cp ../meta/build.routing_dev.yml app/config/routing_dev.yml
    cp ../meta/build.routing.yml app/config/routing.yml
    cp ../meta/config.jarves.xml app/config/config.jarves.xml
    cp ../meta/build.appkernel.php.txt app/AppKernel.php

    mkdir /tmp/symfony-jarves
    mkdir /tmp/symfony-jarves/cache
    mkdir /tmp/symfony-jarves/logs

    chown -R www-data /tmp/symfony-jarves

    ../composer.phar update --prefer-dist

    chown -R www-data:www-data .

    app/console jarvescms:models:build
    app/console jarvescms:install:demo localhost /

    git clone https://github.com/jarves/jarves.git /src/Jarves
    git clone https://github.com/jarves/jarves-publication.git /src/Jarves/Publication
    git clone https://github.com/jarves/jarves-demotheme.git /src/Jarves/DemoTheme

    chown -R www-data:www-data .

    chown -R www-data:www-data /tmp/symfony-jarves
    chmod -R g+w /tmp/symfony-jarves
fi
