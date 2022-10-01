#!/bin/bash

tar -czf ~/backups/backup.tar.gz ~/{Documents,Downloads,Desktop,Pictures,Videos} 2>/dev/null
date >> ~/backups/backups.log
