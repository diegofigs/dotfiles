#! /usr/bin/env bash

export MANPATH="$HOME/man:$MANPATH"
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

if [ "$(uname -s)" = "Darwin" ]; then
	prefix=$(brew --prefix)
	export BREW_PREFIX="$prefix"

	# since these are system binaries, prepend to ensure they are used
	# over system provided ones
	export PATH="$BREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH"
	export PATH="$BREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
	export PATH="$BREW_PREFIX/opt/curl/bin:$PATH"
fi

export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/build-tools/33.0.0"

export PATH="$PATH:$XDG_DATA_HOME/solana/install/active_release/bin"
export PATH="$PATH:$XDG_DATA_HOME/cargo/bin"
export PATH="$PATH:$HOME/.avm/bin"
export PATH="$PATH:$HOME/.config/.foundry/bin"

export PATH="$PATH:$HOME/.luarocks/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
