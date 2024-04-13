#! /usr/bin/env bash

unset SSH_AGENT_PID
ssh_auth_sock=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK=$ssh_auth_sock

export GPG_TTY=$TTY

# Man colorized, no clear screen on quit
export MANPAGER="less -X -R --use-color -Dd+r -Du+b"
export LANG='en_US.UTF-8'

export PF_INFO="ascii title os wm shell editor uptime pkgs memory palette"

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
else
	export ANDROID_HOME=~/Android/Sdk
fi
