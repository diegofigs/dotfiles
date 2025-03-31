#! /usr/bin/env bash
# aliases
alias sudo='sudo '
alias nf='neofetch'
alias vim='nvim'
alias pn='pnpm'
alias tf='terraform'
alias dot='yadm'
alias cat='bat'
alias ls='eza --icons --group-directories-first'
alias l='ls -l'
alias la='ls -la'
alias ll='la'
alias lf='ls -lF'

if [ "$(uname -s)" != "Darwin" ]; then
  alias spm='sudo pacman'
  alias add='yay -Sy'
  alias update='yay -Syu'
  alias remove='yay -R'
  alias remove-s='yay -Rs'
  alias remove-su='yay -Rsu'
  alias grep='grep --color=auto'
  alias diff='diff --color=auto'
  alias ip='ip -color=auto'
  alias wget='wget --hsts-file=$XDG_DATA_HOME/wget-hsts'
  alias xbindkeys='xbindkeys -f $XDG_CONFIG_HOME/xbindkeys/config'
  alias nvidia-settings='nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings'
fi
