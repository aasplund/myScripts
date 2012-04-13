#! /bin/bash

setup_symlinks() {
	scripts=(.bash_gitprompt .bash_profile .bashrc .profile .shellaliases .shellpaths .shellvars .zprofile .zsh .zshenv .zshrc)

	SOURCE="${BASH_SOURCE[0]}"
	while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
	CURRENT_PATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	
	
	SS_NAME=".shellscripts"
	ln -sfv $CURRENT_PATH/$SS_NAME $HOME

	OMZ_NAME="oh-my-zsh"
	ln -sfv $CURRENT_PATH/$OMZ_NAME $HOME
	rm -f $HOME/.$OMZ_NAME
	mv -fv $HOME/$OMZ_NAME $HOME/.$OMZ_NAME

	for script in ${scripts[@]}
	do
		ln -svf $SS_NAME/$script $HOME 
	done


	if [ -d $HOME/Dropbox ]
	then
		ln -sfv $CURRENT_PATH $HOME/Dropbox
	fi
}

echo "

******************** WARNING! ********************

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
