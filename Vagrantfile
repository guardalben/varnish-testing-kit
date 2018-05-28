# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

#Varnish-Cache Versions: order => | 6.0 | 5.2 | 5.1 | 5.0 | 4.1 |

#VM features
#CPUs and Memory settings across all VMs
#VERSIONS (VER 0 .. 4)
#VM iter indexes (0 ... 4)

#Tested versions (MAX 5)
VERSIONS=5 

vm_features = [{
       :box => "debian/contrib-stretch64",
       :cpus => 1,
       :mem => 1024,
       :VM0 => "60",
       :VM1 => "52",
       :VM2 => "51",
       :VM3 => "50",
       :VM4 => "41"
}]

#Iterate between Varnish Machines
#Set features for all VMs (cpus|memory|...)
#Create independent VM boxes
#Make VMs provision             
#Common share folders mapped for all VMs

Vagrant.configure("2") do |config| 

  (0...VERSIONS).each do |ver_idx| vid = (ver_idx)
    config.vm.define "varnish_VM#{vid}" do |machine|
      machine.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"
      machine.vm.synced_folder "/Users/tests", "/home/vagrand/tests", type: "sshfs"

      machine.vm.network :forwarded_port, guest: 80, host: 80, auto_correct: true
      machine.vm.network :private_network, ip: "192.168.1.#{vid+1}"

      vm_features.each do |features|
         machine.vm.box = features[:box]
         machine.vm.provider "virtualbox" do |set|
              set.memory=features[:mem]
              set.cpus=features[:cpus]
         end #provider

         if #{vid} == VERSIONS
           machine.vm.provision "shell" do |s|
               s.path = "setup_varnish.sh"
               s.args = features[:"VM#{vid}"]
           end #provision

         end #VERSIONS
      end #features
    end #define
  end #.each 
end #config
