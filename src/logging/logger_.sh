#!/usr/bin/env bash

# source:
# http://www.tutorialspoint.com/unix_commands/logger.htm

# see also:
# https://www.cyberciti.biz/faq/linux-log-files-location-and-how-do-i-view-logs-files/

setUp() {
    set -e
}

callShLogger() {
    logger -i -t "myapp" "thereisnospoon"
}

callCProgram() {
    cat > /tmp/_.c <<EOF
#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

void init_log()
{
    setlogmask(LOG_UPTO(LOG_NOTICE));
    openlog("testd",LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);
}

int main(void) {

    init_log();
    syslog(LOG_NOTICE, "Session started!!");
    closelog();

    return EXIT_SUCCESS;
}
EOF
    gcc -o /tmp/_ /tmp/_.c
    /tmp/_
}

viewLogs() {
    tail -n 2 /var/log/syslog
}



setUp
callShLogger
callCProgram
viewLogs
