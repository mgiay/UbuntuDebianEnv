#!/bin/bash
###########################################
#/opt/script/pingi.sh
#LastUpdate: #16:26 2018.02.06
###########################################
#sh /opt/script/pingi.sh <domain | IP>
###########################################
# Souce: https://superuser.com/questions/270083/linux-ping-show-time-out
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"

host=$1

mkdir -p /opt/temp/ping-test
cd /opt/temp/ping-test
LOG_FILE=lostpackets-$host-$now1.log

if [ -z $host ]; then
    echo "Usage: `basename $0` [HOST]"
    exit 1
fi

while :; do
    result=`ping -W 1 -c 1 $host | grep 'bytes from '`
    if [ $? -gt 0 ]; then
        echo "`date +'%Y.%m.%d-%H.%M.%S.%3N'` - host [$host] is \033[0;31mdown\033[0m"
        echo "`date +'%Y.%m.%d-%H.%M.%S.%3N'` - host [$host] is \033[0;31mdown\033[0m" >> $LOG_FILE
    else
        echo "`date +'%Y.%m.%d-%H.%M.%S.%3N'` - host [$host] is \033[0;32mok\033[0m -`echo $result | cut -d ':' -f 2`"        
        sleep 1 # avoid ping rain
    fi
done

#THE-END

#16:10 2018.02.06
# NAME: ping, ping6 - send ICMP ECHO_REQUEST to network hosts
    # -W timeout: Time  to  wait  for  a  response, in seconds. The option affects only timeout in absence of any responses, otherwise ping waits for two RTTs.
    # -c count: Stop  after  sending  count  ECHO_REQUEST  packets.  With  deadline  option, ping waits for count ECHO_REPLY packets, until the timeout expires.

###screen-kill-all.sh | screen -S <Create new Screen Name> | screen -ls
###cd /opt/temp/ping-test | sh pingi.sh <domain | IP>


# root@srv128:/opt/script# cat screen-kill-all.sh
# ps aux| grep SCREEN | awk '{print $2}' | xargs kill -9
# screen -wipe
# screen -ls
#


