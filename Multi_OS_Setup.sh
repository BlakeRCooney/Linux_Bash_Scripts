#! /bin/bash

### Creation of a website script ###

# Variable Declaration
#PACKAGE="httpd wget unzip"
#SVC="httpd"
URL=" https://www.tooplate.com/zip-"
ART_NAME="2123_simply_amazed"
TEMPDIR="/tmp/webfiles"

yum --help $> /dev/null

if [ $? -eq 0 ]
then
   # Set Variables for CentOS
   PACKAGE="httpd wget unzip"
   SVC="httpd"
   echo "Running setup on CentOS"
   # Installing Dependencies
   echo "###############################################################################"
   echo "Installing Packages"
   echo "###############################################################################"
   sudo yum install $PACKAGE -y > /dev/null

   # Start and Enable Service
   echo "###############################################################################"
   echo "Start and Enable HTTPD Service"
   echo "###############################################################################"
   sudo systemctl start $SVc
   sudo systemctl enable $SVc

   # Creating a directory in the tmp folder and going into that directory
   mkdir -p $TEMPDIR
   cd $TEMPDIR

   # Installing the artifact/template from tooplate.com
   wget $URL > /dev/null
   # Unzipping the file
   unzip $ART_NAME.zip > /dev/null
   # Copy the file from the zip file to the html directory
   sudo cp -r $ART_NAME/* /var/www/html/

   # Bounce Service
   echo "###############################################################################"
   echo "Restarting HTTPD Service"
   echo "###############################################################################"
   systemctl restart $SVC

   # Clean up after this script finishes, removing the tmp files after they are unziped and sent to the html directory
   echo "###############################################################################"
   echo "Removing Temporary Files"
   echo "###############################################################################"
   rm -rf $TEMPDIR

   # Printing the Status of the service
   sudo systemctl status $SVC

   ls /var/www/html/

else
   # Set Variables for Ubuntu-OS
   PACKAGE="apache2 wget unzip"
   SVC="apache2"

   echo "Running setup on Ubuntu"
   # Installing Dependencies
   echo "###############################################################################"
   echo "Installing Packages"
   echo "###############################################################################"
   sudo apt update
   sudo apt install $PACKAGE -y > /dev/null

   # Start and Enable Service
   echo "###############################################################################"
   echo "Start and Enable HTTPD Service"
   echo "###############################################################################"
   sudo systemctl start $SVc
   sudo systemctl enable $SVc

   # Creating a Temporary directory
   echo "###############################################################################"
   echo "Starting Artifact Deployment"
   echo "###############################################################################"
   mkdir -p $TEMPDIR
   cd $TEMPDIR

   # Installing the artifact/template from tooplate.com
   wget $URL > /dev/null
   # Unzipping the file
   unzip $ART_NAME.zip > /dev/null
   # Copy the file from the zip file to the html directory
   sudo cp -r $ART_NAME/* /var/www/html/

   # Bounce Service
   echo "###############################################################################"
   echo "Restarting HTTPD Service"
   echo "###############################################################################"
   systemctl restart $SVC

   # Clean up after this script finishes, removing the tmp files after they are unziped and sent to the html directory
   echo "###############################################################################"
   echo "Removing Temporary Files"
   echo "###############################################################################"
   rm -rf $TEMPDIR

   # Printing the Status of the service
   sudo systemctl status $SVC

   ls /var/www/html
fi
