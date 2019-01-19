#!/usr/bin/env bash

side_by_side_diff() {
    # require that wein@192.168.0.9 uses a password-less ssh keypair
    # note how it takes the file handle from two subshells 
    # it shows the difference between Darwin's /bin and GNU (Ubuntu)'s
    # /bin
    sdiff <(ls /bin | sort) <(ssh wein@192.168.0.9 "ls /bin" | sort)
}
