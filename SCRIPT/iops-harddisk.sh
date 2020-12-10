#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: /opt/script/iops-harddisk.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.10-12.09.10.299
###################################
# mkdir -p /opt/setup; cd /opt/setup
# sudo apt-get -y update && /usr/bin/apt-get install -y make gcc libaio-dev fio  </dev/null
# wget https://github.com/Crowd9/Benchmark/raw/master/fio-2.0.9.tar.gz ; tar xf fio*
# cd fio-2.0.9;make;make install

# cp fio /opt/script/fio.sh
# ls -lh /opt/script/fio.sh
#REF: https://dotlayer.com/how-to-use-fio-to-measure-disk-performance-in-linux/
###################################CONTENT:BEGIN
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"

#FILE_SIZE=1G
#FILE_SIZE=500M
FILE_SIZE=200M

LOG_FOLDER=/opt/log/iops-result
mkdir -p $LOG_FOLDER

HARD_DISK=/opt/test.data
#mkdir -p $HARD_DISK

RESULT_LOG=$LOG_FOLDER/iops-harddisk-[$FILE_SIZE]-[$now1].log

cat /dev/null > $HARD_DISK
echo "###########################">> $RESULT_LOG
date  >> $RESULT_LOG
echo  >> $RESULT_LOG
echo "COMMAND1: fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=$HARD_DISK --bs=4k --iodepth=64 --size=$FILE_SIZE --readwrite=randrw --rwmixread=75" >> $RESULT_LOG
fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=$HARD_DISK --bs=4k --iodepth=64 --size=$FILE_SIZE --readwrite=randrw --rwmixread=75 >> $RESULT_LOG



echo "###########################" >> $RESULT_LOG
echo "COMMAND2: /opt/script/fio.sh --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=$HARD_DISK --bs=4k --iodepth=64 --size=$FILE_SIZE --readwrite=randrw --rwmixread=75" >> $RESULT_LOG
/opt/script/fio.sh --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=$HARD_DISK --bs=4k --iodepth=64 --size=$FILE_SIZE --readwrite=randrw --rwmixread=75 >> $RESULT_LOG

cd /opt/
/bin/rm -rf $HARD_DISK
date >> $RESULT_LOG
cd $LOG_FOLDER
echo $RESULT_LOG
cat $RESULT_LOG
###################################CONTENT:END
#THE-END