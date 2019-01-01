#!/bin/bash

# see pro bash programming, P2

# THOUGHT:
# I can use this technique to check the existence of certain GNU-only
# tools
# but it's better to not have to worry about platform specific tools ,
# e.g. use python/perl or even busybox
function run() {
    if (! type "unknown" >/dev/null 2>&1)
    then
        echo "name unknown is free to use"
    fi

    if (type "echo" >/dev/null 2>&1)
    then
        echo "name echo is in use"
    fi
}

if (! type "realpath" >/dev/null 2>&1)
then
realpath() {
local filename=${1:?"missing filename"}
python - ${filename} <<"EOF"
import os
import sys
print(os.path.realpath(sys.argv[1]))
EOF
}
fi

run
realpath "asd"
