#!/usr/bin/env bash

: '
pipefail     the return value of a pipeline is the status of
                           the last command to exit with a non-zero status,
                           or zero if no command exited with a non-zero status
'

# good article:
# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

# set -euxo pipefail

set -eo pipefail

to_fail() {
    ls /tmp | wc -l | nont | cat
    echo ${ret} $?
}

to_fail
