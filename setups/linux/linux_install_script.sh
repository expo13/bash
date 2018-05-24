#!/bin/bash

##Here's is where install scripts or pointers to install scripts should be place.

##check input arguments


##ensure recent yum is installed

##Run through Brew Installs
while read -r line || [[ -n "$line" ]]; do
	if [[ "${line:0:1}" = *"#"* ]]; then
		continue
	fi
	echo "Line from yum inventory file is: $line"
		a=( $line )
		if [[ ${a[0]} = *"i"* ]]; then
			echo "Yum installing ${a[1]}"
			yum install ${a[1]}
		elif [[ ${a[0]} = *"u"* ]]; then
			echo "Yum UNinstalling ${a[1]}"
			yum uninstall ${a[1]}
		fi
done < "$1"

##BASH ===================================

#Sets up .bash_profile from the bash_profiles directory
echo "Creating ~/.bashrc"
cat ../profiles/linux/expo_linux_bash.profile > ~/.bashrc && source ~/.bashrc

##VIM =====================================

#Touch vim file
echo "Touching vimrc file ... "
touch ~/.vimrc

##Set ~/.vimrc file
echo "Setting contents of vimrc file from $2"
cat $2 > ~/.vimrc

echo "Linux install scripts finished running";

#Oh-my-git
git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git 

#setup crons
mkdir -p ~/.cron
cat ~/repos/expo/bash/cron/daily_cron.sh > ~/.cron/daily_cron.sh
../cron/setup_crons.sh ../cron/cron.inventory

#general directories
mkdir -p ~/notes
mkdir -p ~/tools

exit 0;
