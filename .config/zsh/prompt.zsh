system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
    source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $BREW_PREFIX/opt/powerlevel10k/powerlevel10k.zsh-theme
else
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi
source $ZDOTDIR/.p10k.zsh
