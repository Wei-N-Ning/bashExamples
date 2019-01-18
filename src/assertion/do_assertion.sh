#!/usr/bin/env bash

# see the implemention of perl-like die() function in
# logging sub project

printInColor() {
    local RED='\033[0;31m'
    local NC='\033[0m' # No Color
    printf "${RED}${1}${NC}\n"
}

# $1: line number
# $2: width (optional, default value is 3)
print_location() {
    local lineno=${1:?"missing line num"}
    local width=${2:-3}
    local filename=${BASH_SOURCE[0]}
    perl -slane \
    '
    next unless $. > $lineno - $width and $. < $lineno + $width;
    my $tk = ("  ", " *")[$. == $lineno]; 
    printf "%s %04d %s\n", $tk, $., $_;
    ' -- <${filename} -lineno=${lineno} -width=${width}
}

# this implementation is taken from perlFoo
# the source is minimal perl book
# perl doesn't offer min() and max() builtin functions
# $1: file line num
print_location_poor() {
    local lineno=${1:?"missing line number"}
    local filename="${BASH_SOURCE[0]}"
    perl -s -wnl -e \
    '
    BEGIN {my @lines};
    push @lines, $_;
    END {
        if ($linenum <= 0 or $linenum > scalar @lines) {
            die "invalid line number: $linenum, max lines:", scalar @lines;
        }
        my $idx = $linenum - 1;
        my $fromidx = $idx - $width;
        $fromidx = 0 if $fromidx < 0; 
        my $toidx = $idx + $width;
        $toidx = $#lines if $toidx > $#lines;
        for my $i ($fromidx..$toidx) {
            if ($i == $idx) {
                printf "* ";
            } else {
                printf "  ";
            }
            printf "%04d: %s\n", $i + 1, $lines[$i];
        }
    }
    ' \
    -- -linenum=${lineno} -width=3 ${filename} 
}

# $1: line number
print_location_old() {
    local ln=${1:?"missing lineno!"}
    local n=3  # number of lines before and after, hardcoded
    local absfilename=$( python -c \
        "import os;s=os.path.realpath('${BASH_SOURCE[0]}');print(s)" )
    local _range=$( python -c \
        "s=${ln}-${n};e=${ln}+${n};r=(s if s>0 else 0, e);print('{},{}p'.format(*r))" )
    echo "${absfilename}, line:${ln}"
    sed -n ${_range} ${absfilename}
}

# $1: ret code
# $2: line number $LINENO
# $3: optional message
throw_assert_error() {
    printInColor "ASSERT_ERROR: ${3}" && print_location ${2}
    exit 1
}

# $1: ret code
# $2: line number $LINENO
# $3: optional message
assert() {
    [[ ! -z ${1} ]] && throw_assert_error "$@"
}

main() {
    rm -f /non/exist
    assert $? $LINENO "delete non-existing file"
}

main
