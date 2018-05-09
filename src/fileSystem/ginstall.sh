#!/usr/bin/env bash

# wkou uses $(GINSTALL) variable to invoke install program

function setUp() {
    rm -rf /tmp/package
    mkdir /tmp/package
}

function buildSUTProgram() {
    cat > /tmp/_.c <<EOF
#include <stdio.h>
void main(void) {
    printf("called");
}
EOF
    gcc -o /tmp/_ /tmp/_.c
}

function modifyArtifactDirectory() {
    local sut="/tmp/sut"
    rm -rf ${sut}
    mkdir ${sut}
    chmod 777 ${sut}
    echo -n $( stat -c %a ${sut} )
    install -d -m u=rw,g=,o= ${sut}
    echo -n $( stat -c %a ${sut} )
}

function copyArtifactToDest() {
    local sut="/tmp/sut"
    rm -rf ${sut}
    mkdir ${sut}
    ls /tmp/package
    gcc -o ${sut}/artifact /tmp/_.c
    install ${sut}/artifact /tmp/package
    ls /tmp/package
}

function copyArtifactDirectoryToDest() {
    local sut="/tmp/sut"
    rm -rf ${sut}
    mkdir ${sut}
    ls -R ${sut}
    gcc -o /tmp/prog /tmp/_.c
    install -D /tmp/prog /tmp/sut/package/bin
    ls -R ${sut}
}

function tearDown() {
    rm -rf /tmp/package
}

setUp
buildSUTProgram
modifyArtifactDirectory
copyArtifactToDest
copyArtifactDirectoryToDest
tearDown
