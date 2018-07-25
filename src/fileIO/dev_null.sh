#!/usr/bin/env bash

# to document how the mechanism behind /dev/null

# source
# https://www.reddit.com/r/linux/comments/20fs6t/eli5_how_does_devnull_work/
# which leads to
# https://elixir.bootlin.com/linux/latest/source/drivers/char/mem.c#L761

# /*
# * Special lseek() function for /dev/null and /dev/zero.  Most notably, you
# * can fopen() both devices with "a" now.  This was previously impossible.
# * -- SRB.
# */
#static loff_t null_lseek(struct file *file, loff_t offset, int orig)
#{
#	return file->f_pos = 0;
#}

# strace shows that /dev/null is treated just like any normal file 
readFrom() {
    echo "||||||||||||||||  read  ||||||||||||||||"
    strace cat /dev/null 2>&1 | perl -lne '$start++ if /open.*dev\/null/; print if $start > 0'
}

writeTo() {
    echo "||||||||||||||||  write  |||||||||||||||||"
    strace dd if=/dev/zero of=/dev/null bs=1 count=1 2>&1 | perl -lne '$start++ if /open.*dev\/null/; print if $start > 0'
}

readFrom
writeTo
