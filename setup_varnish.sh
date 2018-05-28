#!/bin/sh

version="varnish${1}"

echo *Installing a collection of network and http tools*
sudo apt-get -y install net-tools wget curl httpie

echo *Setting up and Installing Varnish*
sudo wget --output-document script.deb_$version.sh "https://packagecloud.io/install/repositories/varnishcache/$version/script.deb.sh"
sudo chmod +x script.deb_$version.sh
sudo ./script.deb_$version.sh
sudo apt-get update

#To install varnish 4.1
if [ $version = "varnish41" ]
then
   sudo apt-get -y install varnish=4.1.10-1~stretch

else
   apt-get -y install varnish
fi

echo *Installing Apache2 as backend*
sudo apt-get -y install apache2

echo *Changing default port 80 to 8080*
sudo  sed -i 's/.*Listen 80.*/Listen '8080'/' /etc/apache2/ports.conf
sudo service apache2 restart

echo *Varnish Installed Version*
varnishd -V
echo ***VARNISH UP and RUNNING***
