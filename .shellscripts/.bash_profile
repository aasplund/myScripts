#Import the Z or Bash shell agnostic environment config
if [ -f ~/.profile ]; then
    source ~/.profile
fi

#When running two bash windows, allow both to write to the history, not one stomping the other
shopt -s histappend
#PROMPT_COMMAND='history -a'

#Remove duplicates from history
export HISTCONTROL="ignoredups"
export HISTIGNORE="&:ls:[bf]g:exit"

#Keep multiline commands as one command in history
shopt -s cmdhist

export GITPROMPT_NOCOLOR=1
export GITPROMPT_NOSTATUS=1

if [ -f ~/.bash_gitprompt ]; then
    source ~/.bash_gitprompt
fi

if [ -f ~/scripts/git-completion.sh ]; then
    source ~/scripts/git-completion.sh
fi
