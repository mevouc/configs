set -o vi

eval $(dircolors -b ~/.dir_colors)

# Aliases
alias ls="ls -N --color=auto"
alias la="ls -a"
alias ll="ls -l -a"
alias llh="ls -l -a -h"
alias l="ls"
alias cd-="cd -"
alias cd..="cd .."
alias grep="grep --color"
alias reboot="shutdown -r now"
alias poweroff="sudo poweroff"
alias off="shutdown -h now"
alias halt="sudo halt"
alias lock="~/configs/lock.sh"
alias sshvoucme="ssh -o VisualHostKey=yes mevouc@sd-80356.dedibox.fr"
alias cl="clear ; . ~/.zshrc"
alias wifi="sudo wifi-menu"
alias backlight="sudo tee /sys/class/backlight/intel_backlight/brightness <<<"
alias sl="sl -ac"
alias starwars="telnet towel.blinkenlights.nl"
alias mntwindows="sudo mount -t ntfs /dev/sda4 /mnt/windows"
alias st="git status -s"
alias add="git add"
alias cmt="git commit"
alias psh="git push"
alias pll="git pull --rebase"
alias brch="git branch"
alias chkt="git checkout"
alias rbs="git rebase"
alias gdb="gdb -q"
alias lg="git log --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %C(bold blue)<%an> %Creset%Cgreen(%ci)%Creset%n' --abbrev-commit --graph"
alias cdcl="cd ; cl"

NNTPSERVER='news.epita.fr' && export NNTPSERVER
export EDITOR=vim

man() {
    LESS_TERMCAP_md=$'\e[01;38;5;45m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[00;38;5;227m' \
    command man "$@"
}

LINE=""
for i in $(seq 80) ; do
  LINE="$LINE─"
done

if [ "$USER" = "courou_m" ] ; then
  ME=mevouc
else
  ME="$USER"
fi

PATH="$PATH:$HOME/scripts:$HOME/.bin"

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
