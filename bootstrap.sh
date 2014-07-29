#!/usr/bin/env bash

cd /vagrant/

./bootstrap_base.sh

curl -sS https://getcomposer.org/installer | php

if [ ! -d /vagrant/src/Jarves ]
then
    ./bootstrap_jarves.sh
fi
