#! /usr/bin/env bash
# Man colorized, no clear screen on quit
export MANPAGER="less -X -R --use-color -Dd+r -Du+b"
export LANG='en_US.UTF-8';

export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME}"/asdf/asdfrc
export ASDF_DATA_DIR="${XDG_DATA_HOME}"/asdf

export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo

export PF_INFO="ascii title os wm shell editor uptime pkgs memory palette"
