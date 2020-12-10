#!/bin/bash
###################################
#FILE_NAME: /opt/script/get-date-1s.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.42.57.115
###################################
###################################CONTENT:BEGIN
mkdir -p /opt/log/
var1=$(cat /etc/timezone);
var2=$(date +'%:z');
echo "$(date +'%Y.%m.%d-%H.%M.%S.%10N')" "|" $var1 "|" $var2>>/opt/log/date.log
###################################CONTENT:END
#THE-END
