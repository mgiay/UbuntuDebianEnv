#!/bin/bash
###################################
#FILE_NAME: /opt/script/history-clear.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.44.06.376
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
