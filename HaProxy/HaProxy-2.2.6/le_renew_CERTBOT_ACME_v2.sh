#!/bin/bash
#/etc/haproxy/script/le_renew_[YourDomainName.com].sh
#LastUpdate: #10:00 2020.01.16
##############################################
#UBUNTU: /var/spool/cron/crontabs/root
#CENTOS: /var/spool/cron/root
##############################################
#*     *     *   *    *      command to be executed         
#-     -     -   -    -                                       
#|     |     |   |    |                                       
#|     |     |   |    +----- day of week (MON-1|TUE-2|WED-3|THU-4|FRI-5|SAT-6|SUN-0)
#|     |     |   +------- month (1-12)                    
#|     |     +--------- day of month (1-31)
#|     +----------- hour (0-23)                    
#+------------- min (0-59)
##############################################
#RENEW SSL CERT: T5-13h00, weekly:
#00 13 * * 4 /etc/haproxy/script/le_renew_[YourDomainName.com].sh >> /opt/log/le_renew_[YourDomainName.com].sh/le_renew_[YourDomainName.com].sh-"$(date +'%Y.%m.%d-%H.%M.%S.%6N')".log 2>&1
##############################################
# #PACKAGE="a b c"
PACKAGE="tree bc p7zip git"
yum -y install $PACKAGE  || ( apt-get -y install $PACKAGE </dev/null )
git clone https://github.com/certbot/certbot /opt/certbot
##############################################
cat /dev/null > /var/log/letsencrypt/letsencrypt.log
#***************************************
#A/____________________LE_GLOBAL_VAR:BEGIN
#======================================
LE__SH_FILE_NAME="le_renew_[YourDomainName.com].sh"
LE_INI_FILE_NAME="le_renew_[YourDomainName.com].ini"
#======================================
now1="$(date +'%Y.%m.%d-%H.%M.%S.%6N')"

LE_RENEW_LOG_LOCATION=/opt/log/$LE__SH_FILE_NAME
mkdir -p $LE_RENEW_LOG_LOCATION

LE_BACKUP_LOCATION=/opt/bk/le_ha
mkdir -p $LE_BACKUP_LOCATION

HAPROXY_CERT_LOC=/etc/haproxy/certs
WEB_SERVICE='haproxy'
LE_INI_CONFIG_FILE_NAME="/etc/haproxy/script/$LE_INI_FILE_NAME"
CERTBOT_LOC='/opt/certbot'

fuser -k 54321/tcp
HTTP_01_PORT='54321'

DOMAIN_NAME=`grep "^\s*domains" $LE_INI_CONFIG_FILE_NAME | sed "s/^\s*domains\s*=\s*//" | sed 's/(\s*)\|,.*$//'`
SSL_CERT_COMBINED_FILE="$HAPROXY_CERT_LOC/${DOMAIN_NAME}.pem"
SSL_CERT_EXPIRATION_DATE=90;

#Concatenation of cert.pem and chain.pem:
#Public Key: cert.pem
#Certificate Chain: chain.pem
SSL_CERT_FULLCHAIN="/etc/letsencrypt/live/$DOMAIN_NAME/fullchain.pem"

#Private Key:
SSL_CERT_PRIVATEKEY="/etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem"
#A/____________________LE_GLOBAL_VAR:END
#***************************************


#B/__________CHECK_EXP_[DOMAIN_NAME:$DOMAIN_NAME]:BEGIN
exp=$(date -d "`openssl x509 -in $SSL_CERT_FULLCHAIN -text -noout|grep "Not After"|cut -c 25-`" +%s)
DATE_NOW=$(date -d "now" +%s)
days_exp=$(echo \( $exp - $DATE_NOW \) / 86400 |bc)
echo "----------------------------------------------------"
echo "BEFORE: THOI HAN SU DUNG SSL CERT: [$days_exp] NGAY"
echo "----------------------------------------------------"
echo ""
sleep 5
#B/__________CHECK_EXP_[DOMAIN_NAME:$DOMAIN_NAME]:END



