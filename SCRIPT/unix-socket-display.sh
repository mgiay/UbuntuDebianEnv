#!/bin/bash
#!/bin/sh -e
###################################
#FILE_NAME: /opt/script/unix-socket-display.sh
#Author: qwerty | tinhcx@gmail.com
#LastUpdate: #2020.12.09-17.44.13.536
###################################
###################################CONTENT:BEGIN
#ss -x -a | egrep "Netid|Address" | more
ss -x -a | egrep "Netid|php|fpm|sock"
###################################CONTENT:END
#THE-END
