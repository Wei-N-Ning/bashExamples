#!/usr/bin/env bash

# source
# https://unix.stackexchange.com/questions/132102/communication-between-multiple-processes

# /////// keyword: multiplexing ////////

# usage:
# this program controls a child Python program by issuing it commands 
# in integers

mkdir -p /tmp/sut
cat >/tmp/sut/worker.py <<"EOF"
#!/usr/bin/env python
import sys, os

def step(arg):
    print('executing: {}'.format(arg))

for l in sys.stdin:
    l = l.strip()
    if l == 'END':
        sys.exit(0)
    step(int(l))
EOF
chmod 777 /tmp/sut/worker.py

child_fd=
for (( i=0; i<5; i++ )); do
    exec {fd}> >( /tmp/sut/worker.py )
    child_fd=( ${fd} )
done

while IFS= read -r line; do
    printf -- '%s\n' "${line}" >&$fd
    if [[ ${line} == "END" ]]
    then
        wait
        exit 0
    fi
done

