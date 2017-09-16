#! /bin/bash

#All scripts in processed in the this script
scripts=(.profile .shellaliases .shellpaths .shellvars .zprofile .zsh .zshenv .zshrc)

setup_symlinks() {

	SOURCE="${BASH_SOURCE[0]}"
	while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
	#CURRENT_PATH="$( cd -P "$( dirname "$SOURCE" )" && pwd)"
	CURRENT_PATH="/Users/anders/Dropbox/myScripts"
#Creating symlink to oh-my-zsh in $HOME
	ln -sfv $CURRENT_PATH/".oh-my-zsh" $HOME
	
#Creating symlinks to all of the scripts in $HOME
	for script in ${scripts[@]}
	do
		ln -svf $CURRENT_PATH/.shellscripts/$script $HOME 
	done

#Creating symlink to project in Dropbox
	# if [ -L $HOME/Dropbox ]
	# then
	# 	ln -sfv $CURRENT_PATH $HOME/Dropbox
	# fi
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
