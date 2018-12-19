#/usr/bin/env bash

update_time_ntp() {
    # install ntpdate
    # sudo apt-get install ntpdate
    # sudo yum install ntpdate -y

    # sudo ntpdate ntp.ubuntu.com

    # however it is likely that the ntp daemon is running....
    service ntpd status
}
