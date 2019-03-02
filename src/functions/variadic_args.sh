#!/usr/bin/env bash

output_dollar_at() {
    for a in $@
    do
        printf "<%s>" ${a}
    done
    echo

    for a in "$@"
    do
        printf "<%s>" ${a}
    done
    echo
}

output_asterisk() {
    for a in $*
    do
        printf "[%s]" ${a}
    done
    echo

    for a in "$*"
    do
        printf "[%s]" ${a}
    done
    echo
}

output_dollar_at 1 2 '3 4'
output_asterisk 1 2 '3 4'
