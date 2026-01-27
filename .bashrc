set -o vi

eval $(dircolors -b ~/.dir_colors)

# Aliases
source $HOME/.aliases

source $HOME/.shrc

PROMPT_COMMAND=prompt

red="203"
green="119"
blue="12"
yellow="227"
cyan="45"
dark_gray="233"

prompt ()
{
  local code="$?"
  if [ "$code" == 0 ] ; then
    return_col="$green"
  else
    return_col="$red"
  fi

  # color hostname depending on SSH status
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    host_col="$red"
  else
    host_col="$green"
  fi

  current_branch="$(git branch --show-current 2> /dev/null)"
  if [ "$?" == 0 ] ; then
    git_status="$(git --no-optional-locks status --porcelain 2> /dev/null)"

    if [ -z "${git_status}" ] ; then
      branch_color="$cyan"
    else
      if echo "${git_status}" | grep -q "^ M\|^??\|^ D" ; then
        branch_color="$red"
      else
        branch_color="$green"
      fi
    fi

    branch_prompt=" - \[\e[0;38;5;${branch_color}m\]${current_branch}\[\e[0m\]"
  else
    branch_prompt=""
  fi

export PS1="\[\e[0;38;5;${dark_gray}m\]$LINE\[\e[0m\]
┌─╴\[\e[0;38;5;${cyan}m\]$USER\[\e[0;38;5;${yellow}m\]@\[\e[0;38;5;${host_col}m\]\h\[\e[0m\]: [ \[\e[0;38;5;${yellow}m\]\w\[\e[0m\]${branch_prompt} ]
└─(\[\e[0;38;5;${return_col}m\]${code}\[\e[0m\])─[\[\e[0;38;5;${blue}m\]\t\[\e[0m\]]─(\[\e[0;38;5;${red}m\]\$\[\e[0m\])─▶ \[\e[1m\]"
}
trap 'printf "\e[0m" > /dev/tty' DEBUG
