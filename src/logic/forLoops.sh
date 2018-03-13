#!/usr/bin/env bash
# showing two methods of finding the (missing) file resources that
# had caused server faults and the number of faults caused by each 
# resource

function doubleGrep() {
    for line in $( grep -i "file does not exist" ../_testdata/error_log | awk '{print $13}' | sort | uniq )
    do
        printf "missing file: %s, " $line
        printf "num hit: %s\n" $( grep $line ../_testdata/error_log | wc -l  )
    done
}

function useAwkArray() {
    grep -i "file does not exist" ../_testdata/error_log |\
    awk '
{
    arr[$13] += 1
}
END {
    for (filePath in arr) {
        printf "missing file: %s, num hit: %d\n", filePath, arr[filePath]
    }
}
' | sort
}

function run() {
    doubleGrep
    printf  "***********\n"
    useAwkArray
}

run

