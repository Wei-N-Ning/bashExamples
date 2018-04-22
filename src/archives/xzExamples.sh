#!/usr/bin/env bash
# use linux xz utility (xz-utils)

# original post:
# https://www.rootusers.com/13-simple-xz-examples/
# xz is another general purpose data compression tool with syntax 
# similar to the older and more popular gzip and bzip2 options. 
# With xz we will typically get a better compression ratio.

# xz -f: to override existing file
# xz -k: to (k)eep the original file
# xz -d: decompress
function compressSingleFile() {
    local sut="/tmp/_"
    local sutDup="/tmp/__"
    local sutOut=${sut}.xz
    dd if=/dev/zero of=${sut} bs=1K count=1K 2>/dev/null
    cp ${sut} ${sutDup}
    
    # compare before/after
    ls -l ${sut}
    xz -f ${sut}
    ls -l ${sutOut}
            
    # inspect the archive
    xz -l ${sutOut}
    
    # test integrity 
    # to view the CRC data: xz -lvv 
    xz -tv ${sutOut}
    
    # turn on multithreading
    xz -f --threads=0 ${sutDup}
    
    # the new file looks identical to the original one
    echo "i" > ${sut}
    xz -f -d ${sutOut}
    ls -l ${sut}
}

function compressMultipleFilesSeparately() {
    local basePath="/tmp/_"
    local onePath=""
    local xzArgs=""
    declare -a filePaths
    for i in $( seq 1 5 )
    do
        onePath=${basePath}${i}
        dd if=/dev/zero of=${onePath} bs=1K count=1K 2>/dev/null
        filePaths[i]=${onePath}
        xzArgs="${xzArgs} ${onePath}"
    done
    xz -f ${xzArgs}
}

function run() {
    compressSingleFile
    compressMultipleFilesSeparately
}

run
