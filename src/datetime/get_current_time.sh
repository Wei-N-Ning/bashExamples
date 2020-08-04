#!/usr/bin/env bash

# source
# https://www.cyberciti.biz/faq/unix-linux-getting-current-date-in-bash-ksh-shell-script/
date +'FORMAT'
 
### mm/dd/yyyy ###
date +'%m/%d/%Y'
 
## Time in 12 hr format ###
date +'%r'
 
## backup dir format ##
backup_dir=$(date +'%m/%d/%Y')
echo "Backup dir for today: /nas04/backups/${backup_dir}"
backup_dir=$(date +'%m/%d/%Y/%H/%M/%S')
echo "Backup dir for today: /nas04/backups/${backup_dir}"