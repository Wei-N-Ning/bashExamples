#!/usr/bin/env bash

# source:
# https://askubuntu.com/questions/152001/how-can-i-get-octal-file-permissions-from-command-line

# NOTE:
# stat works differently on Darwin and Linux
# Darwin:
# stat -f "%A" sut
# Linux:
# stat -c "%a" sut
get_perm() {
    :
}
