#!/usr/bin/env bash 

# $1: line number
error() {
    local lineno=${1:?"missing line num"}
    shift 1
    local msg="${@}"
    local rlpath=$(
        perl -wn -E 'use Cwd 'abs_path';say abs_path;' <<<${BASH_SOURCE[0]}
    )
    echo "$(date '+[%H:%M:%S]') ERROR: ${msg}"
    echo "${rlpath} : line ${lineno}"
    print_lines ${lineno} 5
    exit 1
}

# $1: line number
# $2: width (optional, default value is 3)
print_lines() {
    local lineno=${1:?"missing line num"}
    local width=${2:-3}
    local filename=${BASH_SOURCE[0]}
    perl -slane \
    '
    my $tk = "  "; 
    $tk = "* " if $. == $lineno; 
    printf "%s %04d %s\n", $tk, $., $_ if $. > $lineno - $width and $. < $lineno + $width
    ' -- <${filename} -lineno=${lineno} -width=${width}
}

DIE='eval error $LINENO'

demo_die() {
    ${DIE} "there is a cow"
}

demo_die