#C/__________BackupCurrent_"HAPROXY"_"LETSENCRYPT":BEGIN
cd $LE_BACKUP_LOCATION
#BACKUP : 7za a -mhe=on -p310212 letsencrypt-$now1.7z /etc/letsencrypt
#RESTORE: 7za x -mhe=on -p310212 letsencrypt-$now1.7z; cp -vR letsencrypt-$now1 /etc/
7za a -mhe=on -p310212 letsencrypt_ETC-$now1.7z /etc/letsencrypt  > /opt/bk/7za.null.log
7za a -mhe=on -p310212 haproxy_ETC-$now1.7z     /etc/haproxy      > /opt/bk/7za.null.log
7za a -mhe=on -p310212 certbot_OPT-$now1.7z     /opt/certbot      > /opt/bk/7za.null.log
#C/__________BackupCurrent_"HAPROXY"_"LETSENCRYPT":END


#D/__________BackupCurrent_SSLCERT_BeforeGetNewCERT:BEGIN
cd $HAPROXY_CERT_LOC/
cp -vR $DOMAIN_NAME.pem $DOMAIN_NAME.pem-bk-$(date +'%Y.%m.%d-%H.%M.%S.%3N')
#D/__________BackupCurrent_SSLCERT_BeforeGetNewCERT:END



#E/__________CHECK_[LE_INI_CONFIG_FILE_NAME:$LE_INI_CONFIG_FILE_NAME]:BEGIN
if [ ! -f $LE_INI_CONFIG_FILE_NAME ]; then
    echo "[ERROR] config file does not exist: [$LE_INI_CONFIG_FILE_NAME]"
    echo ""
    echo ""
    sleep 5
    exit 1;
fi
#E/__________CHECK_[LE_INI_CONFIG_FILE_NAME:$LE_INI_CONFIG_FILE_NAME]:END




#F/__________CHECK_[SSL_CERT_FULLCHAIN:$SSL_CERT_FULLCHAIN]:BEGIN
if [ ! -f $SSL_CERT_FULLCHAIN ]; then
    echo "[ERROR] certificate file not found for domain [$DOMAIN_NAME]."
    echo ""
    echo ""
    sleep 5
fi
#F/__________CHECK_[SSL_CERT_FULLCHAIN:$SSL_CERT_FULLCHAIN]:END



#G/__________CHECK_EXP_[DOMAIN_NAME:$DOMAIN_NAME]:BEGIN
exp=$(date -d "`openssl x509 -in $SSL_CERT_FULLCHAIN -text -noout|grep "Not After"|cut -c 25-`" +%s)
DATE_NOW=$(date -d "now" +%s)
days_exp=$(echo \( $exp - $DATE_NOW \) / 86400 |bc)
echo "Checking expiration date for [$DOMAIN_NAME]..."
echo ""
echo ""
sleep 5
#G/__________CHECK_EXP_[DOMAIN_NAME:$DOMAIN_NAME]:END



#H/__________SSL_CERT_TOO_OLD,RENEW:BEGIN
if [ "$days_exp" -gt "$SSL_CERT_EXPIRATION_DATE" ]; then
    echo "The certificate is up to date, no need for renewal ($days_exp days left)."
    echo ""
    echo ""
    sleep 5
    exit 0;
