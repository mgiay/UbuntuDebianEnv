#config-server-UBUNTU-20.04-LTS-2.sh
#LastUpdate: #9:38 2020.10.30
#######################################
sudo apt-get -y install net-tools
sudo apt-get -y install ccache;
sudo apt-get -y install nload ntp ntpdate ntp-doc nano wget tree telnet htop keepalived; p7zip-full inetutils-traceroute mtr sysstat ifupdown;
sudo apt-get -y install iptables-persistent psmisc;
sudo apt-get -y install geoip-bin;
sudo apt-get -y install fping python-dev python-pip;
sudo apt-get -y install byobu screen tmux
#######################################

SCRIPT_LOC="/opt/script"
mkdir -p $SCRIPT_LOC
cd $SCRIPT_LOC

#__________[CONFIG]:BEGIN
FILE_NAME="/etc/hosts"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME.bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
127.0.0.1 localhost ns536903
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"
echo ""
#__________[CONFIG]:END


#HOSTNAME:
#C1:
#HOST_NAME="$(hostname)_india01"; hostnamectl set-hostname $HOST_NAME --static
HOST_NAME="srv032"; hostnamectl set-hostname $HOST_NAME --static



#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/hostname-change.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
HOST_NAME=$1
hostnamectl set-hostname $HOST_NAME --static
echo "127.0.0.1 "$HOST_NAME >> /etc/hosts
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



# root@srv015:~# date; hostnamectl status
# Thu Oct 29 19:38:42 +07 2020
   # Static hostname: srv015
         # Icon name: computer-vm
           # Chassis: vm
        # Machine ID: a0ddd3c96a3047c2a12c731222603033
           # Boot ID: 08ae59dacfba4066835cdcb5874cf968
    # Virtualization: vmware
  # Operating System: Ubuntu 18.04.3 LTS
            # Kernel: Linux 4.15.0-50-generic
      # Architecture: x86-64
# root@srv015:~# 


 

#__________[CONFIG]:BEGIN
FILE_NAME="/etc/resolv.conf"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME.bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
nameserver 1.1.1.1
nameserver 8.8.8.8
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME";echo ""
#__________[CONFIG]:END


#Enable 'nano editor' with line number for user 'root':
LINUX_USERNAME="root"
echo "set linenumbers" > /$LINUX_USERNAME/.nanorc





#BANNER OS INFO:
#{
yes | cp /opt/script/banner /opt/script/banner-[$(date +'%Y.%m.%d-%H.%M.%S.%3N')].bk
echo "#########################################" > /opt/script/banner
echo "#WAN-[]-[]-[]" >> /opt/script/banner
echo "#LAN-[]-[]-[]" >> /opt/script/banner
echo "#Created [$(date +'%Y%m%d-%Hh%Mp') GMT+7] | [$(hostname)]" >> /opt/script/banner
ip a s | egrep 'eth*|sns*' | awk '{print $2}'  >>/opt/script/banner
echo "GW: $(ip route | grep "default" | awk '{print $3}')" >> /opt/script/banner
echo "#########################################" >>/opt/script/banner
#uname -s -n -r -o >>/opt/script/banner
#uname -v          >>/opt/script/banner
echo "Linux Kernel: $(uname -a)" >> /opt/script/banner
echo "Linux Distro: $(cat /etc/lsb-release  | grep DISTRIB_DESCRIPTION)" >>/opt/script/banner
echo "nano /opt/script/banner" > /opt/script/banner-edit.sh
echo "cat /opt/script/banner | more" >/opt/script/banner-view.sh

FILE_NAME="/opt/script/banner"
mkdir -p /opt/script/
cd /opt/script
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
cat <<EOF >> $FILE_NAME
###lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL
###DEFAULT ROUTE: $(ip route)
###SERVICE: service --status-all | systemctl status <ServiceName> --no-pager;
    systemctl disable <ServiceName> | systemctl enable <ServiceName>
    systemctl stop <ServiceName> | systemctl start <ServiceName> | systemctl restart <ServiceName>    
###7za: COMPRESS: 7za a -mhe=on -p310212 <dest.7z> <src> > /dev/null
#        EXTRACT : 7za x -mhe=on -p310212 <dest.7z>       > /dev/null
###HAPROXY: haproxy-restart.sh | haproxy-reload.sh | haproxy-stop.sh | haproxy-checkconfig.sh
    HAPROXY STATS REALTIME: watch -n 1 "COLUMN= echo 'show stat' | nc -U /var/lib/haproxy/stats"   
    haproxy-checkversion.sh | haproxy-concatenate-vhost.sh;haproxy-checkconfig.sh
EOF
#}
clear;cat /opt/script/banner




#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/pingme.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME.bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
name=\$1
ping \$name | while read pong; do echo "[\$(date +'%Y.%m.%d-%H.%M.%S.%3N')][\$pong]"; done | nl
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME";echo ""
#__________[CONFIG]:END




#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/time-force-update.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME.bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
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
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/log-truncate.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME.bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
echo "" > /var/log/syslog
echo "" > /var/log/messages

#find /var/log -type f -exec bash -c 'cat /dev/null > $0' {} \;
LOC=/var/log/
for item in \$(find \$LOC -type f -name '*.*' ) ; 
    do cat /dev/null > \$item ;
done


LOC=/var/mail/
for item in \$(find \$LOC -type f -name '*.*' ) ; 
    do cat /dev/null > \$item ;
done


LOC=/var/spool/postfix/incoming
for item in \$(find \$LOC -type f -name '*.*' ) ; 
    do cat /dev/null > \$item ;
