set -o vi

# cache dircolors output: starting a process is slow on Windows
if [ ! -f ~/.dir_colors.cache ] || [ ~/.dir_colors -nt ~/.dir_colors.cache ] ; then
  dircolors -b ~/.dir_colors > ~/.dir_colors.cache
fi
source ~/.dir_colors.cache

# Aliases
source $HOME/.aliases

source $HOME/.shrc

PROMPT_COMMAND=prompt

# prompt () runs before every prompt: avoid $(...) and pipes in it, each one starts a process, which is slow on Windows
red="\[\e[0;38;5;203m\]"
green="\[\e[0;38;5;119m\]"
blue="\[\e[0;38;5;12m\]"
yellow="\[\e[0;38;5;227m\]"
cyan="\[\e[0;38;5;45m\]"
dark_gray="\[\e[0;38;5;233m\]"
white="\[\e[0m\]"

# matches an unstaged change or an untracked file in `git status --porcelain` output
git_dirty_re=$'\n( M|\\?\\?| D)'

prompt ()
{
  local code="$?"
  local return_col host_col branch_prompt="" git_dir="$PWD"
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

  # only run git inside a repository
  while [ -n "$git_dir" ] && [ ! -e "$git_dir/.git" ] ; do
    git_dir="${git_dir%/*}"
  done

  local git_status
  if [ -e "$git_dir/.git" ] && git_status="$(git --no-optional-locks status --porcelain -b 2> /dev/null)" ; then
    local header="${git_status%%$'\n'*}"
    local changes="${git_status#"$header"}"
    local current_branch="${header#\#\# }"
    current_branch="${current_branch#No commits yet on }"
    current_branch="${current_branch%%...*}"

    local branch_color
    if [ -z "$changes" ] ; then
      branch_color="$cyan"
    elif [[ "$changes" =~ $git_dirty_re ]] ; then
      branch_color="$red"
    else
      branch_color="$green"
    fi

    branch_prompt=" - ${branch_color}${current_branch}${white}"
  fi

  export PS1="${dark_gray}$LINE ${white}
╭─╴${cyan}$USER${yellow}@${host_col}\h${white}: [ ${yellow}\w${white}${branch_prompt} ]
╰─(${return_col}${code}${white})─[${blue}\t${white}]─(${red}\$${white})─❯ \[\e[1m\]"
}
trap '[ -t 0 ] && printf "\e[0m" > /dev/tty' DEBUG # restore white color for interactive shell
