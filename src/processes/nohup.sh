#!/usr/bin/env bash

# source:
# read from Terraform up and running,
# see also:
# https://en.wikipedia.org/wiki/Nohup

# nohup: to prevent the process from terminating when the 
# calling user logs out 

experiment() {
    # log into a U18 vm (I used vagrant + vbox)

    # do
    set -e
    ( mkdir ~/work && 
        cd ~/work &&
        echo "there is a cow" >index.html )
    cd ~/work
    nohup busybox httpd -f -p 8080 &

    # log out
    exit 

    # log in back again, search for busybox
    ps aux | grep -i busy

    # it is still running

    # busybox implements httpd interface!
}
