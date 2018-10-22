#!/bin/bash

##Here's is where install scripts or pointers to install scripts should be place.
##Only 1 argument should be supplied - the config file 

#============= TODO figure out if you can return a sgring value here
function getConfig {

while read -r line || [[ -n "$line" ]]; do
	if [[ "${line:0:1}" = *"#"* ]]; then
		continue
	fi
	echo "Line from config file is: $line"
		param=`echo $line | cut -d':' -f 1`
		if [ $param = $2 ]; then
			value=`echo $line | cut -d':' -f 2`
			echo "Setting config $param to value $value"
			return "$value"
		f
done < "$1" #this is the file
echo "No value found for config $2"
exit 1
}

ANOTHERVALUE=`getConfig $1 $2`
echo "here"
exit 0
#==============


##input config file - only
if [ -z "$1" ]; then
    echo "No arguments homie!  Please list config file in arguments for setup: config file, bash profile, vimrc."
fi
if [ ! -f "$1" || ! -f "$2" || ! -f "$3" ]; then
    echo "Argument not found. Arguments are: config file, bash profile, vimrc"
    exit 1;
fi

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
done < "$2" 

##BASH ===================================

#Sets up .bash_profile from the bash_profiles directory
echo "Creating ~/.bash_profile"
cat ~/repos/expo/bash/bash_profiles/expo_mac_bash.profile > ~/.bash_profile && source ~/.bash_profile

##VIM =====================================

#Touch vim file
echo "Touching vimrc file ... "
touch ~/.vimrc

##Set ~/.vimrc file
echo "Setting contents of vimrc file from $3"
cat $3 > ~/.vimrc

#Oh-my-git
git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git 

#setup crons
mkdir -p ~/.cron
cat ~/repos/expo/bash/cron/daily_cron.sh > ~/.cron/daily_cron.sh
../cron/setup_crons.sh ../cron/cron.inventory

#general directories
mkdir -p ~/notes
mkdir -p ~/tools
mkdir -p ~/packages
mkdir -p ~/sandbox

#Google Cloud Platform
curl -o ~/packages/google-cloud-sdk-221.0.0-darwin-x86_64.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-220.0.0-darwin-x86_64.tar.gz
cd ~/packages
tar -xzvf google-cloud-sdk-220.0.0-darwin-x86_64.tar.gz
./google-cloud-sdk/install.sh
./google-cloud-sdk/bin/gcloud init

#Local Email Server
touch /etc/postfix/sasl_passwd
echo "smtp.gmail.com:587 colquitt.craig@gmail.com:clobber-recap-peculiar" >> /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd

#safe to assume config file is legit because we have already validated at this point
# first input param is config file, second is the desired config
function getConfigValue {	
while read -r line || [[ -n "$line" ]]; do
	if [[ "${line:0:1}" = *"#"* ]]; then
		continue
	fi
	echo "Line from config file is: $line"
		a=( $line )
		param = a | cut -d ':' -f 1
		echo $param
		value = a | cut -d ':' -f 2
		echo $value
		
	echo 'someletters_12345_moreleters.ext' | cut -d'_' -f 2

done < "$1" #this is the file
}

echo "Don't forget to install thunderbird email client by mozilla"

exit 0
