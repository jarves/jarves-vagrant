Kryn.cms Vagrant
================

This repository contains a Vagrantfile for Kryn.cms. You can use it to have a development version of Kryn.cms, to play around with it etc.

Requirements:

    - VirtualBox

Usage:

```bash
$ git clone https://github.com/kryncms/kryncms-vagrant.git
$ cd kryncms-vagrant
$ vagrant up
```

Open `http://localhost:8080/`.

The initial step "builds" a Kryn.cms with Symfony 2.5 and installs it. Target folder is `./kryncms/`.

Use `TESTING=1 vagrant up` to fire the test suite. If you use this, the target folder is `./KrynCmsBundle/` because we checkout the main repository
(if not exist already) and do not setup a functional Symfony installation. This is used in our CI build servers.

Mysql credentials are:
    user: root
    pw: kryn
    database name: symfony