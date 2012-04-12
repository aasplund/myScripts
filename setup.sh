#! /bin/bash

setup_symlinks() {
	SOURCE="${BASH_SOURCE[0]}"
	while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done

	SS_NAME=".shellscripts"
	SS_PATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"/$SS_NAME
	echo Creating symlink to $SS_PATH in $HOME
	ln -sf $SS_PATH $HOME/$SS_NAME

	OMZ_NAME="oh-my-zsh"
	OMZ_PATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"/$OMZ_NAME
	echo Creating symlink to $OMZ_PATH in $HOME
	ln -sf $OMZ_PATH $HOME/.$OMZ_NAME


	SCRIPT_NAME=".bash_gitprompt"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $HOME/$SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME

	SCRIPT_NAME=".bash_profile"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $HOME/$SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME

	SCRIPT_NAME=".bashrc"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME

	SCRIPT_NAME=".profile"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME

	SCRIPT_NAME=".shellaliases"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME

	SCRIPT_NAME=".shellpaths"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME

	SCRIPT_NAME=".shellvars"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME

	SCRIPT_NAME=".zprofile"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME

	SCRIPT_NAME=".zsh"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME

	SCRIPT_NAME=".zshenv"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME

	SCRIPT_NAME=".zshrc"
	echo Creating symlink to $HOME/$SS_NAME/$SCRIPT_NAME in $HOME
	ln -sf $SS_NAME/$SCRIPT_NAME $HOME/$SCRIPT_NAME
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
