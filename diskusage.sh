#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')

DISK_THRESHOLD=1
message=""

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d'%' -f1)
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -gt $DISK_THRESHOLD ]
    then
        message+="High Disk Usage on $partition: $usage%\n"
    fi

done <<< $DISK_USAGE
echo -e "$message" | mail -s "High Disk Usage Alert" purushothammaddi621@gmail.com