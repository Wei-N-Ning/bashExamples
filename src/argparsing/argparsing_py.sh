#!/usr/bin/env bash

#https://docs.python.org/2/howto/argparse.html

parse_arg() {
    python - $@ <<"EOF"
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("square", type=int,
                    help="display a square of a given number")
parser.add_argument("-v", "--verbose", action="store_true",
                    help="increase output verbosity")
args = parser.parse_args()
print(args.__dict__)
EOF
}

arguments="$( parse_arg $@ )"
echo "${arguments[@]}"

