#!/usr/bin/env bash

# motivation 
# I want to log the stdout and stderr from a process to two files
# without insulating them 
# tee is the most obvious choice

# THIS IS THE ANSWER
# https://stackoverflow.com/questions/9112979/pipe-stdout-and-stderr-to-two-different-processes-in-shell-script
# use a third file descriptor

set -euo pipefail

TEMPDIR=/var/tmp/sut

teardown() {
    rm -rf ${TEMPDIR}
}

setup() {
    teardown
    mkdir ${TEMPDIR}
    trap teardown EXIT
}

demo_stdout_stderr_to_tees() {
    echo "===================================================================="

    # dd will print the binary blob to a file named stdout
    # and print the statistics to another file named stderr
    # /////////////////////////////////////////////////////////
    # NOTE: read this from the outter {} to the inner {}
    # 3>&1 1>&2 gets processed first
    # 2>&3 3>&- gets processed afterwards
    # ////////////////////////////////////////////////////////
    # 
    { dd if=/dev/urandom bs=128 count=1 2>&3 3>&- | \
        base64 | tee ${TEMPDIR}/stdout; } 3>&1 1>&2 | tee ${TEMPDIR}/stderr
}

kitchen_sink() {
    echo "===================================================================="
    
    # dd's stdout (base64 binary blob) is insulated by kitchen sink
    { dd if=/dev/urandom bs=64 count=1 | \
        base64 | tee ${TEMPDIR}/stdout >/dev/null; } 2>&1 | \
        tee ${TEMPDIR}/stderr
    cat ${TEMPDIR}/stdout
}

compute() {
    perl -E \
    '
    # unbuffered IO may better demo the pipe 
    $| = 1;
    for (1..10) {
        sleep 2;
        say STDOUT "there^is^a^cow";
        say STDERR "THERE-IS-A-COW";
    }
    '
}

bash_specific_form() {
    # this only works in bash, taking advantage of the its subshell syntax
    compute 1> >(cat >/var/tmp/stdout) 2> >(cat >/var/tmp/stderr)

    # to observe the output
    # tail -f /var/tmp/stdout 
    
    # NOTE: compare these two commands:
    dd if=/dev/zero bs=128 count=1 1> >(perl -wnl -E 'say "stdout: " . $_') 2> >(perl -wnl -E 'say "stderr: " . $_')
    # stdout: stderr: 1+0 records in
    # stdout: stderr: 1+0 records out
    # stdout: stderr: 128 bytes copied, 1.1512e-05 s, 11.1 MB/s
    dd if=/dev/zero bs=128 count=1 1> >(perl -wnl -E 'say "stdout"') 2> >(perl -wnl -E 'say "stderr: " . $_')
    # stdout
    # stdout
    # stdout
}

simple_form() {
    # mentioned in https://wiki.bash-hackers.org/howto/redirection_tutorial
    # to this post:
    # https://groups.google.com/forum/#!topic/comp.unix.shell/ZCBtFUiUpO8
    # which provides a simpler form to this recipe: 
    
    { compute | cat >/var/tmp/stdout; } 2>&1 | cat >/var/tmp/stderr

    # to observe the output
    # tail -f /var/tmp/stdout 
}

setup
demo_stdout_stderr_to_tees
kitchen_sink