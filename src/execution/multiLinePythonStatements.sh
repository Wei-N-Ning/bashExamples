#!/usr/bin/env bash

# recall:
# < to pass a file handle
# << to pass a heredoc
# <<< to pass a string
# to the command/process on the left

# recall:
# the purpose of "-"
# how to pass arguments while using heredoc program

python_heredoc_with_args() {
   python - $@ <<"EOF"
import sys

class ZenOfPython(object):
    def __init__(self):
        print('------------')

if __name__ == '__main__':
  print(sys.argv[1:])
  ZenOfPython()

EOF
}

# read:
# https://stackoverflow.com/questions/17097642/how-to-insert-an-inline-heredoc-maybe-python-script-into-a-bash-stdin-stdout
# Now the script is read from /dev/fd/<filehandle>, so stdin can be used by the echo's pipe.
python_heredoc_with_stdin() {
  ls -l "${HOME}" | python <(cat <<"EOF"
import sys
for idx, line in enumerate(sys.stdin):
  sys.stdout.write(line)
  if idx > 5:
    break
EOF
)

  # this further illustrates this scenario:
  # python <filehandle> - 
  # the <filehandle> part is implemented as a pipe from 
  # a subshell;
  # the - part is taking stdin, which is fed by a heredoc
  python <(cat <<"EOF"
import sys

class EchoApp(object):
  @staticmethod
  def run():
    sys.stdout.write(sys.stdin.read())

EchoApp.run()
EOF
) - <<"EOF"
there is
a cow,
Sir. Woodhead,
who lives with
his 33 guards.
EOF

}

python_heredoc_with_args "foo" "bar"
python_heredoc_with_stdin