done


LOC=/var/spool/postfix/active
for item in \$(find \$LOC -type f -name '*.*' ) ; 
    do cat /dev/null > \$item ;
done


LOC=/var/spool/postfix/deferred
for item in \$(find \$LOC -type f -name '*.*' ) ; 
    do cat /dev/null > \$item ;
done


LOC=/var/spool/postfix/maildrop
for item in \$(find \$LOC -type f -name '*.*' ) ; 
    do cat /dev/null > \$item ;
done
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/nload-WAN.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME.bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
ETHERNET_WAN="enp1s0f0"
nload \$ETHERNET_WAN -t 3000 -i 10000 -o 50000
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/nload-LAN.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME.bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
ETHERNET_LAN="ens160"
nload \$ETHERNET_LAN -t 3000 -i 10000 -o 50000
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#IPAS:
#{
echo "ip a s" >/opt/script/ipas.sh
#}


#INSTALL NETDATA:
#9:30 2020.10.27
#https://www.howtoforge.com/tutorial/how-to-install-netdata-monitoring-tool-on-ubuntu/
#
sudo apt-get -y install netdata
#
# sudo nano /etc/netdata/netdata.conf
# [global]
        # run as user = netdata
        # web files owner = root
        # web files group = root
        # # Netdata is not designed to be exposed to potentially hostile
        # # networks.See https://github.com/firehol/netdata/issues/164
        # #bind socket to IP = 127.0.0.1
        # #bind socket to IP = 139.99.8.170
        # bind socket to IP = 0.0.0.0
# #
sudo systemctl restart netdata
sudo systemctl status netdata




#DISABLE IPv6:
#__________[CONFIG]:BEGIN
FILE_NAME="/etc/sysctl.conf"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.all.disable_ipv6=1
###################################CONTENT:END
#THE-END
EOF
sysctl -p
ip a s

cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END


#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/network-restart.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#UBUNTU NETWORK RESTART
ifdown -a; ifup -a
sleep 5; 
ip a s
echo "#################"
ip route
echo "#################"
netstat -rn
echo "#################"
ping 8.8.8.8 -c 5
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



# #UBUNTU 16:
# #__________[CONFIG]:BEGIN
# FILE_NAME="network-edit-16.sh"
# now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
# chattr -i -f $FILE_NAME
# cp -v $FILE_NAME $FILE_NAME-[$now1].bk
# cat <<EOF > $FILE_NAME
# #!/bin/bash
# ###################################
# #FILE_NAME: $FILE_NAME
# #Author: qwerty | tinhcx@gmail.com
# #LastUpdate: #$now1
# ###################################
# ###################################CONTENT:BEGIN
# #UBUNTU NETWORK EDIT:
# NETWORK_CONFIG_FILE="/etc/network/interfaces"
# nano \$NETWORK_CONFIG_FILE
# ###################################CONTENT:END
# #THE-END
# EOF
# cat $FILE_NAME
# chattr +i -f $FILE_NAME
# echo "FILE_NAME: $FILE_NAME"; echo ""
# #__________[CONFIG]:END



# #UBUNTU 18:
# #__________[CONFIG]:BEGIN
# FILE_NAME="network-edit-18.sh"
# now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
# chattr -i -f $FILE_NAME
# cp -v $FILE_NAME $FILE_NAME-[$now1].bk
# cat <<EOF > $FILE_NAME
# #!/bin/bash
# ###################################
# #FILE_NAME: $FILE_NAME
# #Author: qwerty | tinhcx@gmail.com
# #LastUpdate: #$now1
# ###################################
# ###################################CONTENT:BEGIN
# #UBUNTU NETWORK EDIT:
# NETWORK_CONFIG_FILE="/etc/netplan/50-cloud-init.yaml"
# nano \$NETWORK_CONFIG_FILE
# ###################################CONTENT:END
# #THE-END
# EOF
# cat $FILE_NAME
# chattr +i -f $FILE_NAME
# echo "FILE_NAME: $FILE_NAME"; echo ""
# #__________[CONFIG]:END




#UBUNTU 20:
#__________[CONFIG]:BEGIN
FILE_NAME="network-edit-20.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#UBUNTU NETWORK EDIT:
NETWORK_CONFIG_FILE="/etc/netplan/00-installer-config.yaml"
nano \$NETWORK_CONFIG_FILE
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END

#__________[CONFIG]:BEGIN
FILE_NAME="/etc/netplan/00-installer-config.yaml"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#/etc/netplan/00-installer-config.yaml
#LastUpdate: #20:25 2020.10.29
#################################
# INTERFACE="ens160"
# SUBNET="255.255.255.0"
# IP="10.0.1.68"
# GW="10.0.1.11"
# #ip addr del $IP dev $INTERFACE

# ifconfig $INTERFACE $IP netmask $SUBNET
# #route delete default gw $GW
# route add default gw $GW

# IP="10.0.1.20"
# ip addr del $IP dev $INTERFACE
#################################

#_________[GLOBAL]:BEGIN
network:
    version: 2
    ethernets:
#_________[GLOBAL]:END

#_________[WAN]:BEGIN
#        ens192:
#            addresses: [172.16.0.68/24]
#            gateway4: 172.16.0.253
#            nameservers:
#                addresses: [1.1.1.1,8.8.8.8]
#                search: [google.com]
#            dhcp4: no
#_________[WAN]:BEGIN