else
    echo "The certificate for [$DOMAIN_NAME] is about to expire soon. Starting Let's Encrypt (HAProxy:$HTTP_01_PORT) renewal script..."    
    echo "###########"
    echo "CERTBOT COMMAND RENEW:"
    echo "$CERTBOT_LOC/letsencrypt-auto certonly --standalone --preferred-challenges=http --non-interactive --agree-tos --renew-by-default --config $LE_INI_CONFIG_FILE_NAME --http-01-port $HTTP_01_PORT"
    echo "###########"
    
    $CERTBOT_LOC/letsencrypt-auto certonly --standalone --preferred-challenges=http --non-interactive --agree-tos --renew-by-default --config $LE_INI_CONFIG_FILE_NAME --http-01-port $HTTP_01_PORT
    #--non-interactive
    #Saving debug log to /var/log/letsencrypt/letsencrypt.log

    echo "Creating [$SSL_CERT_COMBINED_FILE] with latest certs..."
    sleep 5    
    sudo bash -c "cat /etc/letsencrypt/live/$DOMAIN_NAME/fullchain.pem /etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem > $SSL_CERT_COMBINED_FILE"

    # echo "----------------------------------------------------"
    # echo "CREATED SSL CERT:"
    # echo "----------------------------------------------------"
    # ls -lh /etc/letsencrypt/live/$DOMAIN_NAME
    # echo "----------------------------------------------------"
    # sleep 5

    exp=$(date -d "`openssl x509 -in $SSL_CERT_FULLCHAIN -text -noout|grep "Not After"|cut -c 25-`" +%s)
    DATE_NOW=$(date -d "now" +%s)
    days_exp=$(echo \( $exp - $DATE_NOW \) / 86400 |bc)
    echo "----------------------------------------------------"
    echo "AFTER: THOI HAN SU DUNG SSL CERT: [$days_exp] NGAY"
    echo "----------------------------------------------------"
    sleep 5

    ls -l $HAPROXY_CERT_LOC/$DOMAIN_NAME*
    
    
    #RESTART HAPROXY:
    #/etc/haproxy/script/haproxy-restart.sh
    #/etc/haproxy/script/haproxy-reload.sh
    
    
    echo "########################"
    echo "Renewal process finished for domain [$DOMAIN_NAME]"
    
    #Display expired date of new CERT:    
    echo "==================================================="
    echo "VALIDATE TIME OF SSL CERT [$SSL_CERT_COMBINED_FILE] :"
    openssl x509 -noout -dates -in $SSL_CERT_COMBINED_FILE
    echo "==================================================="
    echo ""

    exit 0;
fi
#H/__________SSL_CERT_TOO_OLD,RENEW:END


cp -v /var/log/letsencrypt/letsencrypt.log $LE_RENEW_LOG_LOCATION/letsencrypt-$now1.log
########
#THE-END
########

#REF:

#https://certbot.eff.org/docs/using.html

#/etc/haproxy
#├── bk
#├── certs
#│   └── <DOMAIN_NAME>.pem
#│   └── bk
#├── crtlist.txt
#├── errors
#├── script
#├── template
#└── vhost
#    └── bk

##############################################
#*     *     *   *    *      command to be executed         
#-     -     -   -    -                                       
#|     |     |   |    |                                       
#|     |     |   |    +----- day of week (MON-1|TUE-2|WED-3|THU-4|FRI-5|SAT-6|SUN-0)
#|     |     |   +------- month (1-12)                    
#|     |     +--------- day of month (1-31)
#|     +----------- hour (0-23)                    
#+------------- min (0-59)
##############################################

####7za: COMPRESS: 7za a -mhe=on -p310212 <dest.7z> <src>
#        EXTRACT : 7za x -mhe=on -p310212 <dest.7z>
###HAPROXY:  haproxy-stop.sh | haproxy-restart.sh | haproxy-reload.sh | haproxy-checkconfig.sh
#    haproxy-checkversion.sh | haproxy-concatenate-vhost.sh
#HAPROXY_BIN_FILE="/opt/setup/haproxy-1.8.12/haproxy"
#HAPROXY_CONFIG_FILE="/etc/haproxy/haproxy.cfg"
#HAPROXY_PID_FILE="/var/run/haproxy.pid"
#####################################
# wget https://rhel6.iuscommunity.org/ius-release.rpmrpm -Uvh ius-release.rpm
# yum -y install epel-release
# yum -y --enablerepo=ius install git python27 python27-devel python27-pip python27-setuptools python27-virtualenv
# yum -y install git

#apt-get -y install git;
#git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
#git clone https://github.com/certbot/certbot /opt/certbot

#cd /opt/letsencrypt;./letsencrypt-auto certonly --standalone
#yum -y install tree bc p7zip  || ( apt-get -y install tree bc p7zip-full </dev/null )

