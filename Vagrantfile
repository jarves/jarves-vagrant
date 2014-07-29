# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "jarvescms-base"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.synced_folder ".", "/vagrant", :owner=> 'vagrant', :group=>'www-data', :mount_options => ['dmode=775', 'fmode=775']

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "2", "--ioapic", "on"]
  end

  bootstrap_file = "bootstrap.sh"

  if ENV['TESTING']
    bootstrap_file = "bootstrap_testing.sh"
  end

  print "Use 'TESTING=1 vagrant up' to setup the testing suite only. \n"

  config.vm.provision :shell, :path => bootstrap_file

end
