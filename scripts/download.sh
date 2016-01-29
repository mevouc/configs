# !/bin/sh

scp $1 sd-80356.dedibox.fr:/home/mevouc

ssh mevouc@sd-80356.dedibox.fr -t "rtorrent *.torrent"

drive download --pop

mv dl.zip ~/Downloads/

cd ~/Downloads/

unzip dl.zip

rm dl.zip

echo "Done."

# END
