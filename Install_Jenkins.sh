#!/bin/bash

echo "#################################################################################"
echo "Updating the System"
echo "#################################################################################"
sudo apt update

echo "#################################################################################"
echo "Installing openjdk-11-jdk"
echo "#################################################################################"
sudo apt insall openjdk-11-jdk -y

echo "#################################################################################"
echo "Installing MAVEN"
echo "#################################################################################"
sudo insall maven -y

echo "#################################################################################"
echo "Installing Jenkins and Dependancies"
echo "#################################################################################"
curl -fsSL https://pkg.jenkins.io/debian- | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian- binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
