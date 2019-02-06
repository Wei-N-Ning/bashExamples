#!/usr/bin/env bash

# source
# http://www.skybert.net/bash/debugging-bash-scripts-on-the-command-line/

enable_debug_mode() {
    set -x
    # or 
    set -o xtrace
    
    # also:
    bash -x "script_filename.sh"
}

set_ps4_variable() {
    export PS4=\
    '# ${BASH_SOURCE}:${LINENO}: ${FUNCNAME[0]}() - [${SHLVL},${BASH_SUBSHELL},$?] '

    # example:
    # bash -x my-command.sh 1
    # my-command.sh:3: main() - [4,0,0] source my-math-library.sh
    ## my-command.sh:4: main() - [4,1,0] add_two 1
    ## my-math-library.sh:6: add_two() - [4,1,0] echo 3
    # my-command.sh:4: main() - [4,0,0] add_one 3
    # my-math-library.sh:2: add_one() - [4,0,0] echo 4
    # 4
}

use_pstree_to_inspect() {
    brew install pstree 
    
}

