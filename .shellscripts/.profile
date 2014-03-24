#############################################################
# Generic configuration that applies to all shells
#############################################################

#RVM Ruby Selector
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

#Set textmate as our default command line editor (vi is the default otherwise)
export EDITOR='subl -w'

source ~/.shellvars
source ~/.shellpaths
source ~/.shellaliases

if [[ -s $HOME/.ec2/anders_aws ]] then
  source $HOME/.ec2/anders_aws
fi
