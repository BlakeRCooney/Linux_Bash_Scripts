Creation of a website script with Variables and Command line arguments
## When entering the name of this script websetup.sh (or whatever you would like to name it, when entering in the command line you will need to add the URL after the command and the Artifact name

## Example : ./websetup.sh https://www.tooplate.com/zip-templates/2090_kinetic.zip 2090_kinetic 

# The URL after the ./websetup.sh will fill the $1 Variable and the 2090_kinetic will fill the $2 Variable
# This allows for anyone to use any web template of their choosing and is not limited to a single Template, it is a great reusable bash script.

#! bin/bash

### Creation of a website script using a HTML Template ###

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
#URL='https://www.tooplate.com/zip-templates/2090_kinetic.zip'
#ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo yum install $PACKAGE -y > /dev/null
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $1 > /dev/null
unzip $2.zip > /dev/null
sudo cp -r $2/* /var/www/html/
echo

# Bounce Service
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"
systemctl restart $SVC
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf $TEMPDIR
echo

# Printing the status of the HTTPD service
echo “#############################”
echo “Status HTTPD Service”
echo “#############################”
sudo systemctl status $SVG
echo

# Checking the contents of the /var/www/html folder
echo “#############################”
echo “/var/www/html contents”
echo “#############################”
ls /var/www/html/

# This can be used to test the website by using the VM’s local IP address
ifconfig

# Copy and paste the 192.xxx.xx.xx IP address into your browser, you should now have a website load
