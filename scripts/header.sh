# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# header.sh for SCRIPTS
# Generate a big file 'header' using figlet (centered and on 80 columns)

#!/bin/bash

word=$1

for i in {1..80}; do
      echo -n "=";
    done
    echo ""

  figlet ${word} -c -w 80

  for i in {1..80}; do
        echo -n "=";
      done
      echo ""

