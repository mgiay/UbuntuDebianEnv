#memcached-port-info.sh <PORT>
#REF: https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-memcached-on-ubuntu-18-04
VAR=$1
/usr/bin/memcstat --servers=0.0.0.0:$VAR | more
