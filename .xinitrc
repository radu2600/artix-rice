#!/bin/sh

# Source profiles
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Start dwmblocks and dwm
dwmblocks &
exec dbus-run-session sh -c '
    while :; do
        dwm
        sleep 1
    done
'
