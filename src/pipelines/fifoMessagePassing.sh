#!/usr/bin/env bash

_fifo=/tmp/test.pipe

function _free() {
    rm -f $_fifo
}

function _init() {
    mkfifo $_fifo
}

function messageServer() {
    /usr/bin/env python -c "
import time
f = open('/tmp/test.pipe', 'r')
print 'server is connected to pipe'
dead = False
while not dead:
    for m in f.read().split('\n'):
        if m == 'dead':
            dead = True
            break
        print m
    time.sleep(0.25)
print 'server is dead'
" &
}

function main() {
    _free
    _init
    
    messageServer

    # init
    echo " " > /tmp/test.pipe
    
    for l in $( ls /tmp ) 
    do
        echo $l > /tmp/test.pipe
    done
    
    # shutdown
    echo "dead" > /tmp/test.pipe  
}

main
_free
