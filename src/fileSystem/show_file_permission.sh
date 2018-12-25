#!/usr/bin/env bash

# source:
# https://askubuntu.com/questions/152001/how-can-i-get-octal-file-permissions-from-command-line

# NOTE:
# stat works differently on Darwin and Linux
# Darwin:
# stat -f "%A" sut
# Linux:
# stat -c "%a" sut

# $1: filename
# return: file permission in octal
get_perm() {
    local filename=${1:?"missing filename!"}
    if [[ "$( uname )" == "Linux" ]]
    then
        stat -c "%a" ${filename}
    else
        stat -f "%A" ${filename}
    fi
}

test_get_perm() {
    get_perm /tmp
    local f=/tmp/__readonly && touch ${f} && chmod 400 ${f} && \
        get_perm ${f} && rm ${f}
    get_perm /dev

    # throws an error on non existing file 
    ( get_perm /etc/_default )
    
    get_perm /
}

test_get_perm

