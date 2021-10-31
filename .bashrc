[[ $- != *i* ]] && return

PS1='\[\e[1;36m\]\w \[\e[1;32m\]$ \[\e[0m\]'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
alias reload='source ~/.bashrc'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias fonts='sudo fc-cache -fv'
alias update='sudo pacman -Suy'
alias search='sudo pacman -Ss'
alias merge='xrdb -merge .Xresources'
alias mocp='mocp --theme 30equals'