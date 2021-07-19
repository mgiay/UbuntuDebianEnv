#memcached-port-info.sh <PORT>
#REF: https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-memcached-on-ubuntu-18-04
VAR=$1
#memcstat --servers=0.0.0.0:$VAR1 | more

a=$(memcached-tool 127.0.0.1:$VAR stats | grep 'limit_maxbytes'| awk '{print $2}')
echo "Memcached [Port->$VAR] (bytes):  $a"; 
