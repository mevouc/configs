# !/bin/sh

echo "> Lines of more than 80 columns:"
grep -n --color '.\{80,\}' $1
echo
echo "> Lines with trailing spaces:"
grep -n --color ' '$ $1
echo
echo "> Lines containing tabs:"
grep -n --color '	' $1
echo
echo "Done."

# END
