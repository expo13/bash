#!/bin/bash

#Touch vim file
echo "Touching vimrc file ... "
touch ~/.vimrc

##Set ~/.vimrc file
echo "Setting contents of vimrc file from $1"
cat $1 > ~/.vimrc