#_________[LAN]:BEGIN
        ens160:
            addresses: [10.0.2.30/24]
            gateway4: 10.0.2.254
            nameservers:
                addresses: [1.1.1.1,8.8.8.8]
                search: [google.com]
            dhcp4: no
#_________[LAN]:END
#THE-END 
#sudo netplan --debug apply
#netplan apply

###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#GMT+7:
#__________[TIME_ZONE]:BEGIN
timedatectl | grep Time
timedatectl set-timezone Asia/Ho_Chi_Minh
timedatectl | grep Time

date; /bin/rm -rf /etc/localtime
date; ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
date
#__________[TIME_ZONE]:END



#GMT+8:
#__________[TIME_ZONE]:BEGIN
date
/bin/rm -rf /etc/localtime
ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime
date
timedatectl | grep Time
#__________[TIME_ZONE]:END



#GMT+1:
#__________[TIME_ZONE]:BEGIN
date
/bin/rm -rf /etc/localtime
ln -sf /usr/share/zoneinfo/Africa/Lagos /etc/localtime
date
timedatectl | grep Time
#__________[TIME_ZONE]:END




#GMT+5.30:
#__________[TIME_ZONE]:BEGIN
date
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
date
timedatectl | grep Time
#__________[TIME_ZONE]:END



#GMT-6:
#__________[TIME_ZONE]:BEGIN
date
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
date
timedatectl | grep Time
#__________[TIME_ZONE]:END



#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/crontab-edit.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#Crontab Generator
#https://crontab-generator.org/

chattr -i /var/spool/cron/crontabs/root
crontab -e
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/crontab-lock.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
chattr +i /var/spool/cron/crontabs/root
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/schedule-per-1s.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#http://serverfault.com/questions/246044/how-can-i-schedule-a-cron-job-that-runs-every-10-seconds-in-linux
#
i=0
while [ \$i -lt 60 ]; do
  /opt/script/get-date-1s.sh &
  sleep 1
  i=\$(( i + 1 ))
done
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/get-date-1s.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
mkdir -p /opt/log/
var1=\$(cat /etc/timezone);
var2=\$(date +'%:z');
echo "\$(date +'%Y.%m.%d-%H.%M.%S.%10N')" "|" \$var1 "|" \$var2>>/opt/log/date.log
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END
#__________[CONFIG]:BEGIN
FILE_NAME="/var/spool/cron/crontabs/root"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#*     *     *   *    *      command to be executed         
#-     -     -   -    -                                       
#|     |     |   |    |                                       
#|     |     |   |    +----- day of week (MON-1|TUE-2|WED-3|THU-4|FRI-5|SAT-6|SUN-0)
#|     |     |   +------- month (1-12)                    
#|     |     +--------- day of month (1-31)
#|     +----------- hour (0-23)                    
#+------------- min (0-59)
###################################
#GET DATE PER 1min:
#* * * * * /opt/script/schedule-per-1s.sh

#Sync Time Server, daily, 23h00:          
00 23 * * * /opt/script/time-force-update.sh

#CRONTAB BACKUP, DAILY, 23h00:
#00 23 * * * /opt/script/crontab-backup.sh

# Check process HAProxy status every minute.
# * * * * * /opt/script/haproxy_monitor_stats.sh

#CLEAR RAM PER HOUR: 
0 */1 * * * /opt/script/ram.clear.sh

###################################CONTENT:END
#THE-END
EOF
crontab crontab-temp.txt
crontab -l

cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END







#__________[GLOBAL_VARIABLES]:BEGIN
FILE_NAME="/etc/profile"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF >> $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
############################################
export PS1="\u@\h \w# "
export HISTTIMEFORMAT='%F %T  '
export EDITOR=nano
############################################
#GLOBAL PATH VARIABLES:
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/jdk1.8.0_144/bin:/opt/script:/opt/lampp/b#in:/usr/local/pgsql/bin
#export PATH
# PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# PATH=$PATH:$JAVA_HOME/bin:/opt/script

#GLOBAL PATH VARIABLES:
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/jdk1.8.0_141/bin:/opt/script:/opt/lampp/bin:/usr/local/pgsql/bin:/opt/mariadb/bin
export PATH


#JAVA CLASSPATH:
CLASSPATH=:/opt/jdk1.8.0_141/jre/lib:/opt/jdk1.8.0_141/jre/lib/ext:/opt/atlassian/jira/bin/bootstrap.jar:/opt/atlassian/jira/bin/tomcat-juli.jar:.
export CLASSPATH

JAVA_HOME=/opt/jdk1.8.0_141
export JAVA_HOME

JRE_HOME=/opt/jdk1.8.0_141/jre
export JRE_HOME

CATALINA_BASE=/opt/atlassian/jira
export CATALINA_BASE

CATALINA_HOME=/opt/atlassian/jira
export CATALINA_HOME

CATALINA_TMPDIR=/opt/atlassian/jira/temp
export CATALINA_TMPDIR

CATALINA_PID=/opt/atlassian/jira/work/catalina.pid
export CATALINA_PID
###########################################
#__________GLOBAL_ALIAS:BEGIN
#https://viblo.asia/p/su-dung-alias-trong-linux-qm6RWq4xGeJE
alias ll='ls -l'
alias rm='echo "command not found"; false'

#/usr/bin/apt       install x
#/usr/bin//usr/bin/apt-get   install x
alias apt-get='echo "command not found"; false'
alias apt='echo "command not found"; false'


