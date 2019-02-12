#!/usr/bin/env bash

# motivation
# to test the idea of splitting up GOD function

# notice how the modification is in effect in the caller's scope
export_something_impl() {
    aws_foo="asd"
    aws_bar="bsd"
}

export_something() {
    aws_foo=""
    aws_bar=""
    echo "before: ${aws_foo} ${aws_bar}"
    export_something_impl
    echo "after: ${aws_foo} ${aws_bar}"
}

# notice how the exported variable is seen by the perl process
export_global() {
    export AWS_FOO="${aws_foo}"
    export AWS_BAR="${aws_bar}"
}

export_something
export_global

perl <<"EOF"
defined($ENV{AWS_FOO}) || die "missing AWS_FOO";
defined($ENV{AWS_BAR}) || die "missing AWS_BAR";
EOF
