#!/usr/bin/env bash

# see: https://stackoverflow.com/questions/4778635/merging-png-images-into-one-pdf-file
# https://askubuntu.com/questions/207447/how-to-reduce-the-size-of-a-pdf-file/626301#626301
function createFromJPGs() {
    local outFile=/tmp/_.pdf
    convert ../../_testdata/sourceImage* ${outFile}
    if [ ! -f ${outFile} ]
    then
        echo "fail to create pdf"
        exit 1
    fi
    echo ${outFile}
}

# $1: source pdf file path
# $2: output pdf file path
function doPDFShrink() {
    local inFile=${1:?missing input file path!}
    local outFile=${2:?missing output file path!}
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default \
    -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages \
    -dCompressFonts=true -r150 -sOutputFile=${outFile} ${inFile}
    if [ ! -f ${outFile} ]
    then
        echo  "fail to shrink pdf"
        exit 1
    fi
}

inFile=$( createFromJPGs )
doPDFShrink ${inFile} "/tmp/test.pdf"

