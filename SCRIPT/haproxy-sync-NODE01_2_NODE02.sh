#FILE_NAME=/opt/script/haproxy-sync-NODE01_2_NODE02.sh
#LastUpdate: #14:09 2018.10.01, #10:31 2018.09.29
#################################################
#FILE_NAME=/opt/script/haproxy-sync-NODE01_2_NODE02.sh
#HA_VHOST=/opt/script
#cat $HA_VHOST/$FILE_NAME | grep LastUpdate
#################################################

#__________________________________CONTENT:BEGIN
HA1=india_node01
HA2=india_node02

#HA1=PSQL_NODE01
#HA2=PSQL_NODE02

#SYNC HAPROXY CONFIG: [$HA1]->[$HA2]:
ssh -p 65022 root@$HA2 'cd /opt/bk;7za a -mhe=on -p310212 haproxy_ETC-$HA2-$(date +'%Y.%m.%d-%H.%M.%S.%3N').7z /etc/haproxy'


#rsync -avz -e "ssh -p 65022" /etc/haproxy/haproxy.cfg root@srv185:/etc/haproxy/haproxy.cfg


rsync -avz -e "ssh -p 65022" /etc/haproxy/script                root@$HA2:/etc/haproxy/
rsync -avz -e "ssh -p 65022" /etc/haproxy/template              root@$HA2:/etc/haproxy/
rsync -avz -e "ssh -p 65022" /etc/haproxy/vhost                 root@$HA2:/etc/haproxy/
rsync -avz -e "ssh -p 65022" /etc/haproxy/*.lst                 root@$HA2:/etc/haproxy/
rsync -avz -e "ssh -p 65022" /etc/haproxy/HAPROXY_VERSION.txt   root@$HA2:/etc/haproxy/

rsync -avz -e "ssh -p 65022" /etc/haproxy/*.cfg                 root@$HA2:/etc/haproxy/
rsync -avz -e "ssh -p 65022" /etc/haproxy/*.tcp                 root@$HA2:/etc/haproxy/


# echo ""
# echo ""
# echo ""
# echo "APPROVED NEW HAPROXY CONFIG ON [$$HA2]"
#sleep 5
#ssh -p 65022 root@$HA2 "/opt/script/haproxy.restart-srv185.sh"
#__________________________________CONTENT:END

#THE-END


