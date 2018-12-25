#!/usr/bin/env bash

run_python_program() {
    (  python -c \
"import sys;
def process(l):  return l.upper();
it = (process(l) for l in sys.stdin.readlines());
[sys.stdout.write(l) for l in it]" ) <<"EOF"
asd
there is 
a cow, with
name Sir.Woodhead
EOF
}

run_python_program
