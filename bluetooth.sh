#!/bin/bash

# Author: Blake Cooney
# Date Created: 09/12/2022
# Last Modified: 10/17/2022

# Discription
# Use this script to allow bluetooth to work on your Linux System

# Usage
# bash bluetooth.sh

sudo modprob -r btusb
sudo modprob btusb
sudo reboot

