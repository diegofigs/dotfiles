# Make vim the default editor.
export EDITOR='nvim';
# Man colorized, no clear screen on quit
export MANPAGER="less -X -R --use-color -Dd+r -Du+b"

export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=30000;
export SAVEHIST=24000;

export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME}"/asdf/asdfrc
export ASDF_DATA_DIR="${XDG_DATA_HOME}"/asdf

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
