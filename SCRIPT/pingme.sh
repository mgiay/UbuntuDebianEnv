#!/bin/bash
###################################
#FILE_NAME: /opt/script/pingme.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-09.39.39.130
###################################
###################################CONTENT:BEGIN
name=$1
ping $name | while read pong; do echo "[$(date +'%Y.%m.%d-%H.%M.%S.%3N')][$pong]"; done | nl
###################################CONTENT:END
#THE-END
