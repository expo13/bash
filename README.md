# bash

Clone and run these commands to setup standard development environment

mkdir -p ~/repos
mkdir -p ~/repos/expo
cd ~/repos/expo
git clone https://github.com/expo13/bash.git
cd ~/repos/expo/bash/setups/mac
./mac_setup.sh config_file

## 2/2020
Changes made to abstract the mac install script to be modular install scripts per
 module to be installed. Ie.. separating out vimrc and brew from the install script itself 
into their own single responsibility script. Also, each module install script should be
an update script that can be run to overwrite an existing configuration.

Modules (order dependent. do brew first in config file):
brew
bash
directories
vim
oh-my-git
crons
local-email
gcp
python3
java
node
angular
julia
rust


## 5/22/2018 

Project includes simple python scrips for endpoint to receive a small, simple
request on AWS ec2 server. Further, project includes a script to run setup on a
mac for a standardized dev environment and the beginnings of a simiilar script
for a linux environment. Script includes yum, pip3, brew, vim, etc style
package inventories. A standardized config/yaml process is also in the works to
simplify the environment setups. Simple cron process have also been automated
with an inventory stuyle configuration. 
