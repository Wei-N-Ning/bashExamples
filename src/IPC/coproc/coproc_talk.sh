#!/usr/bin/bash

# source:
# http://wiki.bash-hackers.org/syntax/keywords/coproc

redirections() {
    coproc { ls /tmp; read; } 2>&1
    IFS= read -ru ${COPROC[0]} x; printf '%s\n' "${x}"
}

redirections
