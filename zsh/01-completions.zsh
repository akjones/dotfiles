FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"
typeset -U fpath  # deduplicate

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Run when you install new tools / completions change
alias zsh-reload-completions='rm -f ~/.zcompdump; compinit'

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
