#!/usr/bin/env python

import sys


def drink():
    for l in sys.stdin.readlines():
        l = l.strip(' \n')
        if l == 'die':
            sys.exit(0)
        sys.stdout.write('{},'.format(len(l)))


if __name__ == '__main__':
    drink()

