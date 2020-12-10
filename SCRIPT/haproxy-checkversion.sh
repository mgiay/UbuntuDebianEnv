#!/bin/bash
#/opt/script/haproxy-checkversion.sh
#LastUpdate: #14:09 2018.10.01, #16:39 2018.07.16
#cat /opt/script/haproxy-checkversion.sh | grep LastUpdate
###############################
###HAPROXY: haproxy-restart.sh | haproxy-reload.sh | haproxy-stop.sh | haproxy-checkconfig.sh
#   GREP EXCLUDE HAPROXY:   netstat-status.sh  | grep -v "haproxy"
###############################
#####################################
#groupadd -g 3003 haproxy
#useradd -u 3003 -s /bin/false -d /bin/null -c "haproxy USER" -g haproxy haproxy
#fuser: command not found
#apt install psmisc
#####################################

source /etc/haproxy/HAPROXY_VERSION.txt
export LD_LIBRARY_PATH=/opt/openssl-1.1.1g/lib/
clear

echo "#####################################"
echo "HAPROXY_BIN_FILE: "$HAPROXY_BIN_FILE

echo ""
echo "HAPROXY_CONFIG_LOC: "$HAPROXY_CONFIG_LOC

echo ""
echo "HAPROXY_PID_FILE: "$HAPROXY_PID_FILE

echo "-------------------------------------"HAPROXY_VERSION_DETAILS_INFO":BEGIN"
echo "DATE: " "$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
$HAPROXY_BIN_FILE -vv
echo "DATE: " "$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "-------------------------------------"HAPROXY_VERSION_DETAILS_INFO":END"

echo "#####################################"

#THE-END
