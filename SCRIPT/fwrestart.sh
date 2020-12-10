#!/bin/bash
###################################
#FILE_NAME: /opt/script/fwrestart.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.43.10.511
###################################
###################################CONTENT:BEGIN
echo "###################################"
echo "RESTART FIREWALL:"
#service iptables-persistent restart
service netfilter-persistent restart
tail -10f /var/log/syslog | grep netfilter
###################################CONTENT:END
#THE-END
