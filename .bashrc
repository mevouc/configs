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
    return_col="119"
  else
    return_col="203"
  fi

  if [ "$HOSTNAME" == "mordor" ] ; then
    host_col="203"
  else
    host_col="119"
  fi

export PS1="\[\e[0;38;5;233m\]$LINE\[\e[0m\]
┌─╴\[\e[0;38;5;45m\]$USER\[\e[0;38;5;227m\]@\[\e[0;38;5;${host_col}m\]\h\[\e[0m\]: [ \[\e[0;38;5;227m\]\w\[\e[0m\] ]
└─(\[\e[0;38;5;${return_col}m\]$code\[\e[0m\])─[\[\e[0;38;5;12m\]\t\[\e[0m\]]─(\[\e[0;38;5;203m\]\$\[\e[0m\])─▶ "
}
