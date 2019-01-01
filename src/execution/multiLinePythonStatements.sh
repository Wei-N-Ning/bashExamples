#!/usr/bin/env bash

# recall:
# < to pass a file handle
# << to pass a heredoc
# <<< to pass a string
# to the command/process on the left

# recall:
# the purpose of "-"
# how to pass arguments while using heredoc program

call_python_heredoc() {
   python - $@ <<"EOF"
import sys

class ZenOfPython(object):
    def __init__(self):
        print('------------')
        import this

if __name__ == '__main__':
  print(sys.argv[1:])
  ZenOfPython()

EOF
}

call_python_heredoc "foo" "bar"
