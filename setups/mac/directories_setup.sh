#!/bin/bash

#TODO - the mkdir doesn't add directory to home directory. instead the local dir. fix.

##create files and directories from conf file.
while read -r line || [[ -n "$line" ]]; do
	if [[ "${line:0:1}" = *"#"* ]]; then
		continue
	fi
	echo "Line from directories file is: $line"
		a=( $line )
		if [[ ${a[0]} = *"d"* ]]; then
			echo "Creating directory ${a[1]}"
			mkdir -p ${a[1]}
		elif [[ ${a[0]} = *"f"* ]]; then
			echo "Creating file ${a[1]}"
			touch ${a[1]}
		fi
done < "$1"

