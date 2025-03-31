#! /usr/bin/env bash

# Man colorized, no clear screen on quit
export MANPAGER="less -X -R --use-color -Dd+r -Du+b"
export LANG='en_US.UTF-8'

export PF_INFO="ascii title os wm shell editor uptime pkgs memory palette"

export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo

export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

export LUA_PATH='/Users/diegofigs/.local/share/mise/downloads/lua/5.1/lua-5.1/luarocks-3.11.1/src/?.lua;./?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua;;/Users/diegofigs/.luarocks/share/lua/5.1/?.lua;/Users/diegofigs/.luarocks/share/lua/5.1/?/init.lua;/Users/diegofigs/.local/share/mise/installs/lua/5.1/luarocks/share/lua/5.1/?.lua;/Users/diegofigs/.local/share/mise/installs/lua/5.1/luarocks/share/lua/5.1/?/init.lua'
export LUA_CPATH='./?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so;/Users/diegofigs/.luarocks/lib/lua/5.1/?.so;/Users/diegofigs/.local/share/mise/installs/lua/5.1/luarocks/lib/lua/5.1/?.so'

export KUBECONFIG="$KUBECONFIG:$HOME/.kube/config:$HOME/.kube/configs/learnk8s.yaml"
