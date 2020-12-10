#!/bin/bash
###################################
#FILE_NAME: /opt/script/time-force-update.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-09.39.45.612
###################################
###################################CONTENT:BEGIN
/usr/sbin/ntpdate -u 129.250.35.250
/usr/sbin/ntpdate -u 209.58.185.100
/usr/sbin/ntpdate -u 129.250.35.251
/usr/sbin/ntpdate -u 218.186.3.36

/usr/sbin/ntpdate -u 211.19.59.28
/usr/sbin/ntpdate -u 210.173.160.87
/usr/sbin/ntpdate -u 133.243.238.164
/usr/sbin/ntpdate -u 203.95.213.129

/opt/script/log-truncate.sh
echo "" > /opt/log/date.log
###################################CONTENT:END
#THE-END
