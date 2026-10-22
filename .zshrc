eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR="nvim"
export VISUAL="$EDITOR"

export GOPATH=$(go env GOPATH)
export PATH="$GOPATH/bin:$PATH"

. "$HOME/.local/bin/env"

if [[ -n "$TMUX" ]]; then
    printf '\e[5 q'
fi

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'


setopt PROMPT_SUBST
PROMPT='➜ %F{#66b2b2}%2~%f %F{#ff6b6b}${vcs_info_msg_0_}%f '
