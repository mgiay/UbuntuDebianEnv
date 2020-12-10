#!/bin/bash
#!/bin/sh -e
#/opt/script/haproxy-checkconfig.sh
#LastUpdate: #14:08 2018.10.01, #14:18 2018.07.25
#cat /opt/script/haproxy-checkconfig.sh | grep LastUpdate
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
#clear
source /etc/haproxy/HAPROXY_VERSION.txt
export LD_LIBRARY_PATH=/opt/openssl-1.1.1g/lib/
#HAPROXY_BIN_FILE="/opt/setup/haproxy-1.8.12/haproxy"
#HAPROXY_CONFIG_FILE="/etc/haproxy/haproxy.cfg"
#HAPROXY_CONFIG_LOC="/etc/haproxy"
HAPROXY_CONFIG_FILE="";

now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "###############################0 | $now1"
echo "TURNING SERVER: ...."
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
#__________LINUX_TURNINNG:END
 

 #__________LINUX_SCAN_ALL_CONFIG_FILE:BEGIN
cd $HAPROXY_CONFIG_LOC

#PRINT CONFIG FILE TO SCREEN, TO CHECK:
# echo ""
# echo "_____HAPROXY_CONFIG_FILE:BEGIN";
# for var1_temp in haproxy*.*;
# do    
    # echo $var1_temp;
# done
    # echo "_____HAPROXY_CONFIG_FILE:END";

#HAPROXY HTTP CONFIG FILE (PORT 80, 443):
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
#echo $HAPROXY_CONFIG_FILE
#__________LINUX_SCAN_ALL_CONFIG_FILE:END




#echo ""
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "###############################1 | $now1"
$HAPROXY_BIN_FILE -v | egrep  "version|Copyright"




#echo ""
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "###############################2 | $now1"
echo "CHECK HAPROXY CONFIG: "
#$HAPROXY_BIN_FILE -c -f $HAPROXY_CONFIG_FILE
echo "["$HAPROXY_BIN_FILE"]" "["$HAPROXY_CONFIG_FILE"]"
echo "_____HAPROXY_CONFIG_FILE:BEGIN"
    for var5_temp in haproxy_*.cfg;
    do    
        echo " -f "$var5_temp;
    done
    #
    for var5_temp in haproxy_*.tcp;
    do    
    echo " -f "$var5_temp;
    done
echo "_____HAPROXY_CONFIG_FILE:END"

echo ""
#CHECK: "Configuration file is valid"->OK
$HAPROXY_BIN_FILE -c $HAPROXY_CONFIG_FILE

echo ""
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "###############################3 | $now1"
echo "#HAPROXY: haproxy-stop.sh | haproxy-restart.sh | haproxy-reload.sh | haproxy-checkconfig.sh"

#THE-END

