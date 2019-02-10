#!/usr/bin/env bash

# note: using process to implement this interlock model appears to be 
# troublesome
#
# see proc_step_control.sh for multiplexing example

PYTHON=/usr/bin/python

mkdir -p /tmp/sut

cat >/tmp/sut/worker.py <<"EOF"
import time
import os
import sys
import signal

# init
time.sleep(0.00001)

sys.stdout.write('ready\n')
sys.stdout.flush()

# task 1
time.sleep(1.1)

sys.stdout.write('task 1 done\n')
sys.stdout.flush()

os.kill(os.getpid(), signal.SIGSTOP)
EOF

coproc { ${PYTHON} /tmp/sut/worker.py; }

# coprocess status: init, potentially task 1
sleep 1
IFS= read -ru "${COPROC[0]}" x; printf '1: %s\n' "${x}"

# coprocess status: task 1, potentially reach the end of life
sleep 2
IFS= read -ru "${COPROC[0]}" x; printf '2: %s\n' "${x}"

echo "teardown done"

# the end

