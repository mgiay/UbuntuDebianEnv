#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: /opt/script/network-SYNC_RECV-status.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.44.51.895
###################################
###################################CONTENT:BEGIN
echo "###################################"
date;netstat -nat | awk '{print $6}' | sort | uniq -c | sort -n;date;
echo "###################################"
###################################CONTENT:END
#THE-END
