# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="oxide"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zoxide zsh-autosuggestions zsh-autocomplete zsh-syntax-highlighting zsh-nvm-lazy-load)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '/home/deh/.zshrc'

autoload -Uz compinit
compinit
# autoload -Uz promptinit
# promptinit

export BROWSER='chromium'
export EDITOR='nvim'

# yt-dlp to mp3
ytmp3() {
	exec yt-dlp -f 'ba' -x --audio-format mp3 $1 -o '%(id)s.%(ext)s'
}

# ffmpeg
mkVideoLaptop() {
  local VIDEO_NAME="$1"
  exec ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0+0,0 $VIDEO_NAME.mp4
}

mkVideoMonitor() {
  local VIDEO_NAME="$1"
  exec ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0+1920,0 $VIDEO_NAME.mp4
}

mkVideoAudioLaptop() {
  local VIDEO_NAME="$1"
  exec ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i hw:0 $VIDEO_NAME.mkv
}

mkVideoAudioMonitor() {
  local VIDEO_NAME="$1"
  exec ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0+1920,0 -f alsa -ac 2 -i hw:0 $VIDEO_NAME.mkv
}

# ffmpeg transform video to whatsapp compatible
whatsvideo() {
	local BROKEN_VIDEO="$1"
	local VIDEO_NAME="$2"
	exec ffmpeg -i $BROKEN_VIDEO.mp4 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p $VIDEO_NAME.mp4
}

# ffmpeg -i THIS.mkv -c copy THAT.mp4

timezsh() { time zsh -ic exit &>/dev/null }

alias mysql=mariadb

alias zed='vi ~/.zshrc'

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
alias tads='cd /mnt/data/share/Base/TADS/ && nvim'

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
# alias reload='source ~/.bashrc ~/.bash_profile'
alias reload='exec zsh'
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
alias gcm='git checkout main'
alias gch='git checkout'
alias gm='git merge'

# dotfiles git
alias cfg='/usr/bin/git --git-dir=/home/deh/.cfg/ --work-tree=/home/deh'
alias cfgc='cfg commit -m'
alias cfgs='cfg status'
alias cfgp='cfg push'

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
