#!/bin/bash

##This is a basic shell setup script for mac computers. Inputs should be bash_profile and vimrc
## TODO - configurize and abstract these blocks so that a single conf file can be input and those
## key:value pairs are used to point to the conf file of the block's requirements. Ie.
## Brew block example:
## if [ "$input" = "brew" ]; then
##    `install brew command`
##    `loop through config file to install each package afterwards`
## fi

#####TEMPORARY WORK BLOCK
function runConfig {
	
	##BREW
	if [ "$1" = "brew" ]; then
		echo "Running install of Brew from setup script..."
		sh ./brew_install.sh $2
	elif [ "$1" = "bash" ]; then
                echo "Running setup of bash profile from setup script..."
                sh ./bash_setup.sh $2
	elif [ "$1" = "oh-my-bash" ]; then 
                echo "Running setup of oh-my-bash from setup script..."
                sh ./oh-my-bash $2
	elif [ "$1" = "directories" ]; then
                echo "Running setup of custom directories from setup script..."
                sh ./directories_setup.sh $2
	elif [ "$1" = "vim" ]; then
                echo "Running setup of vim from setup script..."
                sh ./vim_setup.sh $2
	elif [ "$1" = "gcp" ]; then
                echo "Running setup of gcp from setup script..."
                sh ./gcp_setup.sh
	elif [ "$1" = "aws" ]; then
                echo "Running setup of aws from setup script..."
                sh ./aws_setup.sh
	elif [ "$1" = "python3" ]; then
                echo "Running setup of python3 from setup script..."
                sh ./python3_setup.sh
	else 
		echo "No config setup script for $1 ... skipping"
}

while read -r line || [[ -n "$line" ]]; do
	echo "Line from config file is: $line"
	param=`echo $line | cut -d':' -f 1`
	value=`echo $line | cut -d':' -f 2`
	if [ $value = "#" ]; then
		echo "No value for param: $param ... skipping"
		continue
	fi
	echo "Setting config $param to value $value"
	runConfig $param $value

done < "$1" #this is the file
exit 0
