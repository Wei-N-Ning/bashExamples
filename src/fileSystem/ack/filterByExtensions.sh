#!/usr/bin/env bash

# source:
# https://stackoverflow.com/questions/25200246/search-for-a-specific-file-type-with-ack

search_in_terraform_files_only() {
    # search only in the .tf files for pattern "map"

    # I can use shorter name such as "tf", as long as there is 
    # no conflict...
    ack --type-add=terraform:ext:tf --type=terraform map
}
