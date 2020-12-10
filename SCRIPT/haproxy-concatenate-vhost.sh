#haproxy-concatenate-vhost.sh
#LastUpdate: #14:09 2018.10.01, #15:15 2018.07.25
#################################
source /etc/haproxy/HAPROXY_VERSION.txt
HAPROXY_HOME="/opt/setup/haproxy-2.2.6"
HAPROXY_CONFIG_LOC="/etc/haproxy"
#################################
FILE_VIRTUAL_HOST=*.cfg.vhost
FILE_RESULT=haproxy_02_http.cfg


mkdir -p $HAPROXY_CONFIG_LOC/{bk,certs,errors,script,template,vhost}
cd $HAPROXY_CONFIG_LOC

#BACKUP OLD CONFIG FILE: haproxy_02_http.cfg
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "BACKUP OLD CONFIG FILE TO [$HAPROXY_CONFIG_LOC/bk/]: "
echo "ORIGIN FILE: ["$(ls -l $FILE_RESULT)"]"

yes | cp -vR $FILE_RESULT bk/$FILE_RESULT-$now1

echo ""

#OVERWRITE:
cat /dev/null > $FILE_RESULT


#LOAD "FRONTEND" from TEMPLATE: haproxy_02_http.cfg.temp
cat $HAPROXY_CONFIG_LOC/template/haproxy_02_http.cfg.temp >> $FILE_RESULT


#haproxy_get_acl_url.py
echo "" >> $FILE_RESULT
now1="$(date +'%Y.%m.%d-%H.%M.%S.%3N')"
echo "#Last Concatenate Update Config: " $now1 >> $FILE_RESULT
for var_file_name in vhost/$FILE_VIRTUAL_HOST;
do 
    echo "#"$var_file_name >> $FILE_RESULT
done
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT




echo "#1: ACL:" >> $FILE_RESULT
FILE_SCRIPT_PY=$HAPROXY_HOME/haproxy_get_acl_url.py
echo "GETTING ACL_URL     : " $FILE_SCRIPT_PY
sleep 2
for var_file_name in vhost/$FILE_VIRTUAL_HOST;
do 
    python $FILE_SCRIPT_PY $var_file_name >> $FILE_RESULT
done




#haproxy_get_backend_url.py
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "#2: USE_BACKEND:" >> $FILE_RESULT

FILE_SCRIPT_PY=$HAPROXY_HOME/haproxy_get_backend_url.py
echo "GETTING BACKEND_URL : " $FILE_SCRIPT_PY
sleep 2
for var_file_name in vhost/$FILE_VIRTUAL_HOST;
do 
    python $FILE_SCRIPT_PY $var_file_name >> $FILE_RESULT
done




#haproxy_get_use_backend.py
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "#3: BACKEND:" >> $FILE_RESULT

FILE_SCRIPT_PY=$HAPROXY_HOME/haproxy_get_use_backend.py
echo "GETTING USE_BACKEND : " $FILE_SCRIPT_PY
sleep 2
for var_file_name in vhost/$FILE_VIRTUAL_HOST;
do 
    python $FILE_SCRIPT_PY $var_file_name >> $FILE_RESULT
done



echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "" >> $FILE_RESULT
echo "#THE-END" >> $FILE_RESULT
#
echo ""
echo "CONCATENATE [DONE]."
echo "NEW FILE: ["$(ls -l $FILE_RESULT)"]"
echo "#HAPROXY: haproxy-stop.sh | haproxy-restart.sh | haproxy-reload.sh | haproxy-checkconfig.sh"

#THE-END

