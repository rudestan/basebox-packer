# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "base"
  config.vm.box_url = "./out/debian73-amd64_salt.box"

  config.vm.hostname = "deb73-amd64.dev"
  config.vm.network :private_network, ip: "10.10.1.11"
  config.vm.synced_folder "/Users/rudestan/Projects/www", "/home/srv/www", create: true

  config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.synced_folder "salt/roots/salt", "/srv/salt/"
  config.vm.synced_folder "salt/roots/pillar", "/srv/pillar/"
  
  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
  end  

end
