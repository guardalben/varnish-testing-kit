# varnish-testing-kit

This vagrant script helps easy-install and test varnish-cache versions over Mac OSX Sierra V.10.13.3 OS System.

Vagrant linux distribution: "debian/strech64" for [Varnish-Cache](https://varnish-cache.org/) tested versions (| 6.0 | 5.2 | 5.1 | 5.0 | 4.1 |).

# Requirements:

[Vagrant](https://www.vagrantup.com/downloads.html) and [virtual box](https://www.virtualbox.org/wiki/Downloads) both up and running.

Vagrant-sshfs plugin for host <=> guest shared folder

#vagrant plugin install vagrant-sshfs

#vagrant sshfs --mount varnish_plus_VM0 ... VM4

[Enable sftp-server on mac](https://www.itworld.com/article/2923076/private-cloud/how-to-turn-a-mac-os-x-linux-or-windows-machine-into-an-sftp-server.html)

# Examples of use:

Building all Varnish VMs (Virtual Machines) Versions (varnish_VM0 = 6.0 | varnish_VM1 = 5.2 | varnish_VM2 = 5.1 | varnish_VM3 = 5.0 | varnish_VM4 = 4.1)

#vagrant up

Updating VMs separately

#vagrant provision varnish_VM0 

SSH access to the specific VM

#vagrant ssh varnish_VM2

Destroying all or specific VMs 

#vagrant destroy -f or 

#vagrant destroy  (varnish_VM0 ... varnish_VM5)

Private network ips

varnish_VM0:192.168.1.1 

varnish_VM1:192.168.1.2 

varnish_VM2:192.168.1.3 

varnish_VM3:192.168.1.4 

varnish_VM4:192.168.1.5 
