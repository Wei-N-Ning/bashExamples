#!/usr/bin/env bash

# source
# http://wiki.linuxquestions.org/wiki/Embed_a_zip_file_into_an_image

TEMPDIR=/tmp/sut

tearDown() {
    rm -rf ${TEMPDIR} /tmp/_ /tmp/_.* /tmp/__*
}

setUp() {
    tearDown
    mkdir -p ${TEMPDIR}
}

SUT_FILENAME=${TEMPDIR}/sut.bin
ZIP_FILENAME=${TEMPDIR}/sut.zip
createSUT() {
    dd \
        if=/dev/urandom \
        of=${SUT_FILENAME} \
        bs=1024x1024 \
        count=8
    ( cd ${TEMPDIR} && \
    zip sut.zip sut.bin )
}

OUT_FILENAME=${TEMPDIR}/out.png
createEmbeddedZip() {
    cat ./image.png ${ZIP_FILENAME} >> ${OUT_FILENAME}
}

verify() {
    mkdir ${TEMPDIR}/output
    unzip -p ${OUT_FILENAME} >${TEMPDIR}/output/orig.bin
    md5sum ${SUT_FILENAME} ${TEMPDIR}/output/orig.bin

    cat <<EOF

resulting file is a legit png imge file

to test:

eog ${OUT_FILENAME}

EOF
}

setUp
createSUT
createEmbeddedZip
verify
