#!/usr/bin/env bash

# taking stdin
pretty_print() {
  python <(cat <<"EOF"
import json
import sys
from pprint import pprint as pp
pp(json.loads(sys.stdin.read()))
EOF
)
}

pretty_print
