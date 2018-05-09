#!/bin/bash

##Run through cron inventory file
while read -r line || [[ -n "$line" ]]; do
	#check for comment
	if [[ "${line:0:1}" = *"#"* ]]; then
		continue
	fi
	echo "Line from Cron inventory file is: $line"
	(crontab -l 2>/dev/null; echo "$line") | crontab -
done < "$1"
