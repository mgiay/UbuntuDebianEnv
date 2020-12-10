#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: /opt/script/7za-compress.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.10-08.44.28.140
###################################
#7za-compress.sh  
#: Filename compressed
#: Source want to compress
###################################CONTENT:BEGIN
###7za: COMPRESS: 7za a -mhe=on -p310212 <dest.7z> <src> > /dev/null
#       EXTRACT : 7za x -mhe=on -p310212 <dest.7z>       > /dev/null
        
PWD=310212

VAR1=$1
VAR2=$2

#7za a -mhe=on -p310212 <dest.7z> <src> > /dev/null
echo "###################################"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "COMPRESS STARTING: "$now1
echo "..."

7za a -mhe=on -p$PWD $VAR1 $VAR2 > /dev/null

now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "COMPRESS DONE    : "$now1


echo "RESULT: " $(pwd)
ls -lh $VAR1
echo "###################################"
###################################CONTENT:END
#THE-END
