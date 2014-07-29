Jarves.cms Vagrant
================

This repository contains a Vagrantfile for Jarves.cms. You can use it to have a development version of Jarves.cms, to play around with it etc.

Requirements:

    - VirtualBox

Usage:

```bash
$ git clone https://github.com/jarvescms/jarvescms-vagrant.git
$ cd jarvescms-vagrant
$ vagrant up
$ git clone https://github.com/jarves/jarves.git src/Jarves
$ git clone https://github.com/jarves/jarves-publication.git src/Jarves/Publication
$ git clone https://github.com/jarves/jarves-demotheme.git src/Jarves/DemoTheme

$ vagrant ssh

# you're inside of the vm now
$ cd /var/www/jarvescms
$ sudo chown -R www-data:www-data .
$ sudo chmod -R g+w .

# setup demo-data (required)
$ sudo su www-data --command='/var/www/jarvescms/app/console jarves:models:build -vv'
$ sudo su www-data --command='/var/www/jarvescms/app/console jarves:install:demo localhost / -vv'
```

Open `http://localhost:8080/`.

The initial step "builds" a Jarves.cms with Symfony 2.4 and installs it. Target folder is `/vagrant/jarvescms/`.

<s>Use `TESTING=1 vagrant up` to fire the test suite. If you use this, the target folder is `./JarvesCmsBundle/` because we checkout the main repository
(if not exist already) and do not setup a functional Symfony installation. This is used in our CI build servers.</s>

MySQL credentials are:

```
    user: root
    pw: jarves
    database name: symfony
```