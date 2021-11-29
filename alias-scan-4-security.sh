#!/bin/bash
#/opt/script/alias-scan-4-security.sh
########################################################
#LastUpdate: #11:20 2021.11.29
########################################################
TEMP="/opt/temp"; mkdir -p $TEMP;cd $TEMP

ALIAS_RESULT="$TEMP/alias-scan-4-security.result.txt"

cat /dev/null > $ALIAS_RESULT

#1/ SCAN "/etc/profile"
echo "SCAN [/etc/profile]"  >> $ALIAS_RESULT 2>&1
cat /etc/profile|grep alias >> $ALIAS_RESULT 2>&1
echo "" >> $ALIAS_RESULT 2>&1
echo "" >> $ALIAS_RESULT 2>&1
echo "" >> $ALIAS_RESULT 2>&1



#2/ SCAN "/home/<username>/.profile
HOME_FOLDER="/home";cd $HOME_FOLDER
for FOLDERS in $( ls -ld */ | awk '{ print $9}' );\
do    
    USER_FOLDER=$HOME_FOLDER/$FOLDERS
    cd $USER_FOLDER
    echo "SCAN [$USER_FOLDER]"  >> $ALIAS_RESULT 2>&1
    cat .profile|grep alias     >> $ALIAS_RESULT 2>&1    
done

echo "SECURITY RISK RESULT:"
cat --number $ALIAS_RESULT | egrep "rm|unlink|shred|delete|mv|cp|null|reboot|poweroff|exec|kill|ps"

#THE_END
