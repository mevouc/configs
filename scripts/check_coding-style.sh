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
echo "> Missing spaces after keyword with arguments:"
grep -n --color 'if(' $1
grep -n --color 'while(' $1
grep -n --color 'for(' $1
grep -n --color 'switch(' $1
grep -n --color 'sizeof(' $1
echo
echo "> Space before semicolon:"
grep -n --color ' ;' $1
echo
echo "> Spaces after openning parentheses:"
grep -n --color '( ' $1
echo
echo "> Spaces before closing parentheses:"
grep -n --color ' )' $1
echo
echo "> Padding errors with expressions:"
grep -n --color ' :' $1 # Switch case
# TODO spaces before and after +, -, *, /, =, +=, ...
echo
echo "Done."

# END

