#!/bin/bash
###################################
#FILE_NAME: /opt/script/log-truncate.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-09.39.46.311
###################################
###################################CONTENT:BEGIN
echo "" > /var/log/syslog
echo "" > /var/log/messages

#find /var/log -type f -exec bash -c 'cat /dev/null > bash' {} \;
LOC=/var/log/
for item in $(find $LOC -type f -name '*.*' ) ; 
    do cat /dev/null > $item ;
done


LOC=/var/mail/
for item in $(find $LOC -type f -name '*.*' ) ; 
    do cat /dev/null > $item ;
done


LOC=/var/spool/postfix/incoming
for item in $(find $LOC -type f -name '*.*' ) ; 
    do cat /dev/null > $item ;
done


LOC=/var/spool/postfix/active
for item in $(find $LOC -type f -name '*.*' ) ; 
    do cat /dev/null > $item ;
done


LOC=/var/spool/postfix/deferred
for item in $(find $LOC -type f -name '*.*' ) ; 
    do cat /dev/null > $item ;
done


LOC=/var/spool/postfix/maildrop
for item in $(find $LOC -type f -name '*.*' ) ; 
    do cat /dev/null > $item ;
done
###################################CONTENT:END
#THE-END
