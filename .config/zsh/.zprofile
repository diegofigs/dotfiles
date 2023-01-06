#! /usr/bin/zsh
export SHELL_SESSIONS_DISABLE=1

if [ "$(uname -s)" = "Darwin" ]; then
    # Set PATH, MANPATH, etc., for Homebrew.
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
