#!/bin/bash
#################################
#LastUpdate: #17:39 2021.11.29
#################################
mkdir -p /opt/temp/;cd /opt/temp/
wget  https://raw.githubusercontent.com/gdbtek/linux-cookbooks/master/libraries/util.bash -O util.bash
chmod +x  util.bash

source /opt/temp/util.bash

echo "Username:EncrypedPwd:UserID:GroupID:FullName:HomePath:Shell" > /opt/temp/pwd.txt
cat /etc/passwd  >> /opt/temp/pwd.txt

printTable ':' "$(cat /opt/temp/pwd.txt)"




#THE_END
