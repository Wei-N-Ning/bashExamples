#!/usr/bin/env bash

reload_profile() {
    # source:
    # https://github.com/trimstray/test-your-sysadmin-skills
    exec $SHELL -l

    # -l: login shell, $SHELL the shell executable
    # exec replaces the current process with a new one

    # I can also use `source` but not as clean as the above
    # option
}