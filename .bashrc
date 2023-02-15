# bash
[[ $- != *i* ]] && return

shopt -s histappend
shopt -s checkwinsize

HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=10000

# user scripts
# for i in $HOME/bin/*.sh;
#    do source $i
# done

# shared folder
alias s='cd /mnt/data/share/Base'

# fzf
alias f='fzf --preview "bat --color=always --style=plain --line-range :500 {}"'

# combo
alias sf='s && f'

# navigation and terminal commands
alias ls='exa -ls name --color=always --group-directories-first --git-ignore --icons' # my preferred listing
alias la='exa -als name --color=always --group-directories-first --git-ignore --icons'  # all files and dirs
alias lt='exa -aT --color=always --group-directories-first --git-ignore --icons' # tree listing
alias grep='grep --color=auto'
alias agrep='alias | grep'
alias gh='history 500 | fzf --reverse --cycle'
alias mkdir='mkdir -pv'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -I'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cd..='cd ..'
alias ..='cd ..'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias c='clear'
alias jctl="journalctl -p 3 -xb"
alias reload='source ~/.bashrc ~/.bash_profile'
alias cat='bat'

# misc
alias wget='wget -c'
alias ping='ping -c 5'
alias fonts='sudo fc-cache -fv'
alias top='btop'
alias vim='nvim'
alias vi='nvim'
alias ncm='ncmpcpp'
alias dmesg='dmesg -T'
alias kb='setxkbmap br'
alias kbc='g213-led -p ~/.config/g810_profile'

# grub & mkinitcpio
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mki='sudo mkinitcpio -P'
alias mk='sudo mkinitcpio -p'

# pacman
alias get='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias update='sudo pacman -Suy'
alias pacs='sudo pacman -Ss'
alias have='pacman -Qs'
alias showme='sudo pacman -Qi'
alias findme='sudo pacman -Si'
alias pcc='sudo pacman -Sc'
alias pkgs='sudo pacman -Qet'
alias pc='sudo pacman -Rs $(pacman -Qtdq)'

# yay
alias yg='yay -Sa' # get package from the AUR
alias ys='yay -Ss' # search for a package
alias yi='yay -Si' # get information about a package
alias yc='yay -Yc' # remove unnecessary dependencies
alias yu='yay -Sua' # update installed AUR packages
alias yp='yay -Ps' # print information about the system

# git
alias gs='git status'
alias gc='git commit -m'
alias gr='git restore'
alias ga='git add'
alias gl='git log'
alias gt='git stash'
alias push='git push'
alias pull='git pull'

# dotfiles git
alias cfg='/usr/bin/git --git-dir=/home/deh/.cfg/ --work-tree=/home/deh'
alias cfgc='cfg commit -m'
alias cfgs='cfg status'
alias cfgp='cfg push'

# startship
eval "$(starship init bash)"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
