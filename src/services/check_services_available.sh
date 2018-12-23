#!/usr/bin/env bash

# source
# https://www.youtube.com/watch?v=l0QGLMwR-lY

# deliberately typo here
systemctl status docker11 1>/dev/null 2>&1
echo $?

# note on Redhat variants, I may have to use service:
service httpd status
service httpd enable 

# use chkconfig on Redhat variants to start this service and keep
# it long running 
chkconfig enable httpd

