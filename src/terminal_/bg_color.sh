#!/usr/bin/env bash

# source
# minimal perl P272/304

# $1: text
print_with_highlight() {
    echo "`tput smso`${1}`tput rmso`"
}

main() {
    local msg=$( cat <<"EOF"
gcc -o app main.c
chmod u+x app
app
EOF
)
    print_with_highlight "${msg}"
}

main
