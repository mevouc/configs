#!/bin/sh
scrot ~/lock.png
convert -scale 10% -scale 1000% ~/lock.png ~/configs/lockscreen/picture
epi3lock -e -i ~/configs/lockscreen/picture -f -n
rm ~/configs/lockscreen/picture
