#! /usr/bin/zsh
# Execute code in the background
{
    zcompdump="$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
    if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
        zcompile "$zcompdump"
    fi
} &!
