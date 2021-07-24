#ubuntu20-packages.sh
#LastUpdate: #12:49 2020.10.30
#######################################
sudo apt-get -y --ignore-missing install \
net-tools \
ccache \
nload \
ntp \
ntpdate \
ntp-doc \
nano \
wget \
tree \
telnet \
htop \
haproxy \
keepalived \
p7zip-full \
inetutils-traceroute \
mtr \
sysstat \
ifupdown \
psmisc \
geoip-bin \
fping \
python-dev \
byobu \
screen \
tmux
#
#######################################






#Enable 'nano editor' with line number for user 'root':
LINUX_USERNAME="root"
echo "set linenumbers" > /$LINUX_USERNAME/.nanorc

mkdir -p /opt/{script,setup}
cd /opt/setup
cat /dev/null > ubuntu20-packages.sh










mkdir -p /opt/setup/
cd /opt/setup/
#__________[CONFIG]:BEGIN
FILE_NAME="/opt/setup/ubuntu20-packages.sh"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
#chattr -i -f $FILE_NAME
#cp -v $FILE_NAME $FILE_NAME-[$now1].bk
cat <<EOF > $FILE_NAME
#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: $FILE_NAME
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #$now1
###################################
###################################CONTENT:BEGIN
#####################################
#ubuntu20-packages.sh
#LastUpdate: #12:33 2020.10.30
#####################################

#You can verify these fields by installing debconf-utils and searching for iptables values:
#apt -y install debconf-utils

sudo /usr/bin/apt-get -y install build-essential git
#
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get -y update
sudo apt-get -y install git
git --version
#sleep 15
#git version 2.29.0


echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
sudo apt-get -y install iptables-persistent
sudo debconf-get-selections | grep iptables
#

sudo apt-get -y update
#

sudo apt-get -y upgrade
#


sudo apt-get -y --ignore-missing install \
ccache \
apt-show-versions \
autoconf \
autoconf-archive \
autogen \
automake \
bc \
build-essential \
byobu \
cifs-utils \
curl \
fping \
gcc \
geoip-bin \
git \
haproxy \
htop \
ifupdown \
inetutils-traceroute \
jq \
keepalived \
libauthen-pam-perl \
libio-pty-perl \
libmnl-dev \
libnet-ssleay-perl \
libpam-runtime \
libsmbclient \
libsmbclient-dev \
libtalloc2 \
libtevent0 \
make \
mtr \
nano \
nload \
nodejs \
ntp \
ntpdate \
ntp-doc \
openssl \
p7zip-full \
perl \
pkg-config \
psmisc \
python \
python-dev \
#python-matplotlib \
python-numpy \
#python-pip \
#python-virtualenv \
samba \
screen \
smbclient \
sysstat \
#sysv-rc-conf \
telnet \
tree \
uuid-dev \
wget \
zlib1g-dev
#

###################################CONTENT:END
#THE-END
EOF
cat $FILE_NAME
#chattr +i -f $FILE_NAME
echo "FILE_NAME: $FILE_NAME"; echo ""
#__________[CONFIG]:END

