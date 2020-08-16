#!/usr/bin/env bash

# question source:
# https://github.com/trimstray/test-your-sysadmin-skills

# :(){ :|:& };:

# it is a fork bomb
# 
# :() - this defines the function. : is the function name and the empty parenthesis shows that it will not accept any arguments
# { } - these characters shows the beginning and end of function definition
# :|: - it loads a copy of the function : into memory and pipe its output to another copy of the : function, which has to be loaded into memory
# & - this will make the process as a background process, so that the child processes will not get killed even though the parent gets auto-killed
# : - final : will execute the function again and hence the chain reaction begins



# Notes:
# reminds me `jmp -1` 
# don't try it on laptop or production server - it will bring
# down the system in seconds.


# The best way to protect a multi-user system is to use PAM to
# limit the number of processes a user can use. We know the 
# biggest problem with a fork bomb is the fact it takes up so 
# many processes.

# So we have two ways of attempting to fix this, if you are 
# already logged into the system:

# execute a SIGSTOP command to stop the process: 
# killall -STOP -u user1

# if you can't run at the command line you will have to use 
# exec to force it to run (due to processes all being used): 
# exec killall -STOP -u user1

# With fork bombs your best method for this is preventing from 
# being to big of an issue in the first place.

:() { 
    : | : & 
}

:
