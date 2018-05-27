#!/usr/bin/env bash

# source: 
# http://wiki.bash-hackers.org/scripting/processtree
# If you group commands by enclosing them in parentheses, 
# these commands are run inside a subshell

sh -c 'echo $$'; sh -c 'echo $$' >/tmp/test
echo "----"
# only written one pid
cat /tmp/test

(sh -c 'echo $$'; sh -c 'echo $$') >/tmp/test
echo "----"
# written two pids
cat /tmp/test
