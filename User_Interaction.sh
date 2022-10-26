#!/bin/bash

## Simple user interaction bash script ##

echo "Enter your skill: "
read YOURSKILL

echo "Your $YOURSKILL skill is in high demand in the IT Industry."

# -p mean prompt
read -p 'Username: ' USR
# The -s suppresses the password, meaning the password is not visible when typing
read -sp 'Password: ' pass

echo

echo "Login Successful: Welcome USER $USR."
