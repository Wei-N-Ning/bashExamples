#!/usr/bin/env bash

# note:
# man signal
# sigaction is recommended over signal
# see also:
# networkFoo/csockets/tests//chapter1
# howToVerify.sh

function runReceiver() {
    python -c "from __future__ import print_function
import signal, time
class State(object):
    to_exit = False
    @classmethod
    def set(cls, *args, **kwargs):
        cls.to_exit = True
signal.signal(signal.SIGUSR1, State.set)
while not State.to_exit:
    time.sleep(0.5)
print('DOOOOM')
" &
}

# $1: pid of receiver process
function runSender() {
    echo ${1}
    kill -s USR1 ${1}
}

runReceiver
pid_=${!}
sleep 0.1
runSender ${pid_}
wait

