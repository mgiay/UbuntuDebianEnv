#!/bin/bash
##############################################
#/opt/script/memcached-creating-port-VAR.sh
#LastUpdate: #15:47 2021.07.16
#memcached-creating-port-VAR.sh 11221 2gb
#memcached-creating-port-VAR.sh 11222 4gb
##############################################
VAR1_PORT=$1
VAR2_RAM=$2
##############################################

fuser -k $VAR1_PORT/tcp
USER="memcache"
LISTEN="0.0.0.0"

#PORT="11221"
PORT=$VAR1_PORT

#CACHESIZE="8gb"
#CACHESIZE="200mb"
CACHESIZE=$VAR2_RAM

MAXCONN="10240"
OPTIONS=""
BIN_FILE="/usr/bin/memcached"
PID_FILE="/var/run/memcached/memcached_$PORT.pid"
$BIN_FILE -m $CACHESIZE -p $PORT -u $USER -l $LISTEN -P $PID_FILE -d
memcached-port-mem_VAR.sh  $PORT
