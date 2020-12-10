#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: /opt/script/ps-kill-process-name.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.57.28.652
###################################
###################################CONTENT:BEGIN
#C1: sh ps-kill-process-name.sh "<processname>"
#C2: sh ps-kill-process-name.sh "<ps1|ps2|..|psn>"
#ex: sh ps-kill-process-name.sh "haproxy|pure|mysqld|redis|nginx|php|netdata"
###################################
var1=
ps aux | egrep  | awk '{print }' | xargs kill -9
ps aux | egrep 
###################################CONTENT:END
#THE-END
