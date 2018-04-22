#!/usr/bin/env bash

function setUp() {
    sutDir="/tmp/gun"
    mkdir ${sutDir}
    echo 'ak47' > "${sutDir}/name"
    mkdir "${sutDir}/magzine"
    echo '7.62mm' > "${sutDir}/magzine/size"
    mkdir "${sutDir}/optics"
    echo '3.4x' > "${sutDir}/optics/name"
    
    outDir="/tmp/out"
    mkdir ${outDir}
}

function tearDown() {
    rm -rf ${sutDir} ${outDir}
}

function compressDirectory() {
    local _pwd=$( pwd )
    cd /tmp
    tar cJvf "${outDir}/archive.xz" gun
    ls -l ${outDir}/archive.xz
    cd ${_pwd}
}

function decompressDirectory() {
    tar xaf "${outDir}/archive.xz" -C ${outDir}
    tree "${outDir}"
}

setUp
compressDirectory
decompressDirectory
tearDown
