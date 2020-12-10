#!/bin/bash
###################################
#FILE_NAME: /opt/script/netstat-status.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.43.42.778
###################################
###################################CONTENT:BEGIN
echo "############################################"
netstat -ntlup | egrep "PID|LISTEN" | sort -t: -k2 -n
###################################CONTENT:END
#THE-END
