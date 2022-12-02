system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
    # Aliases
    alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
    alias grep='grep -n --color'

    # Command completion
    zstyle ':completion:*:*:git:*' script $BREW_PREFIX/etc/bash_completion.d/git-completion.bash

    # Initialize asdf
    . $BREW_PREFIX/opt/asdf/libexec/asdf.sh
else
    # Aliases
    alias spm='sudo pacman'
    alias i='yay -Sy'
    alias u='yay -Rsu'
    alias grep='grep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip -color=auto'
    alias wget='wget --hsts-file=$XDG_DATA_HOME/wget-hsts'
    alias xbindkeys='xbindkeys --file=$XDG_CONFIG_HOME/xbindkeys/config'
    alias nvidia-settigs='nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings'

    # Command completion
    zstyle ':completion:*:pacman:*' force-list always
    zstyle ':completion:*:*:pacman:*' menu yes select

    # Initialize asdf
    . /opt/asdf-vm/asdf.sh

    # Initialize cargo
    . $CARGO_HOME/env
fi
