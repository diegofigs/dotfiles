#! /usr/bin/env bash

export MANPATH="$HOME/man:$MANPATH"
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export PATH="$PATH:$XDG_DATA_HOME/solana/install/active_release/bin"
export PATH="$PATH:$XDG_DATA_HOME/cargo/bin"
export PATH="$PATH:$HOME/.avm/bin"
export PATH="$PATH:$HOME/.config/.foundry/bin"
export PATH="$PATH:$HOME/.config/.cyfrin/bin"
export PATH="$PATH:$HOME/.luarocks/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
