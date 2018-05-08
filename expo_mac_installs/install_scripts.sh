#!/bin/bash

##Here's is where install scripts or pointers to install scripts should be place.

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


##VIM =====================================

#Touch vim file
echo "Touching vimrc file ... "
touch ~/.vimrc

##Set ~/.vimrc file
echo "Setting contents of vimrc file from $2"
cat $2 > ~/.vimrc

echo "Mac install scripts finished running";

exit 0;