#!/bin/bash
###################################
#FILE_NAME: /opt/script/fwbackup.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.43.10.921
###################################
###################################CONTENT:BEGIN
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
mkdir -p /etc/iptables/bk/
mkdir -p /opt/script/bk/
cd /etc/iptables/
mv rules*.bk /etc/iptables/bk/

cd /opt/script/
mv iptables*.bk /opt/script/bk/

IPTABLES_FILE_SOURCE=/etc/iptables/rules.v4
yes | cp -v $IPTABLES_FILE_SOURCE /etc/iptables/rules.v4-$now1.bk
yes | cp -v $IPTABLES_FILE_SOURCE /opt/script/iptables-$now1.bk
yes | cp -v $IPTABLES_FILE_SOURCE /opt/script/iptables-runningOK.bk
ls -l /opt/script/iptables*.bk
###################################CONTENT:END
#THE-END
