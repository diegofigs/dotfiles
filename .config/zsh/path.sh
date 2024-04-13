#! /usr/bin/env bash

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

if [ "$(uname -s)" = "Darwin" ]; then
	prefix=$(brew --prefix)
	export BREW_PREFIX="$prefix"

	export PATH="$BREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH"
	export PATH="$BREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
	export PATH="$BREW_PREFIX/opt/curl/bin:$PATH"
fi

export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/build-tools/33.0.0:$PATH"

export PATH="$XDG_DATA_HOME/solana/install/active_release/bin:$PATH"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
export PATH="$HOME/.avm/bin:$PATH"
export PATH="$HOME/.config/.foundry/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
