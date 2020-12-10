#!/usr/bin/python
#haproxy_get_backend_url.py
#LastUpdate: #17:40 2018.07.24
###############################
#cat /etc/haproxy/haproxy_get_backend_url.py | grep LastUpdate

#Syntax:
#./haproxy_get_backend_url.py haproxy_03_LETSENCRYPT.cfg.vhost
###############################
import sys, getopt

#with open('/etc/haproxy/haproxy_03_LETSENCRYPT.cfg.vhost', 'r') as f:

with open(sys.argv[1], 'r') as f:
    content = f.readlines()
    
# Remove character \n \r
content = [x.strip() for x in content]
flag="unknown"
 
for index, text in enumerate(content):
    if '##__________USE_BACKEND_URL:BEGIN' in text:
        flag="true"
        continue
 
    if '##__________USE_BACKEND_URL:END' in text:
        flag="false"
        print " "
        continue
 
    if flag == "true":
        print text

#THE-END