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

color ()
{
  printf "\[\e[0;38;5;${1}m\]"
}

white ()
{
  printf "\[\e[0m\]"
}

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

    branch_prompt=" - $(color ${branch_color})${current_branch}$(white)"
  else
    branch_prompt=""
  fi

  export PS1="$(color ${dark_gray})$LINE $(white)
┌─╴$(color ${cyan})$USER$(color ${yellow})@$(color ${host_col})\h$(white): [ $(color ${yellow})\w$(white)${branch_prompt} ]
└─($(color ${return_col})${code}$(white))─[$(color ${blue})\t$(white)]─($(color ${red})\$$(white))─▶ \[\e[1m\]"
}
trap '[ -t 0 ] && printf "\e[0m" > /dev/tty' DEBUG # restore white color for interactive shell
