#!/usr/bin/env bash

# source
# illustrated tutorial of redirection
# https://wiki.bash-hackers.org/howto/redirection_tutorial

# "duplicate file descriptor"
# 
# as the name suggests, it duplicates the physical file descriptor 
# not the symbolic name (fd 1, 2, 3 etc...)
# therefore, to duplicate the file descriptor associated with fd 1
# and associate the dup with fd 2 is achieved by:
# 
# 2>&1
#

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

read_herestring() {
    (sleep 50; cat;) 3<<<"asd" &
# bash    94205 weining    0u   CHR    R,W;SH   16,4  0t1796925    1161 /dev/ttys004
# bash    94205 weining    1u   CHR    R,W;SH   16,4  0t1796925    1161 /dev/ttys004
# bash    94205 weining    2u   CHR    R,W;SH   16,4  0t1796925    1161 /dev/ttys004
# bash    94205 weining    3r   REG      R;SH    1,6          4 5129084 /private/var/folders/07/m0nlbwvx1_vgx89ccx9mmmz00000gn/T/sh-thd.5eJknh

    # notice how herestring is saved to a temporary directory then 
    # opened as a normal file handle

    # this is to support the theory that herestring is preferrable to 
    # subshell pipe, i.e.
    
    # use: cat <<<"asd" 
    # rather than: echo "asd" | cat 
    # or cat <(echo "asd")
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

exec_err_to_file() {
# In Bash the exec built-in replaces the shell with the specified 
# program. So what does this have to do with redirection? exec also
# allow us to manipulate the file descriptors. If you don't specify a 
# program, the redirection after exec modifies the file descriptors 
# of the current shell.

# All the the errors sent to stderr by the commands after the 
# exec 2>file will go to the file, just as if you had the command in a script and ran myscript 2>file.

# recall perl's select()

exec can be used, if, for instance, you want to log the errors the commands in your script produce, just add exec 2>myscript.errors at the beginning of your script.
exec 2>/var/tmp/err

echo "asd" >&2

exec 2>&1

echo "bsd" >&2
cat /var/tmp/err
}

