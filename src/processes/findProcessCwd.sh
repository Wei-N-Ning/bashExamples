#!/usr/bin/env bash

# source
# https://www.cyberciti.biz/faq/what-process-has-open-linux-port/


runTests() {
    for proc in $( pgrep java )
    do
        # method 1
        ls -l /proc/${proc}/cwd

        # method 2
        pwdx ${proc}
    done
}

runTests