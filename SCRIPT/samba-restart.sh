/etc/init.d/nmbd restart
/etc/init.d/smbd restart
netstat-status.sh  | egrep 'PID|bd'
