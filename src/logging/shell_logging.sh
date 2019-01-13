#!/usr/bin/env bash 

error() {
    echo "$(date '+[%H:%M:%S]') ERROR:" $@
}

DIE='eval error die at ${BASH_SOURCE[0]}:$LINENO'

main() {
    error test failed
}

# implement a perl-like die "function"
demo_die() {
    ${DIE}
}

main
