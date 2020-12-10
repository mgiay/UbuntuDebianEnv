#!/bin/bash
###################################
#FILE_NAME: /opt/script/schedule-per-1s.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.42.56.648
###################################
###################################CONTENT:BEGIN
#http://serverfault.com/questions/246044/how-can-i-schedule-a-cron-job-that-runs-every-10-seconds-in-linux
#
i=0
while [ $i -lt 60 ]; do
  /opt/script/get-date-1s.sh &
  sleep 1
  i=$(( i + 1 ))
done
###################################CONTENT:END
#THE-END
