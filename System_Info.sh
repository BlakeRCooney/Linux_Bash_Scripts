#! bin/bash

# Use :se nu to display the line numbers in vim editor

### This script prints the system info ###

echo “Welcome to bash scripting.”
echo

# Checking the systems up-time
echo “########################”
echo “The up time of the system is: “
uptime
echo

# Memory utilization
echo “########################”
echo “Memory utilization: “
free -m
echo

# Disk utilization
echo “########################”
echo “Disk utilization: “
df -h
