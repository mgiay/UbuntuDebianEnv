#!/bin/bash
###################################
#FILE_NAME: /opt/script/fwstop.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.43.11.908
###################################
###################################CONTENT:BEGIN
#service iptables-persistent flush
service netfilter-persistent flush
/usr/sbin/netfilter-persistent flush
echo "####################################"
/opt/script/fwstatus.sh
###################################CONTENT:END
#THE-END
