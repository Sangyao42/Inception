#!/bin/sh

#Create the docker group.
sudo groupadd docker

#Add your user to the docker group.
sudo usermod -aG docker sawang

#restart the VM

#Verify that you can run docker commands without sudo.
#docker run hello-world