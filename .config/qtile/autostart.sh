#!/bin/sh

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom &
nm-applet &
setxkbmap -option caps:escape &
feh --bg-scale ~/.config/wallpapers/snow.jpg &


