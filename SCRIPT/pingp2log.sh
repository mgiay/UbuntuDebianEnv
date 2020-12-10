#/opt/script/pingp2log.sh
#LastUpdate: #12:50 2020.10.27
###########################################################
#cat /opt/script/pingp2log.sh | grep LastUpdate
#Usage: pingp2log.sh <IP|Domain> <TCP Port>
###########################################################
HOST_IP=$1
HOST_PORT=$2
###########################################################
CURRENT_YEAR=$(date +'%Y')
CURRENT_MONTH=$(date +'%m')
CURRENT_DATE=$(date +'%d')

Turning_Domain=$HOST_IP-$HOST_PORT
Turning_Result="/opt/log/Turning/$Turning_Domain"
mkdir -p $Turning_Result;cd $Turning_Result

Turning_Log="$Turning_Result/$Turning_Domain-$CURRENT_YEAR$CURRENT_MONTH$CURRENT_DATE.log"
pingp.sh $HOST_IP -p $HOST_PORT --nocolor \
| xargs -n1 -i bash -c 'echo "$(date +'%Y.%m.%d-%H:%M:%S')" "| {}"' >> \
$Turning_Log \
2>&1

########
#THE_END
########
