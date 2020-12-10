#!/bin/bash
#/opt/script/haproxy_monitor_stats.sh
#LastUpdate: #08:09 2019.08.27
#####################################
# Check process HAProxy status every minute.
# * * * * * /opt/script/haproxy_monitor_stats.sh
#####################################
netstat -ntlup | egrep "PID|LISTEN" | sort -t: -k2 -n | grep "0.0.0.0:80"
CHECK_HAPROXY_PROCESS=$?
if [ $CHECK_HAPROXY_PROCESS -eq 0 ]; then
    echo "HAProxy is still running. ^^";
else
    /opt/script/haproxy-restart.sh
fi

#THE-END
