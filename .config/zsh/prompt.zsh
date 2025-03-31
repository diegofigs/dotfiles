#! /usr/bin/bash

unset SSH_AGENT_PID
ssh_auth_sock=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK=$ssh_auth_sock
export GPG_TTY=$TTY

gpgconf --launch gpg-agent

# Initialize cargo
. $CARGO_HOME/env

if [ "$(uname -s)" != "Darwin" ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    # source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Activate language manager
eval "$(mise activate zsh)"

# Activate shell prompt
eval "$(starship init zsh)"
# source $ZDOTDIR/.p10k.zsh
