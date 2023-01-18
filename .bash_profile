# default
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export TERMINAL=/usr/bin/kitty
export BROWSER=chromium

# path
export PATH="${PATH}:/home/deh/bin"
export PATH="${PATH}:/home/deh/.config/rofi/bin"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --follow --exclude={node_modules,dist}'
export FZF_DEFAULT_OPTS='--reverse --cycle --preview-window=right,65% --bind shift-up:preview-up,shift-down:preview-down --info=inline --color=fg:#d0d0d0,bg:#323d43,hl:#aba393 --color=fg+:#d3c6aa,bg+:#505a60,hl+:#aba393 --color=info:#96ac73,prompt:#a7c080,pointer:#a7c080 --color=marker:#a7c080,spinner:#a7c080,header:#d3c6aa'
export FZF_ALT_C_COMMAND='fd --type d . $HOME'

# bat
export BAT_THEME='Nord'

if [[ -f ~/.bashrc ]]; then . ~/.bashrc; fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
