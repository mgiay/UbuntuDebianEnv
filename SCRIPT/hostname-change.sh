#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: /opt/script/hostname-change.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-09.39.28.715
###################################
###################################CONTENT:BEGIN
HOST_NAME=
hostnamectl set-hostname  --static
echo "127.0.0.1 " >> /etc/hosts
###################################CONTENT:END
#THE-END
