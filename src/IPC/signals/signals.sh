#!/usr/bin/env bash

# note:
# man signal
# sigaction is recommended over signal
# see also:
# networkFoo/csockets/tests//chapter1
# howToVerify.sh

# the signal handler receives the following args:
# (10, <frame at 0x7f4ca92fa800, file '<string>', line 8, code <module>>)
# {}

function runReceiver() {
    python -c "from __future__ import print_function
import signal, time, sys
def at_user_signal(*args, **kwargs):
    print('user signal caught\n{}\n{}'.format(args, kwargs))
    sys.exit(0)
signal.signal(signal.SIGUSR1, at_user_signal)
while True:
    time.sleep(0.5)
" &
}

# $1: pid of receiver process
function runSender() {
    echo ${1}
    kill -s USR1 ${1}
}

runReceiver
pid_=${!}
sleep 0.2
runSender ${pid_}
wait

