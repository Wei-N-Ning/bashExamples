#!/usr/bin/bash

PYTHON=/usr/bin/python

mkdir -p /tmp/sut

cat >/tmp/sut/worker.py <<"EOF"
import time
import sys

# init
time.sleep(0.00001)

sys.stdout.write('ready\n')
sys.stdout.flush()

# task 1
time.sleep(1.1)

sys.stdout.write('task 1 done\n')
sys.stdout.flush()

sys.stdin.read()
EOF

coproc { ${PYTHON} /tmp/sut/worker.py; }

# coprocess status: init, potentially task 1
sleep 1
IFS= read -ru ${COPROC[0]} x; printf '%s\n' "${x}"

# coprocess status: task 1, potentially reach the end of life
sleep 2
IFS= read -ru ${COPROC[0]} x; printf '%s\n' "${x}"

# free coprocess; let it exits normally
echo a >&${COPROC[1]}

# ensure coprocess has exited
wait

# the end

