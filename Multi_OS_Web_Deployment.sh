#!/bin/bash

USR='devops'

for host in `cat remote_hosts`
do
   echo "#####################################################################"
   echo "Connecting to $host"
   echo "Pushing Script to $host"
   scp multiOS_website.sh $USR@$host:/tmp/
   echo "Executing Script on $host"
   ssh $USR@$host sudo /tmp/multiOS_website.sh
   ssh $USR@$host sudo rm -rf /tmp/multiOS_website.sh
   echo "#####################################################################"
   echo
done
