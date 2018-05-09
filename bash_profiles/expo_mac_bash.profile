##vim extras
alias vb=gitCommitBashProfile
alias vimrc=gitCommitVimrc

##ENVIRONMENT ==========================================

#This command creates a hidden "executables" dir in user home dir to prevent dev scripts from being accidentally installed
alias macinstall=setupMacInstallScripts

##git commands
alias gs='git status'
alias gita=gitAddAllCommitPush
alias gits=gitAddOneCommitPush
alias gb='git branch'
alias gd='git diff *'
alias gc="git checkout $1"
alias gm="git merge $1"

##terminal navigation
alias up='cd ..'
alias l='ls -alh'
alias x='exit'
alias up3='cd ../../../'
alias cde='cd ~/repos/expo/'


#pbcopy and pbaste
alias paste='echo `pbpaste`'
alias pcopy='cat $1 | pbcopy'

##grep and find searches
alias g=grepFindFromLocal
alias ff=findFile
alias fd=findDir

#Todos and notes
alias todo=appendTodos
alias todos='vim ~/notes/todos.txt'
alias notes='vim ~/notes/notes.txt'
alias note=appendTodos

#CTAGS
alias tag='ctags -R' #run from directory you want tagged

#CSCOPE
alias scope='~/repos/expo/bash/tools/cscope_gen.sh'

##Voyant
alias cdv='cd ~/repos/voyant'

##FUNCTION =================================================

appendTodos(){
	touch ~/notes/todos.txt
	str="'$*'"
	str="$(date) $str"
	printf "$str \n" >> ~/notes/todos.txt
	cat ~/notes/todos.txt
}

appendNotes(){
	touch ~/notes/notes.txt
	str="'$*'"
	str="$(date) $str"
	printf "$str \n" >> ~/notes/notes.txt
	cat ~/notes/notes.txt
}

setupMacInstallScripts(){
	mkdir -p ~/.setups
	mkdir -p ~/temp
	tar -czvf ~/temp/temp.tar.gz ~/repos/expo/bash/setups	
}

#Everytime you make a vimrc change it commits to origin develop on github
gitCommitVimrc(){
	vim ~/repos/expo/bash/setups/mac.vimrc && cat ~/repos/expo/bash/setups/mac.vimrc > ~/.vimrc
	git -C ~/repos/expo/bash/setups/ add mac.vimrc
	git -C ~/repos/expo/bash/setups/ commit -m "Vimrc change"
	git -C ~/repos/expo/bash/setups/ push origin develop
}

#Everytime you make a bash_profile change it commits to origin develop on github
gitCommitBashProfile(){
	vim ~/repos/expo/bash/bash_profiles/expo_mac_bash.profile && cat ~/repos/expo/bash/bash_profiles/expo_mac_bash.profile > ~/.bash_profile && source ~/.bash_profile
	git -C ~/repos/expo/bash/bash_profiles add expo_mac_bash.profile
	git -C ~/repos/expo/bash/bash_profiles commit -m "BashProfile change"
	git -C ~/repos/expo/bash/bash_profiles push origin develop
}

#Git Add/Commit/Push all to a specified branch
gitAddAllCommitPush(){
	git add -A;
	git commit -m "$1";
	git push origin $2;
}

#Git Add One specified file and push to specified branch
gitAddOneCommitPush(){
	git add $1;
	git commit -m "$2";
	git push origin $3;
}

grepFindFromLocal(){
	grep -r $1 ./;
}

findFile(){
	find ./ -type f -name $1
}

findDir(){
	find ./ -type d -name $1
}

##CLOSING FUNCTIONS

#see vb alias from above. This command make sure the proper directories are in place for VB auto save to git monitored files.
mkdir -p ~/repos
mkdir -p ~/repos/expo
mkdir -p ~/repos/expo/bash

#oh-my-git
source ~/.oh-my-git/prompt.sh
