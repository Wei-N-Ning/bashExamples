#!/usr/bin/env bash

#https://docs.python.org/2/howto/argparse.html

parse_arg() {
    local -A arguments
    local result
    local exitcode
    result=$(python - "$@" <<"EOF"
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("square", type=int,
                    help="display a square of a given number")
parser.add_argument("-v", "--verbose", action="store_true",
                    help="increase output verbosity")
args = parser.parse_args()

s = 'arguments=( '
s += ' '.join(
    ["[{}]='{}'".format(k, v) for k, v in args.__dict__.items()]
)
s += ' )'
print(s)
EOF
)
    exitcode="$?"
    if [[ "${exitcode}" == '0' ]]; then
        if ! (perl -wnl -E '/^arguments=/ or exit 1' <<<"${result}"); then
            echo "${result}" # print help message and quit
            exit 0
        fi
        eval "${result}"
        for k in "${!arguments[@]}"; do
            echo "${k}=${arguments[${k}]}"
        done
    else
        echo "failed to parse arguments"
        exit ${exitcode}
    fi
}

parse_arg "$@"
