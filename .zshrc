# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mevouc/.zshrc'

# End of lines added by compinstall

# Startup exec
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd(){
	vcs_info
}

autoload -Uz compinit
compinit
autoload -U promptinit
promptinit
autoload colors && colors

eval $(thefuck --alias)
eval $(dircolors -b ~/.dir_colors)
archey

source ~/.zsh/zsh-git-prompt/zshrc.sh

setopt prompt_subst
# Prompt config
# "$COLUMNS" can be set instead of "80"
# To use the following definition, type "${NEWLINE}"
NEWLINE=$'\n'
PROMPT='%F{233}${(r:80::─:)}%{$reset_color%}${NEWLINE}┌─╴%F{119}%n%F{227}@%F{045}%m%{$reset_color%}: [ %F{227}%~ %{$reset_color%}]$(git_super_status)${NEWLINE}└──[%F{12}%*%{$reset_color%}]─(%F{203}%#%{$reset_color%})─▶%F{015} '
RPROMPT=

# Aliases
alias ls="ls --color=auto"
alias la="ls -a"
alias l="ls"
alias cd/="cd /"
alias cd-="cd -"
alias cd..="cd .."
alias reboot="shutdown -r now"
alias poweroff="sudo poweroff"
alias off="shutdown -h now"
alias halt="sudo halt"
alias pacman="sudo pacman"
alias lock="~/configs/lock.sh"
alias sshxc="ssh -o VisualHostKey=yes mevouc@sd-80356.dedibox.fr"
alias cl="clear ; . ~/.zshrc"
alias wifi="sudo wifi-menu"
alias backlight="sudo tee /sys/class/backlight/intel_backlight/brightness <<<"
alias sl="sl -ac"
alias starwars="telnet towel.blinkenlights.nl"
alias mntwindows="sudo mount -t ntfs /dev/sda4 /windows"
alias :q="exit"
alias st="git status -s"
alias add="git add"
alias cmt="git commit"
alias psh="git push"
alias pll="git pull --rebase"

# key bindings
bindkey "e[1~" 	beginning-of-line
bindkey "e[4~"	end-of-line
bindkey "e[5~"	beginning-of-history
bindkey "e[6~"	end-of-history
bindkey "e[3~"	delete-char
bindkey "e[2~"	quoted-insert
bindkey "e[5C"	forward-word
bindkey "e0c"	emacs-forward-word
bindkey "e[5D"	backward-word
bindkey "e0d"	emacs-backward-word
bindkey "ee[C"	forward-word
bindkey "ee[D"	backward-word
bindkey "^H"	backward-delete-char
# for rxvt
bindkey "e[8~"	end-of-line
bindkey "e[7~"	beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "e[H"	beginning-of-line
bindkey "e[F"	end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

bindkey "^[[H" 	beginning-of-line
bindkey "[1~"	beginning-of-line
bindkey "^[[F"	end-of-line
bindkey "[4~"	end-of-line
bindkey "^[[3~"	delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[2~" overwrite-mode
bindkey "^[[A"	up-line-or-search
bindkey "^[[B"	down-line-or-search
bindkey	""	backward-delete-char
bindkey	""	backward-delete-word
bindkey	"Od"	backward-word
bindkey	"Oc"	forward-word

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]]	   && bindkey "${key[Insert]}"	  overwrite-mode
[[ -n ${key[Home]} ]]	   && bindkey "${key[Home]}"	  beginning-of-line
[[ -n ${key[PageUp]} ]]    && bindkey "${key[PageUp]}"	  up-line-or-history
[[ -n ${key[Delete]} ]]    && bindkey "${key[Delete]}"	  delete-char
[[ -n ${key[End]} ]]	   && bindkey "${key[End]}"	  end-of-line
[[ -n ${key[PageDown]} ]]  && bindkey "${key[PageDown]}"  down-line-or-history
[[ -n ${key[Up]} ]]	   && bindkey "${key[Up]}"	  up-line-or-search
[[ -n ${key[Left]} ]]	   && bindkey "${key[Left]}"	  backward-char
[[ -n ${key[Down]} ]]	   && bindkey "${key[Down]}"	  down-line-or-search
[[ -n ${key[Right]} ]]	   && bindkey "${key[Right]}"	  forward-char
