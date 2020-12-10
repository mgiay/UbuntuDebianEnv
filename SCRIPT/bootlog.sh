#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: /opt/script/bootlog.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.44.13.323
###################################
###################################CONTENT:BEGIN
clear
echo "##########################################"
#journalctl -b0 SYSLOG_PID=1 | more
journalctl -b0 --system _COMM=systemd | more
###################################CONTENT:END
#THE-END
