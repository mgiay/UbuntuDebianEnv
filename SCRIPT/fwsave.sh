#!/bin/bash
###################################
#FILE_NAME: /opt/script/fwsave.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.43.12.361
###################################
###################################CONTENT:BEGIN
#service iptables-persistent save
service netfilter-persistent save
echo "####################################"
/opt/script/fwstatus.sh
###################################CONTENT:END
#THE-END
