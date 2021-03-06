##MAC PROFILE - EXPO

echo 'Copy Gold Leader!'

source ~/.bashrc

#java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home"

##vim extras
alias vb=gitCommitBashProfile
alias vimrc=gitCommitVimrc

##ENVIRONMENT ==========================================

#PATH
export PATH=$PATH:~/tools/platform-tools/

#This command creates a hidden "executables" dir in user home dir to prevent dev scripts from being accidentally installed
alias macinstall=setupMacInstallScripts

##Android commands
#adb
alias adbd='adb devices'

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
alias pg='ps -ef | grep $1'
alias d='cd ~/Downloads'

#pbcopy and pbaste
alias paste='echo `pbpaste`'
alias pcopy='cat $1 | pbcopy'

##grep and find searches
alias g=grepFindFromLocal
alias ff=findFile
alias fd=findDir

#CTAGS
alias tag='ctags -R' #run from directory you want tagged

#CSCOPE
alias scope='~/repos/expo/bash/tools/cscope_gen.sh'


##VERIZON
if [ -f ~/.verizon_profile ]; then
	source ~/.verizon_profile    
fi

#Maybe we can use this again? I like the idea.
appendTodos(){
	if [ ! -f ~/notes/todos.txt ]; then
		touch ~/notes/todos.txt
		echo '# [todos]' > ~/notes/todos.txt
	fi
	str="'$*'"
	str="$(date) $str"
	echo "$str" >> ~/notes/todos.txt
	cat ~/notes/todos.txt
	echo " -------- "
	~/.py/sendTodoListToServer.py
}

appendToRun() {
	touch ~/notes/run.log
	str="'$*'"
	str="$(date) $str"
	echo "$str" >> ~/notes/run.log
	cat ~/notes/run.log
}

appendNotes(){
	touch ~/notes/notes.txt
	str="'$*'"
	str="$(date) $str"
	echo "$str" >> ~/notes/notes.txt
	cat ~/notes/notes.txt
}

setupMacInstallScripts(){
	mkdir -p ~/.setups
	mkdir -p ~/temp
	tar -czvf ~/temp/temp.tar.gz ~/repos/expo/bash/setups	
}

#Everytime you make a vimrc change it commits to origin develop on github
gitCommitVimrc(){
	vim ~/repos/expo/bash/conf/mac/mac.vimrc && cat ~/repos/expo/bash/conf/mac/mac.vimrc > ~/.vimrc
	git -C ~/repos/expo/bash/conf/mac/ add mac.vimrc
	git -C ~/repos/expo/bash/conf/mac/ commit -m "Vimrc change"
	git -C ~/repos/expo/bash/conf/mac/ push origin master
	exit
}

#Everytime you make a bash_profile change it commits to origin develop on github
gitCommitBashProfile(){
	vim ~/repos/expo/bash/bash_profiles/expo_mac_bash.profile && cat ~/repos/expo/bash/bash_profiles/expo_mac_bash.profile > ~/.bash_profile && source ~/.bash_profile
	git -C ~/repos/expo/bash/bash_profiles add expo_mac_bash.profile
	git -C ~/repos/expo/bash/bash_profiles commit -m "BashProfile change"
	git -C ~/repos/expo/bash/bash_profiles push origin master
#	exit
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
	grep -r -I -n -H $1 ./;
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ccolquitt/packages/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ccolquitt/packages/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ccolquitt/packages/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ccolquitt/packages/google-cloud-sdk/completion.bash.inc'; fi

#Docker
#start daemon on mac
alias dock='nohup /Applications/Docker.app/Contents/MacOS/Docker  /Applications/Docker.app/Contents/MacOS/ &'
alias de='docker exec -it $1 /bin/bash'
alias dr='docker run -it --rm'
alias db='docker build . -t'
alias di='docker images'
alias d='docker'
alias ds='docker ps -a'

#JULIA
export PATH=$PATH:/Applications/Julia-1.0.app/Contents/Resources/julia/bin

#k8s
alias kns='kubectl get namespaces'
alias kgp='kubectl get pods'
alias ktl='kubectl $1'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export SSH_AUTH_SOCK=/Users/craig/.yubiagent/sock