alias ai='sudo /usr/bin/apt-get install'
alias ar='sudo /usr/bin/apt-get remove'
alias au='sudo /usr/bin/apt-get update'
alias aug='sudo /usr/bin/apt-get upgrade'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias du='du -h'
alias df='df -h'
alias l.='ls -d .* --color=auto'
alias ls='ls -F --color=auto'
alias lsd='ls -ld */'

#Xóa màn hình và hiển thị file, thư mục con
alias cl='clear && ls'

alias e='exit'
alias s='sudo'

#Sửa file alias
alias nnb='nano ~/.bashrc'

#Load lại file alias
alias rlb='. ~/.bashrc'

alias h='history'

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'

#git config --get-regexp alias
#__________GLOBAL_ALIAS:END
###################################CONTENT:END
#THE-END
EOF
source /etc/profile
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[GLOBAL_VARIABLES]:END








#FIREWALL COMMAND:
echo "iptables -n -L -v --line-numbers | more" > /opt/script/fwstatus.sh
echo "nano /etc/iptables/rules.v4" > /opt/script/fwedit.sh
echo "cat  /etc/iptables/rules.v4 | more" > /opt/script/fwview.sh
   
#FIREWALL RESTART:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/fwrestart.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
echo "###################################"
echo "RESTART FIREWALL:"
#service iptables-persistent restart
service netfilter-persistent restart
tail -10f /var/log/syslog | grep netfilter
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END


#FIREWALL BACKUP:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/fwbackup.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
now1="\$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
mkdir -p /etc/iptables/bk/
mkdir -p /opt/script/bk/
cd /etc/iptables/
mv rules*.bk /etc/iptables/bk/

cd /opt/script/
mv iptables*.bk /opt/script/bk/

IPTABLES_FILE_SOURCE=/etc/iptables/rules.v4
yes | cp -v \$IPTABLES_FILE_SOURCE /etc/iptables/rules.v4-\$now1.bk
yes | cp -v \$IPTABLES_FILE_SOURCE /opt/script/iptables-\$now1.bk
yes | cp -v \$IPTABLES_FILE_SOURCE /opt/script/iptables-runningOK.bk
ls -l /opt/script/iptables*.bk
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END


#FIREWALL RESTORE:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/fwrestore.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
FILE_RESTORED='iptables-runningOK.bk'
yes | cp /opt/script/\$FILE_RESTORED /etc/iptables/rules.v4
/opt/script/fwrestart.sh
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END


#FIREWALL STOP:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/fwstop.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#service iptables-persistent flush
service netfilter-persistent flush
/usr/sbin/netfilter-persistent flush
echo "####################################"
/opt/script/fwstatus.sh
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#FIREWALL SAVE:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/fwsave.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#service iptables-persistent save
service netfilter-persistent save
echo "####################################"
/opt/script/fwstatus.sh
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#FIREWALL DELETE:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/fwdelete.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
/opt/script/fwsave.sh
/opt/script/fwrestart.sh
echo "####################################"
/opt/script/fwstatus.sh
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END





#FIREWALL RULES:
#__________[CONFIG]:BEGIN
FILE_NAME="/etc/iptables/rules.v4"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk

ETHERNET_WAN="enp1s0f0"
ETHERNET_LAN="eth0"

cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#__________________________________CONTENT:BEGIN
#__________________________________CONTENT:BEGIN
###################################
#WAN: $ETHERNET_WAN
#LAN: $ETHERNET_LAN
###################################
#FIREWALL START HERE
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [694:742341]

#________________________FIREWALL_ICMP:BEGIN
#DROP PING ICMP from WAN:
#-A INPUT -p icmp -m icmp --icmp-type 8 -j DROP
#-A INPUT -i $ETHERNET_WAN -p tcp -m tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT
#KEANGNAM OFFICE: ALLOW ICMP:
# -A INPUT -s 118.70.129.67/32    -p icmp -m icmp --icmp-type 8 -j ACCEPT
# -A INPUT -s 27.72.88.85/32      -p icmp -m icmp --icmp-type 8 -j ACCEPT
# -A INPUT -s 113.190.235.124/32  -p icmp -m icmp --icmp-type 8 -j ACCEPT

# -A INPUT -s 27.68.131.146/32    -p icmp -m icmp --icmp-type 8 -j ACCEPT
# -A INPUT -s 113.190.252.1/32    -p icmp -m icmp --icmp-type 8 -j ACCEPT
# -A INPUT -s 42.112.210.35/32    -p icmp -m icmp --icmp-type 8 -j ACCEPT
# -A INPUT -s 27.72.89.143/32     -p icmp -m icmp --icmp-type 8 -j ACCEPT
#OVH MONITOR SERVER: ALLOW ICMP:
#-A INPUT -s 213.186.33.13/32    -p icmp -m icmp --icmp-type 8 -j ACCEPT
#INTERNET: DROP ICMP:
#-A INPUT -i $ETHERNET_WAN -p icmp -m icmp --icmp-type 8 -j DROP
#________________________FIREWALL_ICMP:END


-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
#-A INPUT -p vrrp -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT

#________________________FIREWALL:ACCESS_SERVER_PORT:BEGIN
#BLOCK CONFICKER BOTNET:

#Chan 1 IP: OUT
#-A OUTPUT -d 216.66.15.109/32 -j DROP
#-A OUTPUT -d 42.115.152.253/32 -j DROP
#-A OUTPUT -s 172.16.107.17/32 -j DROP

#Chan 1 NETWORK voi port 80
#-A OUTPUT -p tcp -d 192.168.100.0/24 --dport 80 -j ACCEPT
#Chan tat ca cac IP voi port 80. Server nay se ko the access bat ky dich vu gi su dung port 80
#-A OUTPUT -p tcp --dport 80  -j DROP
#-A OUTPUT -p tcp --dport 443 -j DROP


