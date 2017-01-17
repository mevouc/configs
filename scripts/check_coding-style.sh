# !/bin/sh

curl_brack()
{
  file="$1"
  shift
  while [ "$#" -gt 0 ]; do
    open=$(echo "$1" | sed 's/:{.*$//')
    shift
    close=$(echo "$1" | sed 's/:}.*$//')
    shift
    body="$(head -$close < "$file" | tail -n +$open)"
    len=$(echo "$body" | wc -l)
    if [ "$len" -gt 27 ] ; then
      fun=$((open - 1))
      decl="$(head -$fun < $file | tail -1)"
      echo "$decl" | grep --color '^.*$'
    fi
  done
}

for f; do
  if [ ! -f "$f" ] ; then
    echo "Skipping $f, not a valid source file..."
    continue
  fi
  echo "EPITA coding style errors in $f:"
  echo
  echo "> Lines of more than 80 columns:"
  grep -n --color '.\{81,\}' "$f"
  echo
  echo "> Lines with trailing spaces:"
  grep -n --color ' $' "$f"
  echo
  echo "> Lines containing tabs:"
  grep -n --color '	' "$f"
  echo
  echo "> Missing spaces after keyword with arguments:"
  keywords='if while for switch'
  for k in $keywords 'sizeof' ; do
    grep -n --color "$k(" "$f"
  done
  echo
  echo "> Space before semicolon:"
  grep -n --color ' ;' "$f"
  echo
  echo "> Space missing after semicolon or colon:"
  for c in ';' ',' ; do
    grep -v "$c[ ]" "$f" | grep -n --color "$c."
  done
  echo
  echo "> Spaces next to parentheses or brackets:"
  opening_br='( \['
  for br in $opening_br ; do
    grep -n --color "$br " "$f"
  done
  closing_br=') \]'
  for br in $closing_br ; do
    grep -n --color " $br" "$f"
  done
  echo
  echo "> Spaces before opening brackets:"
  grep -n --color ' \[' "$f"
  echo
  echo "> Padding errors with expressions:"
  grep -n --color ' :' "$f" # Switch case
  echo
  echo "> Spaces missing before or after binary operator:"
  ops='+ / = += -= /= \*= %= &= |= == <= >=' # TODO treat * and - (also pointer)
  for op in $ops; do
    grep -n --color "[[:alnum:]]$op" "$f"
    grep -n --color -- "$op[[:alnum:]]" "$f"
  done
  echo
  echo "> Semi-colon after a loop of conditonnal keyword:"
  for k in $keywords ; do
    grep "$k .*;$" "$f" | grep -n --color ';'
  done
  echo
  echo "> Functions of more than 25 lines"
  curlies=$(grep -n --color  '\(^{\)\|\(^}\)' "$f")
  curl_brack "$f" $curlies
  echo
  echo "Done."
  echo
done

read
