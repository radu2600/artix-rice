#!/bin/sh

# Source profiles
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Start dwmblocks and dwm
dwmblocks &
while :; do
    ssh-agent dwm
done
