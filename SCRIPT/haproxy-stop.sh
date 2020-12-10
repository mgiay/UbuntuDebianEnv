#!/bin/bash
#/opt/script/haproxy-stop.sh
#LastUpdate: #14:09 2018.10.01, #16:39 2018.07.16
#cat /opt/script/haproxy-stop.sh | grep LastUpdate
###############################
###HAPROXY: haproxy-restart.sh | haproxy-reload.sh | haproxy-stop.sh | haproxy-checkconfig.sh
#   GREP EXCLUDE HAPROXY:   netstat-status.sh  | grep -v "haproxy"
###############################
source /etc/haproxy/HAPROXY_VERSION.txt

#HAPROXY_BIN_FILE="/opt/setup/haproxy-1.8.12/haproxy"
#HAPROXY_PID_FILE="/var/run/haproxy.pid"
#HAPROXY_CONFIG_LOC="/etc/haproxy"

#HAPROXY_CONFIG_FILE="/etc/haproxy/haproxy.cfg"
HAPROXY_CONFIG_FILE="";


###################################CONTENT:BEGIN

echo "###############################"
echo "HAPROXY CURRENT PID: "
#netstat -ntlup | sort -t: -k2 -n | egrep "PID|haproxy"

netstat -ntlup| egrep "PID|LISTEN" | sort -t: -k2 -n  | egrep "PID|haproxy" | head -n 5

echo "###############################"
echo "KILL HAPROXY EXISTED INSTANCES:"
#netstat-status.sh | grep haproxy | awk '{print $2}' | xargs kill -9
fuser -k 80/tcp
fuser -k 443/tcp
# fuser -k 1234/tcp
# fuser -k 6677/tcp
# fuser -k 6996/tcp
# fuser -k 8668/tcp
# fuser -k 8686/tcp
#fuser -k 9000/tcp

killall haproxy

echo ""
echo ""
echo "###############################"
echo "HAPROXY NEW PID: "
netstat -ntlup | egrep "PID|haproxy"

echo "#################################"
echo "HAPROXY [ps aux]: "
ps aux | egrep "PID|haproxy"
echo "#################################"
###################################CONTENT:END

#THE-END

