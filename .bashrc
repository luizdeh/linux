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

# yt-dlp to mp3
ytmp3() {
	exec yt-dlp -f 'ba' -x --audio-format mp3 $1 -o '%(id)s.%(ext)s'
}

# ffmpeg recording of the laptop screen
mkvideo() {
	local VIDEO_NAME="$1"
	exec ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0+0,0 $VIDEO_NAME.mp4
}

# ffmpeg transform video to whatsapp compatible
whatsvideo() {
	local BROKEN_VIDEO="$1"
	local VIDEO_NAME="$2"
	exec ffmpeg -i $BROKEN_VIDEO.mp4 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p $VIDEO_NAME.mp4
}

# ssh to pc
alias deh='ssh deh@192.168.1.182'

# frogmouth
alias frog='frogmouth'

# shared folder
alias s='cd /mnt/data/share/Base'

# fzf
alias f='fzf --preview "bat --color=always --style=plain --line-range :500 {}"'

# combo
alias sf='s && f'
alias sv='s && nvim'

# navigation and terminal commands
alias h='cd ~'
alias nv='cd ~/.config/nvim && vi'
alias i3='nvim ~/.config/i3/config'
alias ls='exa -ls name --color=always --group-directories-first --git-ignore --icons'
alias la='exa -als name --color=always --group-directories-first --git-ignore --icons'
alias lt='exa -aT --color=always --group-directories-first --git-ignore --icons'
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
alias kbc='sudo g213-led -p ~/.config/g810_profile'

# grub & mkinitcpio
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mki='sudo mkinitcpio -P'
alias mk='sudo mkinitcpio -p'

# pacman
alias get='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias update='sudo pacman -Suy'
alias up='sudo pacman -Suy --noconfirm'
alias pacs='sudo pacman -Ss'
alias have='pacman -Qs'
alias showme='sudo pacman -Qi'
alias findme='sudo pacman -Si'
alias pcc='sudo pacman -Sc'
alias pkgs='sudo pacman -Qet'
alias pc='sudo pacman -Rs $(pacman -Qtdq)'

# yay
alias yg='yay -Sa'  # get package from the AUR
alias ys='yay -Ss'  # search for a package
alias yi='yay -Si'  # get information about a package
alias yc='yay -Yc'  # remove unnecessary dependencies
alias yu='yay -Sua' # update installed AUR packages
alias yp='yay -Ps'  # print information about the system

#git commits
alias ga='git add'
alias gr='git restore'
alias gco='git commit'

#git local version
alias gs='git status'
alias gl='git log'
alias gt='git stash'
alias pull='git pull'
alias push='git push'

#git branches
alias gm='git checkout main'
alias gch='git checkout'
alias gm='git merge'

# dotfiles git
alias cfg='/usr/bin/git --git-dir=/home/deh/.cfg/ --work-tree=/home/deh'
alias cfgc='cfg commit -m'
alias cfgs='cfg status'
alias cfgp='cfg push'

# startship
eval "$(starship init bash)"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
