#!/usr/bin/env bash

# Notes
# the sut process is initially named "_" as the name of the binary, 
# then (not seen in gdb) replaced by /bin/ls during the call to 
# execve()

# source:
# https://www.systutorials.com/docs/linux/man/2-execve/
# Note that argv[0] ("args" in the source) must be the 
# full path to the executable (I'm simply duplicating 
# the c-string ptr).
# https://stackoverflow.com/questions/36673765/why-can-the-execve-system-call-run-bin-sh-without-any-argv-arguments-but-not


setUp() {
    set -e
}

buildSUT() {
    cat > /tmp/_.c <<EOF
#include <stdio.h>
#include  <stdlib.h>
#include <unistd.h>
void breakMe() {}
int main() {
    char *exe = "/bin/ls";
    char *args[] = {exe, NULL};
    char *environ[] = {NULL};
    breakMe();
    execve(exe, args, environ);
    perror("execve");
    exit(EXIT_FAILURE);
}
EOF
    gcc -g -o /tmp/_ /tmp/_.c
}

runSUT() {
    cat > /tmp/_.gdb << EOF
tbreak breakMe
run
shell ps
cont
EOF
    gdb --batch --command=/tmp/_.gdb /tmp/_
}

setUp
buildSUT
runSUT