#RULE HERE:

#SSH: 65022
#WEBMIN: 65443
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22    -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 65022 -j ACCEPT


#FTP SERVER OVER LAN ONLY: FOR BACKUP ONLY
# -A INPUT -p tcp -m state --state NEW -m tcp --dport 21 -j ACCEPT
# -A INPUT -p tcp -m state --state NEW -m tcp --dport 60000:61000 -j ACCEPT
# -A INPUT -p tcp -m multiport --dport 21,60000:61000 -j ACCEPT

#HAPRORY: 80,443
-A INPUT -p tcp -m multiport --dport 443,80 -j ACCEPT

#NGINX: 8081,8082,8083,64180,64280,64281
#-A INPUT -p tcp -m multiport --dport 8081,8082,8083,64180,64280,64281,19999 -j ACCEPT


#PRIVATE LAN NETWORK:
#PRIVATE LAN NETWORK: TRUST ALL:
-A INPUT -s 10.0.2.0/24 -p tcp -m state --state NEW -m tcp -j ACCEPT
-A INPUT -s 10.0.2.0/24 -p udp -m state --state NEW -m udp -j ACCEPT
#-A INPUT -s 192.168.100.0/24 -p tcp -m state --state NEW -m tcp -j ACCEPT
#PRIVATE LAN NETWORK: TRUST SOME PORTS:
#-A INPUT -s 2.2.2.0/24 -p tcp -m multiport --dport 5432,6387,6388,6389 -j ACCEPT


#SSH: 65022,22
#-A INPUT -p tcp -m multiport --dport 65443,65022 -j ACCEPT
#KEANGNAM OFFICE:
# -A INPUT -s 183.81.32.105/32    -p tcp -m multiport --dport 65443,65022 -j ACCEPT
# -A INPUT -s 183.81.32.226/32    -p tcp -m multiport --dport 65443,65022 -j ACCEPT

# -A INPUT -s 14.160.24.171/32    -p tcp -m multiport --dport 65443,65022 -j ACCEPT
# -A INPUT -s 27.72.29.35/32      -p tcp -m multiport --dport 65443,65022 -j ACCEPT
# -A INPUT -s 118.70.175.147/32   -p tcp -m multiport --dport 65443,65022 -j ACCEPT
# -A INPUT -s 14.160.26.234/32    -p tcp -m multiport --dport 65443,65022 -j ACCEPT

#________________________FIREWALL:ACCESS_SERVER_PORT:END


#IMP: Reject all except above
-A INPUT -j REJECT --reject-with icmp-host-prohibited
#________________________FIREWALL_INBOUND_OUTBOUND:BEGIN
#SQUID: INBOUND
#-A INPUT -i $ETHERNET_WAN -p tcp -m tcp --sport 8080 -m state --state ESTABLISHED -j ACCEPT
#HAPROXY: INBOUND
#-A INPUT -i $ETHERNET_WAN -p tcp -m tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

#IMP: Do not delete this rule
-A FORWARD -j REJECT --reject-with icmp-host-prohibited

#SQUID: OUTBOUND
#-A OUTPUT -o $ETHERNET_WAN -p tcp -m tcp --dport 8080 -m state --state NEW,ESTABLISHED -j ACCEPT
#HAPROXY: OUTBOUND
#-A OUTPUT -o $ETHERNET_WAN -p tcp -m tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
#________________________FIREWALL_INBOUND_OUTBOUND:END
COMMIT
#________________________NAT:BEGIN
*nat
:PREROUTING ACCEPT [507:45436]
:POSTROUTING ACCEPT [1:108]
:OUTPUT ACCEPT [1:108]
#INTERNET GW: WAN: $ETHERNET_WAN
#-A POSTROUTING -o $ETHERNET_WAN -j MASQUERADE
COMMIT
#________________________NAT:END
#__________________________________CONTENT:END
#__________________________________CONTENT:END
###################################CONTENT:END
#FIREWALL END HERE
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#OS REBOOT + POWEROFF:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/ospoweroff.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
/opt/script/log-truncate.sh
poweroff
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END

#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/osreboot.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
/opt/script/log-truncate.sh
reboot
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#NETSTAT-STATUS:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/netstat-status.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
echo "############################################"
netstat -ntlup | egrep "PID|LISTEN" | sort -t: -k2 -n
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#SSH TURNING:
#__________[CONFIG]:BEGIN
FILE_NAME="/etc/ssh/sshd_config"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF >> $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
######################
Port 22
Port 65022
ListenAddress 0.0.0.0             
banner /opt/script/banner
######################
ClientAliveInterval 30
ClientAliveCountMax 99999
#AllowUsers *@2.2.2.0/24
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#SSH EDIT:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/ssh-edit.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
nano /etc/ssh/sshd_config
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#SSH RESTART:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/ssh-restart.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
echo "###################################"
echo "Current SSH PID: "
netstat -ntlup | egrep "PID|LISTEN" | sort -t: -k2 -n | egrep "PID|ssh"

#service ssh restart
systemctl restart sshd
echo "###################################"
echo "New SSH PID: "
sleep 5
netstat -ntlup | egrep "PID|LISTEN" | sort -t: -k2 -n | egrep "PID|ssh"

tail -10f /var/log/syslog | grep "Secure Shell server"
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END






#REMOVE DEB CACHE:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/remove-deb-cache.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
now1="\$(date +'%Y.%m.%d-%H.%M.%S.%3N')"

