#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# I have no idea what this does, but I don't want to break anything
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# dbus
if which dbus-launch > /dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS";
then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# launch all the things

pipewire-pulse & # audio
setxkbmap -layout de & # keymap
sxhkd & # keybinds
exec bspwm
