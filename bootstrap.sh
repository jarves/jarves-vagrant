#!/usr/bin/env bash

cd /vagrant/

echo "~~~~ EXECUTING BOOTSTRAP_BASE.SH ~~~~"

./bootstrap_base.sh

echo "~~~~ INSTALLING COMPOSER ~~~~"
curl -sS https://getcomposer.org/installer | php


if [ ! -d /vagrant/src/Jarves ]
then
	echo "~~~~ EXECUTING BOOTSTRAP_JARVES.SH ~~~~"
    ./bootstrap_jarves.sh
fi
