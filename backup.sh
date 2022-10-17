#!/bin/bash

# Author: Blake Cooney
# Date Created: 09/29/2022
# Last Modified: 09/29/2022

# Description:
# Creates a backup in ~/backups folder of all files in the home directory

# Usage:
# backup.sh

tar -czf ~/backups/backup.tar.gz ~/{Documents,Downloads,Desktop,Pictures,Videos} 2>/dev/null
date >> ~/backups/backups.log
