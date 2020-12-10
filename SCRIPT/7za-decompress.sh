#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: /opt/script/7za-decompress.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.10-08.44.28.954
###################################
#7za-compress.sh  
#: Filename compressed
#: Source want to compress
###################################CONTENT:BEGIN
###7za: COMPRESS: 7za a -mhe=on -p310212 <dest.7z> <src> > /dev/null
#       EXTRACT : 7za x -mhe=on -p310212 <dest.7z>       > /dev/null
        
PWD=310212
VAR1=$1

echo "###############################"
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "DECOMPRESS STARTING: "$now1
echo "..."

7za x -mhe=on -p$PWD $VAR1 > /dev/null

now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "DECOMPRESS DONE    : "$now1
echo "###################################"
###################################CONTENT:END
#THE-END
