#!/bin/bash 

#Docker-compose requires docker host.

#install python-pip
sudo apt-get -y install python-pip

#install docker-compose
sudo pip install docker-compose

#check  if it is installed successfully
docker-compose -v

