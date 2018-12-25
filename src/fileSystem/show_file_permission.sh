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

# source:
# https://askubuntu.com/questions/152001/how-can-i-get-octal-file-permissions-from-command-line
# this is also useful:
# https://stackoverflow.com/questions/30992072/how-do-i-check-whether-a-file-or-file-directory-exist-in-bash
# the result is the same on Linux and on Mac
# this is the most portable implementation

# meaning of 1777 and 1755 
# https://unix.stackexchange.com/questions/213324/meaning-of-chmod-1775
get_perm_pl() {
	[[ -f ${1} || -d ${1} ]] &&\
    perl -e 'printf "%04o\n", (stat)[2] & 07777, $_ for @ARGV' ${1} 
}

test_get_perm() {
	echo /tmp
    echo $( get_perm /tmp && get_perm_pl /tmp )
	
	echo read only file
	local f=/tmp/__readonly && touch ${f} && chmod 400 ${f} && \
        echo $( get_perm ${f} && get_perm_pl ${f} ) && rm -f ${f}
    
	echo /dev
	echo $( get_perm /dev && get_perm_pl /dev )	

    # throws an error on non existing file 
    ( echo -n "stat-version  " && get_perm /etc/_default )
    ( echo -n "perl-version  " && get_perm_pl /etc/_default; echo $? )
	
	echo /
    echo $( get_perm / && get_perm_pl / )
}

test_get_perm

