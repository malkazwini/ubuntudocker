#!/bin/sh

sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
apt-cache policy docker-engine
sleep 5
sudo apt-get install -y docker-engine
echo "####### Removing sudo requirement to run Docker ##################" 
sudo usermod -aG docker $(whoami)
#Pull portainer and bind mount to Docker socket to manage local Docker engine
echo "Installing Portainer"
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
echo "Rebooting"
sudo reboot
