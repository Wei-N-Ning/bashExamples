#!/usr/bin/env bash

# source:
# https://askubuntu.com/questions/448358/automating-apt-get-install-with-assume-yes

apt_get_no_prompt() {
    sudo apt-get update
    sudo apt-get --assume-yes install python-pip
}

