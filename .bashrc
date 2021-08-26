# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1="\W \[\e[1m\]λ \[\e[0m\]"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# JDK
export PATH="$PATH:/usr/lib/jvm/openjdk11/bin/"

# LSPs
export PATH="$PATH:$HOME/.lsps/kotlin/bin"

# Dotfiles Repo
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


