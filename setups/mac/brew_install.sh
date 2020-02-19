#!/bin/bash

##Use this script to update or install brew.

##Input params should be location of brew.inventory file.

##ensure brew is installed
if [ ! -f /usr/local/bin/brew ]; then
        echo "Brew not found here: /usr/local/bin/brew .. installing brew!"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

##Run through Brew Installs
brew update
while read -r line || [[ -n "$line" ]]; do
        if [[ "${line:0:1}" = *"#"* ]]; then
                continue
        fi
        echo "Line from Brew inventory file is: $line"
                a=( $line )
                if [[ ${a[0]} = *"i"* ]]; then
                        echo "Brew installing ${a[1]}"
                        brew install ${a[1]}
                elif [[ ${a[0]} = *"u"* ]]; then
                        echo "Brew UNinstalling ${a[1]}"
                        brew uninstall ${a[1]}
                fi
done < "$1"
