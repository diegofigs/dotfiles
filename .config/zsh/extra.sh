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

    ##### asdf #####
    # placeholder asdf shell function
    # On first use, it will set asdf up properly which will replace the `asdf`
    # shell function with the real one
    asdf() {
        if [[ -d '/opt/asdf-vm' ]]; then
            unfunction "$0"
            # Initialize asdf
            . /opt/asdf-vm/asdf.sh
            # invoke the real asdf function now
            asdf "$@"
        else
            echo "asdf is not installed" >&2
            return 1
        fi
    }

    # Initialize cargo
    . $CARGO_HOME/env
fi
