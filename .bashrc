# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1="\W \[\e[1m\]λ \[\e[0m\]"

# Node
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# JDK
export PATH="$PATH:/usr/lib/jvm/openjdk11/bin/"

# Android
export ANDROID_HOME="$HOME/android"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/tools/bin/"
export PATH="$PATH:$ANDROID_HOME/emulator/"
export PATH="$PATH:$ANDROID_HOME/platform-tools/"
#export PATH="$PATH:/opt/gradle/gradle-7.2/bin"

# Dotfiles Repo
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Set DBUS address for cron
env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
chmod 600 $HOME/.dbus/Xdbus
echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus


