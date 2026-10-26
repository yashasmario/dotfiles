if [[ "$(uname)" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export EDITOR="nvim"
export VISUAL="$EDITOR"

export GOPATH=$(go env GOPATH)
export PATH="$GOPATH/bin:$PATH"

[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'

setopt PROMPT_SUBST
PROMPT='➜ %F{#66b2b2}%2~%f %F{#ff6b6b}${vcs_info_msg_0_}%f '
