if [ `uname -s` = "Darwin" ]; then
    eval $(/opt/homebrew/bin/brew shellenv)

    export BREW_PREFIX=$(brew --prefix)

    export PATH="$BREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH"
    export PATH="$BREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
    export PATH="$BREW_PREFIX/opt/curl/bin:$PATH"
else
    export PATH="$XDG_DATA_HOME/solana/install/active_release/bin:$PATH"
    export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
    export PATH="$HOME/.avm/bin:$PATH"
fi
