
# append.bashrc
export PS1='\[\033[00m\]\w \[\033[00;31m\]\$\[\033[00m\] '

set -o vi
export VISUAL=vim

stty -ixon

alias pytree="tree -I '__pycache__'"
