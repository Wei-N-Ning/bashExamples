#!/bin/bash
# test the return code from the previous process

echoExitStatus() {
    ls "/tmp/aa"
    echo $?
}


runAll() {
    echoExitStatus
}


runAll
