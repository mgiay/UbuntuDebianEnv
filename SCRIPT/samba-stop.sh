/etc/init.d/nmbd stop
/etc/init.d/smbd stop
netstat-status.sh  | egrep 'PID|bd'
