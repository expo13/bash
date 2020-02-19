#!/bin/bash

##Use this script to create or update your bash profile from another bash profile directory. 

#Sets up .bash_profile from the bash_profiles directory
echo "Creating ~/.bash_profile from $1"
cat "$1" > ~/.bash_profile && source ~/.bash_profile

