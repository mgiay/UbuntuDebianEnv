#!/bin/bash
#/opt/script/listing-all-command-4-user.sh
########################################################
#LastUpdate: #11:20 2021.11.29
########################################################
#wget https://raw.githubusercontent.com/mgiay/UbuntuDebianEnv/main/listing-all-command-4-user.sh -O listing-all-command-4-user.sh
########################################################
TEMP="/opt/temp"; mkdir -p $TEMP;cd $TEMP

ALIAS_RESULT="$TEMP/listing-all-command-4-user.sh.result.txt"

cat /dev/null > $ALIAS_RESULT


echo "########################################################" >> $ALIAS_RESULT 2>&1
echo "compgen -a:"                                              >> $ALIAS_RESULT 2>&1
compgen -a >> $ALIAS_RESULT 2>&1 # will list all the aliases you could run.


echo "########################################################" >> $ALIAS_RESULT 2>&1
echo "compgen -b:"                                              >> $ALIAS_RESULT 2>&1
compgen -b >> $ALIAS_RESULT 2>&1 # will list all the built-ins you could run.

echo "########################################################" >> $ALIAS_RESULT 2>&1
echo "compgen -k:"                                              >> $ALIAS_RESULT 2>&1
compgen -k >> $ALIAS_RESULT 2>&1 # will list all the keywords you could run.


echo "########################################################" >> $ALIAS_RESULT 2>&1
echo "compgen -A function:"                                     >> $ALIAS_RESULT 2>&1
compgen -A function       >> $ALIAS_RESULT 2>&1 # will list all the functions you could run.


echo "########################################################" >> $ALIAS_RESULT 2>&1
echo "compgen -A function -abck:"                               >> $ALIAS_RESULT 2>&1
compgen -A function -abck >> $ALIAS_RESULT 2>&1 # will list all the above in one go.

echo "ALIAS_RESULT: $ALIAS_RESULT"


echo "SECURITY RISK RESULT: $ALIAS_RESULT"
cat --number $ALIAS_RESULT | egrep "rm|unlink|shred|delete|mv|cp|null|reboot|poweroff|exec|kill|ps" | sort -k 2

#THE_END

