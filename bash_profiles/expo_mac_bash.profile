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

#CSCOPE
alias scope='~/repos/expo/bash/tools/cscope_gen.sh'

##Voyant
alias cdv='cd ~/repos/voyant'

##FUNCTION =================================================

setupMacInstallScripts(){
	mkdir -p ~/.setups
	mkdir -p ~/temp
	tar -czvf ~/temp/temp.tar.gz ~/repos/expo/bash/setups
	
}

gitCommitVimrc(){
	git -C ~/repos/expo/bash/setups/ add mac.vimrc
	git -C ~/repos/expo/bash/setups/ commit -m "Vimrc change"
	git -C ~/repos/expo/bash/setups/ push origin develop
}

gitCommitBashProfile(){
	vim ~/repos/expo/bash/bash_profiles/expo_mac_bash.profile && cat ~/repos/expo/bash/bash_profiles/expo_mac_bash.profile > ~/.bash_profile && source ~/.bash_profile
	git -C ~/repos/expo/bash/bash_profiles add expo_mac_bash.profile
	git -C ~/repos/expo/bash/bash_profiles commit -m "BashProfile change"
	git -C ~/repos/expo/bash/bash_profiles push origin develop
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
