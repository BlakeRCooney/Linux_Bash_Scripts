#! bin/bash

### Creation of a website script using a HTML Template ###

# Install Dependencies
echo “#############################”
echo “Installing packages”
echo “#############################”
sudo yum install wget unzip httpd > /dev/null
echo

# Start and Enable the httpd Service
echo “#############################”
echo “Start and Enable the HTTPD Service”
echo “#############################”
sudo systemctl start httpd
sudo systemctl enable httpd
echo

echo “#############################”
echo “Starting Artifact Deployment”
echo “#############################”
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

# Downloading the Template from tooplate.com into the webfiles folder
wget https://tooplate.com/zip-templates/2123_simply_amazed.zip > /dev/null
# Unziping the file
unzip 2123_simply_amazed.zip > /dev/null
# Copy the file from the zip file into the html directory
sudo cp -r 2123_simply_amazed.zip
echo

# Bounce Service
echo “#############################”
echo “Restarting HTTPD Service”
echo “#############################”
systemctl restart httpd
echo

# Clean up the files in the tmp directory after the script is finished running
echo “#############################”
echo “Removing Temporary Files”
echo “#############################”
rm -rf /tmp/webfiles
echo

# Printing the status of the HTTPD service
echo “#############################”
echo “Status HTTPD Service”
echo “#############################”
sudo systemctl status httpd
echo

# Checking the contents of the /var/www/html folder
echo “#############################”
echo “/var/www/html contents”
echo “#############################”
ls /var/www/html/

# This can be used to test the website by using the VM’s local IP address
ifconfig

# Copy and paste the 192.xxx.xx.xx IP address into your browser, you should now have a website load
