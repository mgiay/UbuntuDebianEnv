#!/bin/bash
###################################
#FILE_NAME: /opt/script/file-unlock.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.44.05.726
###################################
###################################CONTENT:BEGIN
cd /opt/script/
chattr -i *.sh
chattr -i banner*
chattr -i /etc/group
chattr -i /etc/passwd
chattr -i /etc/profile
chattr -i /etc/shadow*
chattr -i /etc/iptables/rules.v4

chattr -i /etc/ssh/*
chattr -i /var/spool/cron/crontabs/root
chattr -i /etc/rc.local
chattr -i /etc/network/interfaces
chattr -i /etc/netplan/00-installer-config.yaml
chattr -i /etc/haproxy/*
chattr -i /etc/nginx/*
awk -F: '($3 == "0") {print}' /etc/passwd
echo "LOCKED!"
###################################CONTENT:END
#THE-END
