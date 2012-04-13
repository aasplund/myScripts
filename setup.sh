#! /bin/bash

#All scripts in processed in the this script
scripts=(.bash_gitprompt .bash_profile .bashrc .profile .shellaliases .shellpaths .shellvars .zprofile .zsh .zshenv .zshrc)

setup_symlinks() {

	SOURCE="${BASH_SOURCE[0]}"
	while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
	CURRENT_PATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

#Adding link to oh-my-zsh	
	ln -sfv $CURRENT_PATH/".oh-my-zsh" $HOME
	
#Adding links to scriptfolder and all of its containg scripts
	SCRIPT_FOLDER_NAME=".shellscripts"
	ln -sfv $CURRENT_PATH/$SCRIPT_FOLDER_NAME $HOME
	for script in ${scripts[@]}
	do
		ln -svf $SCRIPT_FOLDER_NAME/$script $HOME 
	done

#Adding link to project in Dropbox
	if [ -d $HOME/Dropbox ]
	then
		ln -sfv $CURRENT_PATH $HOME/Dropbox
	fi
}
echo "

******************** WARNING! ********************

This script will create symlinks in $HOME with the following names:

${scripts[@]}

If you already have any of the provided script files you should back them up
in case you want to go back to your original settings.

I.e cp ~/.zshrc ~/.zshrc.orig


Do you want to continue?"

select yn in "Yes" "No"; do
    case $yn in
        Yes ) setup_symlinks; break;;
        No ) exit;;
    esac
done
