#!/bin/bash
#/opt/script/haproxy-restart.sh
#LastUpdate: #14:09 2018.10.01, #23:59 2018.07.22
#cat /opt/script/haproxy-restart.sh | grep LastUpdate
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
#__________HAPROXY_PARAMETERS:BEGIN
#HAPROXY_BIN_FILE="/opt/setup/haproxy-1.8.12/haproxy"
#HAPROXY_BIN_FILE="/opt/setup/haproxy-1.8.12/haproxy"
#HAPROXY_CONFIG_LOC="/etc/haproxy"
#HAPROXY_PID_FILE="/var/run/haproxy.pid"
# #__________HAPROXY_PARAMETERS:END
#HAPROXY_CONFIG_FILE="/etc/haproxy/haproxy.cfg"
HAPROXY_CONFIG_FILE="";



#__________LINUX_TURNINNG:BEGIN
#PARAMETERs:
LINUX_TRANSPARENT_HUGEPAGE=never
LINUX_SOMAXCONN=4000000
LINUX_MAX_OPENFILE=4000000
LINUX_NR_OPEN=5000000

#LINUX_ULIMIT=1 000 032
LINUX_ULIMIT=5000000
#LINUX_ULIMIT=1048576


echo $LINUX_TRANSPARENT_HUGEPAGE > /sys/kernel/mm/transparent_hugepage/enabled
sysctl -w net.core.somaxconn=$LINUX_SOMAXCONN
echo $LINUX_MAX_OPENFILE > /proc/sys/fs/file-max
echo $LINUX_NR_OPEN > /proc/sys/fs/nr_open

ulimit -n $LINUX_ULIMIT

echo 1024 65535 > /proc/sys/net/ipv4/ip_local_port_range
sysctl -w net.ipv4.tcp_tw_reuse=1
sysctl -w net.netfilter.nf_conntrack_max=2000000
# Mar 12 11:22:53 dc2 kernel: [15703450.586885] net_ratelimit: 1121 callbacks suppressed
# Mar 12 11:22:53 dc2 kernel: [15703450.586889] nf_conntrack: table full, dropping packet
# Mar 12 11:22:53 dc2 kernel: [15703450.587223] nf_conntrack: table full, dropping packet
# Mar 12 11:22:53 dc2 kernel: [15703450.588050] nf_conntrack: table full, dropping packet
# Mar 12 11:22:53 dc2 kernel: [15703450.588490] nf_conntrack: table full, dropping packet

#__________LINUX_TURNINNG:END
 

 #__________LINUX_SCAN_ALL_CONFIG_FILE:BEGIN
#HAPROXY HTTP CONFIG FILE (PORT 80, 443):
cd $HAPROXY_CONFIG_LOC
var1_cfg="";
var2_cfg="";
for var1_cfg in *.cfg;
do 
    var2_cfg+=" -f "$HAPROXY_CONFIG_LOC/$var1_cfg;
done
HAPROXY_CONFIG_FILE=$var2_cfg;
#echo $HAPROXY_CONFIG_FILE;


#HAPROXY TCP CONFIG FILE (OTHERS TCP PORT):
var3_tcp="";
var4_tcp="";
for var3_tcp in *.tcp; 
do 
    var4_tcp+=" -f "$HAPROXY_CONFIG_LOC/$var3_tcp;    
done
# echo "var3_tcp: "$var3_tcp;
# echo "var4_tcp: "$var4_tcp;
HAPROXY_CONFIG_FILE+=$var4_tcp
#echo "HAPROXY_CONFIG_FILE: "$HAPROXY_CONFIG_FILE

#__________LINUX_SCAN_ALL_CONFIG_FILE:END


###################################

clear
echo "#################################1"
$HAPROXY_BIN_FILE -v | egrep  "version|Copyright"
#echo ""
echo "#################################2"
cd $HAPROXY_CONFIG_LOC
echo "-"
    for var5_temp in haproxy_*.cfg;
    do    
    echo " -f "$var5_temp;
    done
    #
    for var5_temp in haproxy_*.tcp;
    do    
    echo " -f "$var5_temp;
    done
echo "-"
#$HAPROXY_BIN_FILE -c $HAPROXY_CONFIG_FILE
echo "#################################3"
echo "HAPROXY: CURRENT 5 PID:"
netstat -ntlup| egrep "PID|LISTEN" | sort -t: -k2 -n  | egrep "PID|haproxy" | head -n 6



echo "#################################4"
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
#sleep 3
echo "#################################5"
echo "HAPROXY: RESTART..."
#_____HAPROXY_RESTART_CONFIG:BEGIN
#echo "[$HAPROXY_BIN_FILE] <<$HAPROXY_CONFIG_FILE>> -p [$HAPROXY_PID_FILE] -sf [$(cat $HAPROXY_PID_FILE)]"
#      $HAPROXY_BIN_FILE $HAPROXY_CONFIG_FILE -p $HAPROXY_PID_FILE -sf $(cat $HAPROXY_PID_FILE)

echo "[$HAPROXY_BIN_FILE] [$HAPROXY_CONFIG_FILE ]"
      $HAPROXY_BIN_FILE $HAPROXY_CONFIG_FILE

sleep 3
#_____HAPROXY_RESTART_CONFIG:END


#
echo "#################################6"
echo "HAPROXY: NEW 5 PID:"
netstat -ntlup| egrep "PID|LISTEN" | sort -t: -k2 -n  | egrep "PID|haproxy" | head -n 6

echo "#################################7"
ps aux | egrep "PID|haproxy"
###################################CONTENT:END


#THE-END

