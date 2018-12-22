#!/usr/bin/env bash

# source
# https://robots.thoughtbot.com/sed-102-replace-in-place

create_text() {
    cat >/tmp/foo <<"EOF"
there is
there is a
there is a cow
EOF
}

do_inplace() {
    sed -i '' s/there/it/g /tmp/foo
    cat /tmp/foo
}

create_text
do_inplace
