#!/bin/sh
scrot $HOME/lock.png
convert -colors 2 -scale 40% -monochrome -scale 250% $HOME/lock.png -modulate 100,0 $HOME/lock_bw.png
i3lock -e -i $HOME/lock_bw.png -f -n
rm $HOME/lock_bw.png
rm $HOME/lock.png
