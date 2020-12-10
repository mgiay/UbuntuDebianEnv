#!/bin/bash
###################################
#FILE_NAME: /opt/script/crontab-edit.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.42.55.665
###################################
###################################CONTENT:BEGIN
#Crontab Generator
#https://crontab-generator.org/

chattr -i /var/spool/cron/crontabs/root
crontab -e
###################################CONTENT:END
#THE-END
