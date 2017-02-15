# -*- mode: ruby -*-
# vi: set ft=ruby :
# Autor: Daniel Aguado Araujo

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  
  config.ssh.insert_key=false
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.network "public_network", bridge: "enp3s0f1"
  config.vm.provision "shell", path: "setup.sh"

  config.vm.define "k8s-master" do |management|
    management.vm.hostname = "k8s-management"
 end

  config.vm.define "k8s-m1" do |m1|
    m1.vm.hostname = "k8s-m1"
  end

#  config.vm.define "k8s-m2" do |management|
#    management.vm.hostname = "k8s-m2"
#  end
end
