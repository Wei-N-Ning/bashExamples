#!/usr/bin/env bash

setUp() {
    set -e
    rm -rf /tmp/sut /tmp/_ /tmp/_.* /tmp/__*
    mkdir /tmp/sut
    echo -n "thereisacow" >/tmp/sut/infile
}

# source
# Learning Perl L2395
# the program (cat)'s input should be read from
# infile and the output should go outfile
# as long as the program blindly reads its
# input from STDIN, processes it, and blindly
# writes its output to STDOUT, this will
# work just fine
inAndOut() {
    cat </tmp/sut/infile >/tmp/sut/outfile
    md5sum /tmp/sut/infile /tmp/sut/outfile
}

setUp
inAndOut
