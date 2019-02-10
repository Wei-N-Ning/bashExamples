#!/usr/bin/env bash

# source
# https://unix.stackexchange.com/questions/132102/communication-between-multiple-processes

# /////// keyword: multiplexing ////////

# usage:
# this program spawns five children that "echo" the characters sent 
# to them

manager() {
    while IFS= read -r line; do
        echo "manager[$1:$BASHPID]: $line"
    done
}

mkdir -p /tmp/sut
cat >/tmp/sut/worker.py <<"EOF"
#!/usr/bin/env python
import sys, os
for l in sys.stdin:
    if l.startswith('END'):
        sys.exit(0)
    print('worker({}): {}'.format(os.getpid(), l))
EOF
chmod 777 /tmp/sut/worker.py

fds=()
for (( i=0; i<5; i++ )); do

    # original example
    # exec {fd}> >(manager $i)

    exec {fd}> >( /tmp/sut/worker.py )

    fds+=( $fd )
done

while IFS= read -r line; do
    echo "master: $line"
    for fd in "${fds[@]}"; do
        printf -- '%s\n' "$line" >&$fd
    done
    if [[ ${line} == "END" ]]
    then
        wait
        exit 0
    fi
done

