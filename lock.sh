#!/bin/sh
scrot ~/lock.png
convert -scale 10% -scale 1000% ~/lock.png -modulate 100,0 ~/configs/lockscreen/picture
epi3lock -e -i ~/configs/lockscreen/picture -f -n
rm ~/configs/lockscreen/picture
rm ~/lock.png
