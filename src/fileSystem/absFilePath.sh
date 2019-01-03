#!/usr/bin/env bash

setUp() {
    set -e
    rm -rf /tmp/sut /tmp/_ /tmp/_.* /tmp/__*
    mkdir /tmp/sut
}

set -euo pipefail
if (! type "realpath" 2>/dev/null)
then
realpath() {
    python - "${1}" <<"EOF"
import os
import sys
print(os.path.realpath(sys.argv[1]))
EOF
}
fi

runTests() {
    local dir=/tmp/sut/a/b/c/d
    mkdir -p ${dir}
    cd ${dir}
    touch a.out
    echo $( realpath a.out )
}

setUp
runTests
