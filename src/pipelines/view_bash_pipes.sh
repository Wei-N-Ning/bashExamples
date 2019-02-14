#!/usr/bin/env bash

# source
# illustrated tutorial of redirection
# https://wiki.bash-hackers.org/howto/redirection_tutorial

view_bash_pipes() {
pgrep bash
# 747
# 9749
BASHPID=9749
lsof +f g -ap $BASHPID -d 0,1,2
# COMMAND  PID USER   FD   TYPE FILE-FLAG DEVICE SIZE/OFF NODE NAME
# bash    7362 wein    0u   CHR    R,W;SH   16,2  0t30647  701 /dev/ttys002
# bash    7362 wein    1u   CHR    R,W;SH   16,2  0t30647  701 /dev/ttys002
# bash    7362 wein    2u   CHR    R,W;SH   16,2  0t30647  701 /dev/ttys002

# /dev/ttys002 -> pseudo terminal
# to be inheritted by commands and subshells

}

redirect_to_file() {
(sleep 60; echo "asd";) >/var/tmp/out &
# [1] 10386
lsof +f g -ap 10386 -d 0,1,2
# COMMAND   PID USER   FD   TYPE FILE-FLAG DEVICE SIZE/OFF    NODE NAME
# bash    10386 wein    0u   CHR    R,W;SH   16,2  0t33560     701 /dev/ttys002
# bash    10386 wein    1w   REG      W;SH    1,4        0 9231648 /private/var/tmp/out
# bash    10386 wein    2u   CHR    R,W;SH   16,2  0t33560     701 /dev/ttys002

# notice stdout (fd 1) is redirected to /private/var/tmp/out
# characters written to stdout (fd 1) end up in the file

}

open_new_descriptor() {
# write
(sleep 60; echo "asd";) 3>/var/tmp/out &
# [1] 10415
lsof +f g -ap 10415 -d 0,1,2,3
# COMMAND   PID USER   FD   TYPE FILE-FLAG DEVICE SIZE/OFF    NODE NAME
# bash    10415 wein    0u   CHR    R,W;SH   16,2  0t43786     701 /dev/ttys002
# bash    10415 wein    1u   CHR    R,W;SH   16,2  0t43786     701 /dev/ttys002
# bash    10415 wein    2u   CHR    R,W;SH   16,2  0t43786     701 /dev/ttys002
# bash    10415 wein    3w   REG      W;SH    1,4        0 9231682 /private/var/tmp/out

# update -d to include the new descriptor id; or remove -d to 
# print out all the descriptors

# read
(sleep 60; echo asd) 3</var/tmp/out &
# [1] 10433
lsof +f g -ap 10433 -d 0,1,2,3
# COMMAND   PID USER   FD   TYPE FILE-FLAG DEVICE SIZE/OFF    NODE NAME
# bash    10433 wein    0u   CHR    R,W;SH   16,2  0t49138     701 /dev/ttys002
# bash    10433 wein    1u   CHR    R,W;SH   16,2  0t49138     701 /dev/ttys002
# bash    10433 wein    2u   CHR    R,W;SH   16,2  0t49138     701 /dev/ttys002
# bash    10433 wein    3r   REG      R;SH    1,4        0 9231682 /private/var/tmp/out

}






