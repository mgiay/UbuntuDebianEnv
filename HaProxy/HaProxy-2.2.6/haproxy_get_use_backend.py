#!/usr/bin/python
#haproxy_get_use_backend.py
#LastUpdate: #17:41 2018.07.24
###############################
#cat /etc/haproxy/haproxy_get_use_backend.py | grep LastUpdate

#Syntax:
#./haproxy_get_use_backend.py haproxy_03_LETSENCRYPT.cfg.vhost
###############################
import sys, getopt

#with open('/etc/haproxy/haproxy_03_LETSENCRYPT.cfg.vhost', 'r') as f:

with open(sys.argv[1], 'r') as f:
    content = f.readlines()
    
# Remove character \n \r
content = [x.strip() for x in content]
flag="unknown"
 
for index, text in enumerate(content):
    if '##__________BACKEND_URL:BEGIN' in text:
        flag="true"
        continue
 
    if '##__________BACKEND_URL:END' in text:
        flag="false"
        print " "
        continue
 
    if flag == "true":
        print text

#THE-END