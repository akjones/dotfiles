zmodload zsh/datetime
autoload -Uz vcs_info colors && colors

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats       ' (%b%u%c)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a%u%c)'

setopt PROMPT_SUBST

_cmd_start=

function preexec() { _cmd_start=$EPOCHREALTIME }

function precmd() {
  vcs_info
  if [[ -n $_cmd_start ]]; then
    local elapsed=$(( EPOCHREALTIME - _cmd_start ))
    if (( elapsed >= 2 )); then
      printf -v _cmd_duration ' %ss' "${elapsed%.*}"
    else
      _cmd_duration=''
    fi
  else
    _cmd_duration=''
  fi
  _cmd_start=
}

PROMPT='%F{cyan}%(5~|%-1~/…/%3~|%~)%f%F{yellow}${vcs_info_msg_0_}%f%F{243}${_cmd_duration}%f %(?.%F{green}.%F{red})❯%f '
