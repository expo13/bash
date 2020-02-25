#!/bin/bash

##Use this script to create or update your bash profile from another bash profile directory. 

bash -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"

cat $1 > ~/.bashrc