cd /var/cache/apt/
du -sh archives
tar -cf archives-\$now1.tar.gz archives
ls -lh archives-\$now1.tar.gz

find . -name *.deb -exec /bin/rm -rf {} \;
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#######################################
#LOCK:KHOA CAC FILE CO NGUY CO BI HACK:
#######################################
#{
##################################
#Write protecting a file using chattr command
#Let say you want to write protect the file called data.txt so that no other users can change it including root user, enter (you must login as the root user to use chattr command):
# chattr +i data.txt
#To remove i attribute, enter:
# chattr -i data.txt

#FILE-LOCK:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/file-lock.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
cd /opt/script/
chattr +i *.sh
chattr +i banner*
chattr +i /etc/group
chattr +i /etc/passwd
chattr +i /etc/profile
chattr +i /etc/shadow*
chattr +i /etc/iptables/rules.v4

chattr +i /etc/ssh/*
chattr +i /var/spool/cron/crontabs/root
chattr +i /etc/rc.local
chattr +i /etc/network/interfaces
chattr +i /etc/netplan/00-installer-config.yaml
chattr +i /etc/haproxy/*
chattr +i /etc/nginx/*
awk -F: '(\$3 == "0") {print}' /etc/passwd
echo "LOCKED!"
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END


#FILE-UNLOCK:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/file-unlock.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
cd /opt/script/
chattr -i *.sh
chattr -i banner*
chattr -i /etc/group
chattr -i /etc/passwd
chattr -i /etc/profile
chattr -i /etc/shadow*
chattr -i /etc/iptables/rules.v4

chattr -i /etc/ssh/*
chattr -i /var/spool/cron/crontabs/root
chattr -i /etc/rc.local
chattr -i /etc/network/interfaces
chattr -i /etc/netplan/00-installer-config.yaml
chattr -i /etc/haproxy/*
chattr -i /etc/nginx/*
awk -F: '(\$3 == "0") {print}' /etc/passwd
echo "LOCKED!"
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#HISTORY-CLEAR:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/history-clear.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
cd
/opt/script/file-unlock.sh
echo "" > .bash_history
history -c
/opt/script/file-lock.sh
history
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END





#ENABLE [systemctl enable rc-local.service]:
#__________[CONFIG]:BEGIN
FILE_NAME="/etc/rc.local"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#/opt/script/haproxy-restart.sh
#/opt/script/hostname-change.sh $HOSTNAME
/opt/script/samba-stop.sh
#######
exit 0
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#DISPLAY BOOT LOG FILE:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/bootlog.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
clear
echo "##########################################"
#journalctl -b0 SYSLOG_PID=1 | more
journalctl -b0 --system _COMM=systemd | more
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END


#UNIX SOCKET DISPLAY:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/unix-socket-display.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#ss -x -a | egrep "Netid|Address" | more
ss -x -a | egrep "Netid|php|fpm|sock"
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END


#FREE RAM PER HOUR:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/ram.clear.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
echo "#########################"
echo "CURRENT RAM FREE:"
free
echo ""
echo ""
echo "#########################"
echo "AFTER RAM FREE:"
free && sync && echo 3 > /proc/sys/vm/drop_caches && free
free
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#IOSTATS:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/ram.clear.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
iostat -mx 5
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END
#IOPS CALCULATE:
#INSTALL:
#{
mkdir -p /opt/setup
cd /opt/setup
yum install -y make gcc libaio-devel || ( /usr/bin/apt-get -y update && /usr/bin/apt-get install -y make gcc libaio-dev  </dev/null )
wget https://github.com/Crowd9/Benchmark/raw/master/fio-2.0.9.tar.gz ; tar xf fio*
cd fio-2.0.9;make;make install

cp fio /opt/script/fio.sh
ls -lh /opt/script/fio.sh
/bin/rm -rf fio*
/bin/rm -rf /opt/setup/fio*
#}
#SCRIPT: iops-harddisk.sh
#INTEL SSD 540S 240GB: READ iops=20132 | WRITE iops=6657 
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/iops-harddisk.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
now1="\$(date +'%Y.%m.%d-%H.%M.%S.%3N')"

#FILE_SIZE=1G
#FILE_SIZE=500M
FILE_SIZE=200M

LOG_FOLDER=/opt/log/iops-result
mkdir -p \$LOG_FOLDER

RESULT_LOG=\$LOG_FOLDER/iops-harddisk-\$FILE_SIZE-\$now1.log

HARD_DISK=/opt/test.data
#mkdir -p \$HARD_DISK
cat /dev/null > \$HARD_DISK
echo "###########################">> \$RESULT_LOG
date >> \$RESULT_LOG
echo $HARD_DISK >> \$RESULT_LOG
#fio.sh --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=\$HARD_DISK --bs=4k --iodepth=64 --size=\$FILE_SIZE --readwrite=randrw --rwmixread=75 >> \$RESULT_LOG
#/bin/rm -rf \$HARD_DISK
#date >> \$RESULT_LOG


/opt/script/fio.sh \
--randrepeat=1 \
--ioengine=libaio \
--direct=1 \
--gtod_reduce=1 \
--name=test \
--filename=$HARD_DISK \
--bs=4k \
--iodepth=64 \
--size=$FILE_SIZE \
--readwrite=randrw \
--rwmixread=75 >> \$RESULT_LOG

/bin/rm -rf \$HARD_DISK
date >> \$RESULT_LOG
cd \$LOG_FOLDER
echo \$RESULT_LOG
cat \$RESULT_LOG
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#SAMBA:
#/usr/bin/apt-get -y install samba cifs-utils smbclient
#/usr/bin/apt-get -y install --reinstall libsmbclient libsmbclient-dev libtevent0 libtalloc2
echo "/etc/init.d/nmbd restart"  > /opt/script/samba-restart.sh
echo "/etc/init.d/smbd restart" >> /opt/script/samba-restart.sh
echo "netstat-status.sh  | egrep 'PID|bd'" >> /opt/script/samba-restart.sh
chmod +x /opt/script/samba-restart.sh

echo "/etc/init.d/nmbd stop"  > /opt/script/samba-stop.sh
echo "/etc/init.d/smbd stop" >> /opt/script/samba-stop.sh
echo "netstat-status.sh  | egrep 'PID|bd'" >> /opt/script/samba-stop.sh
chmod +x /opt/script/samba-stop.sh

source /etc/profile
cd /etc/samba/
cp smb.conf smb.conf.bk
echo "" > smb.conf
#




mkdir -p /opt/script/
cd /opt/script/
#wget --no-check-certificate https://user:name@mirror.daivietgroup.net/paping/pingp.sh
#wget https://github.com/mgiay/linux.ubuntu.env/blob/master/pingp.sh
#wget --no-check-certificate https://github.com/mgiay/linux.ubuntu.env/raw/master/pingp/pingp.sh
wget --no-check-certificate https://raw.githubusercontent.com/mgiay/linux.ubuntu.env/master/pingp.sh
wget https://raw.githubusercontent.com/mgiay/linux.ubuntu.env/master/pingp/pingp2log.sh -O /opt/script/pingp2log.sh
#CHMOD SCRIPT TO 777:
#{
#
cd /opt/script/
chmod +x *.sh
#
#}






#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/network-SYNC_RECV-status.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
echo "###################################"
date;netstat -nat | awk '{print \$6}' | sort | uniq -c | sort -n;date;
echo "###################################"
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#LETSENCRYPT:
#__________[LETSENCRYPT]:BEGIN
# root@srv030temp:/opt/certbot# python --version
# Python 2.7.18

# root@srv030temp:/opt/certbot# python3 --version
# Python 3.8.5

#https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-programming-environment-on-an-ubuntu-20-04-server
sudo apt-get install -y python3-venv

sudo apt-get -y install python-is-python2
sudo apt-get -y install python3-dev-is-python2
#E: Package 'python3-virtualenv' has no installation candidate
sudo apt-get -y install python3-virtualenv
#sudo apt-get -y install certbot python3-certbot-apache

#{
# wget https://rhel6.iuscommunity.org/ius-release.rpmrpm -Uvh ius-release.rpm
# yum -y install epel-release
# yum -y --enablerepo=ius install git python27 python27-devel python27-pip python27-setuptools python27-virtualenv
# yum -y install git

sudo apt-get -y install git;git clone https://github.com/certbot/certbot /opt/certbot
#DEPRECATED: git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt



yum -y install tree bc p7zip  || ( sudo apt-get -y install tree bc p7zip-full </dev/null )
sudo apt-get -y install python3.8-venv
sudo apt-get -y install certbot

#E: Package 'python-virtualenv' has no installation candidate
#Package python-virtualenv is not available, but is referred to by another package.
#cd /opt/certbot;./letsencrypt-auto certonly --standalone

cd /opt/certbot; /usr/bin/certbot certonly --standalone
Enter email address (used for urgent renewal and security notices) (Enter 'c' to
cancel): tinhcx@gmail.com

Press: (A)gree/(C)ancel: A

Press: (Y)es/(N)o: Y

Press: c
#__________[LETSENCRYPT]:END



#COMPRESS TOOL:
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/7za-compress.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
#7za-compress.sh $1 $2
#$1: Filename compressed
#$2: Source want to compress
###################################CONTENT:BEGIN
###7za: COMPRESS: 7za a -mhe=on -p310212 <dest.7z> <src> > /dev/null
#       EXTRACT : 7za x -mhe=on -p310212 <dest.7z>       > /dev/null
        
PWD=310212

VAR1=\$1
VAR2=\$2

#7za a -mhe=on -p310212 <dest.7z> <src> > /dev/null
echo "###################################"
now1="\$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "COMPRESS STARTING: "\$now1
echo "..."

7za a -mhe=on -p\$PWD \$VAR1 \$VAR2 > /dev/null

now1="\$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "COMPRESS DONE    : "\$now1


echo "RESULT: " \$(pwd)
ls -lh \$VAR1
echo "###################################"
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END

#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/7za-decompress.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
#7za-compress.sh $1 $2
#$1: Filename compressed
#$2: Source want to compress
###################################CONTENT:BEGIN
###7za: COMPRESS: 7za a -mhe=on -p310212 <dest.7z> <src> > /dev/null
#       EXTRACT : 7za x -mhe=on -p310212 <dest.7z>       > /dev/null
        
PWD=310212
VAR1=\$1

echo "###############################"
now1="\$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "DECOMPRESS STARTING: "\$now1
echo "..."

7za x -mhe=on -p\$PWD \$VAR1 > /dev/null

now1="\$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "DECOMPRESS DONE    : "\$now1
echo "###################################"
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/haproxy_monitor_stats.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
# Check process HAProxy status every minute.
# * * * * * /opt/script/haproxy_monitor_stats.sh

netstat -ntlup | egrep "PID|LISTEN" | sort -t: -k2 -n | grep "0.0.0.0:80"
CHECK_HAPROXY_PROCESS=\$?
if [ \$CHECK_HAPROXY_PROCESS -eq 0 ]; then
    echo "HAProxy is still running. ^^";
else
    /opt/script/haproxy-restart.sh
fi
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END



#HAPROXY-2.2.6 + OpenSSL:
#ChangeLog: 2020/11/30 : 2.2.6
#http://www.haproxy.org/download/2.2/src/CHANGELOG
#__________[CONFIG]:BEGIN
header='\-d --header="User-Agent: Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36"';

mkdir -p /opt/setup/;cd /opt/setup/

mkdir -p /opt/openssl-1.1.1g
wget "$header" https://www.openssl.org/source/openssl-1.1.1g.tar.gz
tar -xf openssl-1.1.1g.tar.gz
cd openssl-1.1.1g
./config --prefix=/opt/openssl-1.1.1g --openssldir=/opt/openssl-1.1.1g '-Wl,-rpath,$(LIBRPATH)'
make;make test;make install


cd /opt/setup/
sudo apt-get -y update
sudo apt-get -y install git ca-certificates gcc libc6-dev liblua5.3-dev libpcre3-dev libssl-dev libsystemd-dev make wget zlib1g-dev
HAPROXY_VERSION="haproxy-2.2.6"
wget "$header" http://www.haproxy.org/download/2.2/src/$HAPROXY_VERSION.tar.gz
tar -xf $HAPROXY_VERSION.tar.gz
cd $HAPROXY_VERSION


make \
TARGET=linux-glibc \
USE_LUA=1 \
USE_OPENSSL=1 \
SSL_INC=/opt/openssl-1.1.1g/include \
SSL_LIB=/opt/openssl-1.1.1g/lib \
USE_PCRE=1 \
USE_ZLIB=1 \
USE_SYSTEMD=1 \
EXTRA_OBJS="contrib/prometheus-exporter/service-prometheus.o"

#
sudo make install-bin

#
sudo make install
#__________[CONFIG]:END



#GitHub Private Repository:


#LE:
#https://github.com/mgiay/linux.ubuntu.env
#https://github.com/mgiay/LinuxCore01
file-unlock.sh
#__________GitHub_Private_Global_Variable:BEGIN
TOKEN="9fc1ca9d94ba4cff33a2171a0ed23f08893bd5f0"
USER_NAME="mgiay"
REPO_NAME="LinuxCore01"
BRANCHE_NAME="master"
FOLDER_NAME="OPT_SCRIPT"

#__________DONWLOAD:BEGIN
FILE_NAME="le-renew-CERTBOT_ACME_v2.ini"
FILE_URL="https://raw.githubusercontent.com/$USER_NAME/$REPO_NAME/$BRANCHE_NAME/$FOLDER_NAME/$FILE_NAME"
cd /opt/script
curl -H "Authorization: token $TOKEN" $FILE_URL -o $FILE_NAME

FILE_NAME="le-renew-CERTBOT_ACME_v2.sh"
FILE_URL="https://raw.githubusercontent.com/$USER_NAME/$REPO_NAME/$BRANCHE_NAME/$FOLDER_NAME/$FILE_NAME"
cd /opt/script
curl -H "Authorization: token $TOKEN" $FILE_URL -o $FILE_NAME
#__________DONWLOAD:END
chmod  +x *.sh
#







#__________[CONFIG]:BEGIN
mkdir -p /etc/haproxy/certs/
FILE_NAME="/etc/haproxy/certs/ssl_expied_date.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
cd /etc/haproxy/certs/
######################
for var_temp in *.pem;
do
    echo "_________________________"
    echo 'SSL CERT: ' $var_temp:
    openssl x509 -noout -dates -in \$var_temp

done
echo "_________________________"
echo "#########################"
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END

#__________[CONFIG]:BEGIN
FILE_NAME="/etc/haproxy/certs/ssl_remove_old_certs.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
mkdir -p /etc/haproxy/certs/; 
      cd /etc/haproxy/certs/
######################
mkdir bk;
mv *-bk-* bk
ls -lh
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END




#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/ps-kill-process-name.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#C1: sh ps-kill-process-name.sh "<processname>"
#C2: sh ps-kill-process-name.sh "<ps1|ps2|..|psn>"
#ex: sh ps-kill-process-name.sh "haproxy|pure|mysqld|redis|nginx|php|netdata"
###################################
var1=$1
ps aux | egrep $var1 | awk '{print $2}' | xargs kill -9
ps aux | egrep $var1
###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END





#__________[CONFIG]:BEGIN
FILE_NAME="/opt/script/template.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
chattr -i -f $FILE_NAME
cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#
#
#

###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END





sudo apt-get -y purge cloud*
systemctl disable --now apt-daily{,-upgrade}.{timer,service}


source /etc/profile; file-unlock.sh; history -c; history-clear.sh; file-unlock.sh;
#service ssh restart;service netfilter-persistent restart;netstat-status.sh;fwstatus.sh;source /etc/profile;file-unlock.sh ;history -c;history-clear.sh;file-unlock.sh; ospoweroff.sh;

#service ssh restart;service netfilter-persistent restart;netstat-status.sh;fwstatus.sh;source /etc/profile;file-unlock.sh ;history -c;history-clear.sh;file-unlock.sh; osreboot.sh




#CHMOD SCRIPT TO 777:
SCRIPT_LOC="/opt/script"
mkdir -p $SCRIPT_LOC
cd $SCRIPT_LOC
chattr -i $SCRIPT_LOC/*
chmod +x *.sh
chattr +i $SCRIPT_LOC/*


