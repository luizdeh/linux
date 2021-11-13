[[ $- != *i* ]] && return

#PS1='\[\e[1;36m\]\w \@h \w[\e[1;32m\]$ \[\e[0m\]'

PS1="\t \[$(tput bold)\]>\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\] \[$(tput bold)\][\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\] \[$(tput bold)\]]\[$(tput sgr0)\] \[$(tput bold)\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

shopt -s cdspell
shopt -s histappend
HISTCONTROL=ignoreboth

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias l='ls -l'
alias la='ls -lA'
alias fdir='find . -type d -name'
alias ff='find . -type f -name'
alias lgrep='ls -l | grep'
alias lagrep='ls -lA | grep'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias gh='history | grep'

alias ping='ping -c 5'
alias c='clear'
alias mkdir='mkdir -pv'
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias dl='cd ~/Downloads && ls -lA'
alias ursh='cd /usr/share && ls -lA'

alias jctl="journalctl -p 3 -xb"

#alias fuck='sudo !!'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias update='sudo pacman -Suy'
alias search='sudo pacman -Ss'
alias clean='sudo pacman -Qdtq | sudo pacman -Rs -'
alias have='pacman -Qs'
alias showme='sudo pacman -Qi'
alias findme='sudo pacman -Si'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

alias instally='yay -S'
alias searchy='yay -Ss'
alias cleany='yay -Yc'
alias updatey='yay -Syu'

alias reload='source ~/.bashrc'
alias fonts='sudo fc-cache -fv'
alias merge='xrdb -merge .Xresources'

alias kc='g810-led -p /etc/g810-led/profile'
alias top='bashtop'

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
