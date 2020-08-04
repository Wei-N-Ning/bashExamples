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
print('server is connected to pipe')
dead = False
num_lines = 0
while not dead:
    for m in f.read().split('\n'):
        if m == 'dead':
            dead = True
            break
        num_lines += 1
    time.sleep(0.25)
print('line count: {}, server is down'.format(num_lines))
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
