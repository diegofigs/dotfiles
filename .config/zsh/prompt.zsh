#! /usr/bin/bash
# Initialize cargo
. $CARGO_HOME/env

if [ "$(uname -s)" = "Darwin" ]; then
    source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    # source $BREW_PREFIX/opt/powerlevel10k/powerlevel10k.zsh-theme

    # Activate rtx
    eval "$(rtx activate zsh)"
else
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    # source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

    # Initialize asdf
    . /opt/asdf-vm/asdf.sh
fi
# source $ZDOTDIR/.p10k.zsh

eval "$(starship init zsh)"
