#!/bin/bash
###################################
#FILE_NAME: /opt/script/fwdelete.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.43.12.994
###################################
###################################CONTENT:BEGIN
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
/opt/script/fwsave.sh
/opt/script/fwrestart.sh
echo "####################################"
/opt/script/fwstatus.sh
###################################CONTENT:END
#THE-END
