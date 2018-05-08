##vim extras
alias vb='vim ~/.bash_profile && source ~/.bash_profile && cat ~/.bash_profile > ~/repos/expo/bash/bash_profiles/expo_mac_bash.profile'
alias vimrc='vim ~/repos/expo/bash/setups/mac_vimrc && cat ~/repos/expo/bash/setups/mac_vimrc > ~/.vimrc'

##ENVIRONMENT ==========================================

#This command creates a hidden "executables" dir in user home dir to prevent dev scripts from being accidentally installed
alias macinstall=setupMacInstallScripts

##git commands
alias gs='git status'
alias gita=gitAddAllCommitPush
alias gits=gitAddOneCommitPush

##terminal navigation
alias up='cd ..'
alias l='ls -alh'
alias x='exit'
alias up3='cd ../../../'
alias cde='cd ~/repos/expo/'

##grep and find searches
alias g=grepFindFromLocal
alias ff=findFile
alias fd=findDir

#CTAGS
alias tag='ctags -R' #run from directory you want tagged

##Voyant
alias cdv='cd ~/repos/voyant'

##FUNCTION =================================================

setupMacInstallScripts(){
	mkdir -p ~/.setups
	mkdir -p ~/temp
	tar -czvf ~/temp/temp.tar.gz ~/repos/expo/bash/setups
	
}

gitAddAllCommitPush(){
	git add -A;
	git commit -m "$1";
	git push origin $2;
}

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
