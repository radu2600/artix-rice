#!/bin/bash

cat ./pacman.conf > /etc/pacman.conf
cat ./pipewire.conf > /usr/share/pipewire/pipewire.conf
cat ./Xsession > /etc/lightdm/Xsession

if [ -f /etc/X11/xorg.conf.d/50-mouse-acceleration.conf ];then
    cat ./50-mouse-acceleration.conf > /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
else
    touch /etc/X11/xorg.conf.d/50-mouse-acceleration.conf && cat ./50-mouse-acceleration.conf > /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
fi

if [ -f /etc/X11/xinit/xinitrc.d/95-nvidia-settings ];then
    cat ./95-nvidia-settings > /etc/X11/xinit/xinitrc.d/95-nvidia-settings
else
    touch /etc/X11/xinit/xinitrc.d/95-nvidia-settings && cat ./95-nvidia-settings > /etc/X11/xinit/xinitrc.d/95-nvidia-settings
fi
