#!/usr/bin/env bash

# Notes:

# this receipe comes in handy when I want to measure (roughly) the 
# amount of time and memory spent on splitting a large file to parts 
# then reassembling the parts back;

# see iGetYourImg project

# just found out that I could group timer -v command args into a sub
# shell:

# ( /usr/bin/time -v cat ./profile_split_cat.sh > /tmp/wning/dump ) | sort

# redirecting the output from this shell will have no ambiguity

setUp() {
    TEMPDIR=/tmp/wning/sut
    rm -rf ${TEMPDIR}
    mkdir -p ${TEMPDIR}
}

show_profiling() {
    local prof=${1:?"missing filename"}
    sort ${prof} | perl -lne \
        '(/Elapsed.+?([\S]+)$/ && print $1) || (/Maximum.+?([\S]+)$/ && print $1)'
}

redirect_to_file() {
    echo "//// redirect to file"
    local binfile=${TEMPDIR}/image.bin
    local parts=${TEMPDIR}/part_
    local TIMER=/usr/bin/time
    local outfile=${TEMPDIR}/image.out.bin
    local prof=${TEMPDIR}/assemble.prof
    dd if=/dev/urandom of=${binfile} bs=1M count=1 2>/dev/null
    /usr/bin/time -v split -b 128K ${binfile} ${parts} 2>${prof}
    /usr/bin/time -v cat ${parts}* 1>${outfile} 2>>${prof}
    if ! ( diff ${binfile} ${outfile} )
    then
        echo "files are different: ${binfile} - ${outfile}"
        exit 1
    fi
    show_profiling ${prof}
}

group_by_subshell() {
    echo "//// group by subshell"
    ( /usr/bin/time -v cat /usr/bin/time >${TEMPDIR}/dump.bin ) 2>&1 |\
        perl -lne \
        '(/Elapsed.+?([\S]+$)/ && print $1) || (/Maximum.+?([\S]+$)/ && print $1)'
}

setUp
redirect_to_file
group_by_subshell

