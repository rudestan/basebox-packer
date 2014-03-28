# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

#Local sync pathes with sources for Python and PHP virtual machines
PY_SOURCES_SYNC_PATH = "/var/www"
PHP_SOURCE_SYNC_PATH = "/var/www"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "py" do |py|

    py.vm.box = "python-base"
    py.vm.box_url = "./out/debian7-amd64.box"

    py.vm.hostname = "py-deb7-amd64.dev"
    py.vm.network :private_network, ip: "10.10.1.11"
    py.vm.synced_folder PY_SOURCES_SYNC_PATH, "/home/srv/www", create: true, owner: "vagrant", group: "www-data", create: true, mount_options: ["dmode=775,fmode=664"]

    py.vm.provider :virtualbox do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    py.vm.synced_folder "salt/roots/python", "/srv/salt/"
    
    py.vm.provision :salt do |salt|
      salt.minion_config = "salt/minion"
      salt.run_highstate = true
    end 
  end 

  config.vm.define "php" do |php|

    php.vm.box = "php-base"
    php.vm.box_url = "./out/debian7-amd64.box"

    php.vm.hostname = "php-deb7-amd64.dev"
    php.vm.network :private_network, ip: "10.10.1.12"
    php.vm.synced_folder PHP_SOURCE_SYNC_PATH, "/usr/local/www", create: true, owner: "vagrant", group: "www-data", create: true, mount_options: ["dmode=775,fmode=664"]

    php.vm.provider :virtualbox do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    php.vm.synced_folder "salt/roots/php", "/srv/salt/"
    
    php.vm.provision :salt do |salt|
      salt.minion_config = "salt/minion"
      salt.run_highstate = true
    end 
  end   

end
