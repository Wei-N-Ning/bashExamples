#!/usr/bin/env bash

# motivation
# to test the idea of splitting up GOD function

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

export_something
