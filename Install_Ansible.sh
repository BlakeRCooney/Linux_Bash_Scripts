#!/bin/bash

echo “#######################################################”
echo “Updating the System”
echo “#######################################################”
sudo apt update

echo “#######################################################”
echo “Installing Software Properties Common”
echo “#######################################################”
sudo apt install software-properties-common -y

echo “#######################################################”
echo “Adding the Ansible Repository”
echo “#######################################################”
sudo apt-add-repository -- yes -- update ppa:ansible/ansible

echo “#######################################################”
echo “Installing Ansible”
echo “#######################################################”
sudo apt install ansible -y
