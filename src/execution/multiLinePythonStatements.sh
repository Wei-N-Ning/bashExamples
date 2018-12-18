#!/usr/bin/env bash

call_python_heredoc() {
   python <<"EOF"
print("-------------")
import this
import sys

EOF
}

call_python_heredoc
