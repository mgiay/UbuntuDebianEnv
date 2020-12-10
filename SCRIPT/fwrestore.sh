#!/bin/bash
###################################
#FILE_NAME: /opt/script/fwrestore.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.43.11.645
###################################
###################################CONTENT:BEGIN
FILE_RESTORED='iptables-runningOK.bk'
yes | cp /opt/script/$FILE_RESTORED /etc/iptables/rules.v4
/opt/script/fwrestart.sh
###################################CONTENT:END
#THE-END
