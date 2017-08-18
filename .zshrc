# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mevouc/.zshrc'

# End of lines added by compinstall

autoload -Uz compinit
compinit
autoload -U promptinit
promptinit
autoload colors && colors

eval $(thefuck --alias)
eval $(dircolors -b ~/.dir_colors)

# Aliases
source $HOME/.aliases

# Common shell configs (bash & zsh)
# Shall define $ME, $LINE
source $HOME/.shrc

precmd() { prompt }

function prompt()
{
  local CODE="$?"
  if [ "$CODE" = 0 ] ; then
    COL="119"
  else
    COL="203"
  fi
  FG_COLOR="7"
  export PS1="%F{233}$LINE%F{$FG_COLOR}
┌─╴%F{45}$ME%F{227}@%F{119}%m%F{$FG_COLOR}: [ %F{227}%~%F{$FG_COLOR} ]
└─(%F{${COL}}$CODE%F{$FG_COLOR})─[%F{12}%*%F{$FG_COLOR}]─(%F{203}%#%F{$FG_COLOR})─▶ "
}
