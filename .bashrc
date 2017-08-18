set -o vi

eval $(dircolors -b ~/.dir_colors)

# Aliases
source $HOME/.aliases

source $HOME/.shrc

PROMPT_COMMAND=prompt

prompt ()
{
  local code="$?"
  if [ "$code" == 0 ] ; then
    col="119"
  else
    col="203"
  fi
export PS1="\[\e[0;38;5;233m\]$LINE\[\e[0m\]
┌─╴\[\e[0;38;5;45m\]$ME\[\e[0;38;5;227m\]@\[\e[0;38;5;119m\]\h\[\e[0m\]: [ \[\e[0;38;5;227m\]\w\[\e[0m\] ]
└─(\[\e[0;38;5;${col}m\]$code\[\e[0m\])─[\[\e[0;38;5;12m\]\t\[\e[0m\]]─(\[\e[0;38;5;203m\]\$\[\e[0m\])─▶ "
}
