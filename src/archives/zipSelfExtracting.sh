#!/usr/bin/env bash

# source
# the main inspiration is the installer of bazel, take a look at its content in vim
#
# here is a project that promotes this technique to the public domain:
# https://github.com/megastep/makeself
# https://makeself.io/

# NOTE:
# however the tar-based self-extracting installer requires a step to pipe the binary blob to the tar program
# https://www.linuxjournal.com/content/add-binary-payload-your-shell-scripts
# https://www.linuxjournal.com/node/1005818
# https://stackoverflow.com/questions/955460/how-do-linux-binary-installers-bin-sh-work
# https://stackoverflow.com/questions/20758981/self-extracting-script-in-sh-shell

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

INST_FILENAME=${TEMPDIR}/installer.sh
createInstaller() {
    cat >${INST_FILENAME} <<"EOF"
#!/usr/bin/env bash
set -e
dest=/tmp/sut/output
mkdir ${dest}
cd ${dest} && unzip ${0} -d ${dest}

exit 0
######## the end ########
EOF
    cat ${ZIP_FILENAME} >> ${INST_FILENAME}
    chmod a+x ${INST_FILENAME}
}

verify() {
    ${INST_FILENAME}
    md5sum ${SUT_FILENAME} ${TEMPDIR}/output/sut.bin
}

setUp
createSUT
createInstaller
verify
