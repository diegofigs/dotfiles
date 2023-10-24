#! /usr/bin/env bash
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Man colorized, no clear screen on quit
export MANPAGER="less -X -R --use-color -Dd+r -Du+b"
export LANG='en_US.UTF-8';

export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME}"/asdf/asdfrc
export ASDF_DATA_DIR="${XDG_DATA_HOME}"/asdf

export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

if [ "$(uname -s)" = "Darwin" ]; then
    export ANDROID_HOME=~/Library/Android/Sdk
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home

    prefix=$(brew --prefix)
    export BREW_PREFIX="$prefix"

    export PATH="$BREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH"
    export PATH="$BREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
    export PATH="$BREW_PREFIX/opt/curl/bin:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
else
    export ANDROID_HOME=~/Android/Sdk
fi

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/33.0.0

export PATH="$XDG_DATA_HOME/solana/install/active_release/bin:$PATH"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
export PATH="$HOME/.avm/bin:$PATH"
export PATH="$HOME/.config/.foundry/bin:$PATH"

export PF_INFO="ascii title os wm shell editor uptime pkgs memory palette"
