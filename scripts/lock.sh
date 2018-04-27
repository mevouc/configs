#!/bin/sh
img=/tmp/lock_bg.png
scrot=/tmp/lock.png

scrot "$scrot"
convert -scale 20% -scale 500%  -colors 16 "$scrot" \
     -modulate 80,50 "$img"

letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=ff000000
foreground=ffffffff

i3lock \
		-t -i "$img" \
		--timepos="110:h-70" \
		--datepos="70:h-45" \
		--clock --datestr "$USER" \
		--insidecolor="$background" --ringcolor="$foreground" --line-uses-inside \
		--keyhlcolor="$letterEnteredColor" --bshlcolor="$letterRemovedColor" --separatorcolor="$background" \
		--insidevercolor="$passwordCorrect" --insidewrongcolor="$passwordIncorrect" \
		--ringvercolor="$foreground" --ringwrongcolor="$foreground" --indpos="x+280:h-70" \
		--radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
    --verifcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground" \
    --noinputtext="" --force-clock &> /dev/null

rm "$img" "$scrot"
