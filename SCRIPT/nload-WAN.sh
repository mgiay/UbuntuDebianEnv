#!/bin/bash
###################################
#FILE_NAME: /opt/script/nload-WAN.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-09.40.00.103
###################################
###################################CONTENT:BEGIN
ETHERNET_WAN="enp1s0f0"
nload $ETHERNET_WAN -t 3000 -i 10000 -o 50000
###################################CONTENT:END
#THE-END
