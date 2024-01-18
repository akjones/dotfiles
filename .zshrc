# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='powerlevel10k/powerlevel10k'

plugins=(git brew macos zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
unsetopt histverify

# Emacs aliases
alias ed='emacs --daemon'
alias edk='emacsclient -e "(kill-emacs)"'

function ec() {
  emacsclient -c -a "" "$*" &
}

# Git aliases
alias gs='git status'
alias ga='git add'
alias gci='git commit'
alias gco='git checkout '
alias gp='git push'
alias gpr='git pull --rebase'
alias gpom='git push origin master'
alias gspr='git stash; git pull --rebase; git stash pop'

# Rails aliases
alias rails='bundle exec rails'
alias rake='bundle exec rake'
alias rubocop='bundle exec rubocop'
alias guard='bundle exec guard'
alias rspec='bundle exec rspec'
alias be='bundle exec'

alias arst='asdf'

if [[ `uname` == 'Darwin' ]] then
  export HOMEBREW_NO_ANALYTICS=1
fi

if [[ `uname` == 'Linux' ]] then
  export ARDUINO_DIR=/home/andrew/lib/arduino
  export ARDMK_DIR=/home/andrew/projects/arduino/Arduino-Makefile
  export AVR_TOOLS_DIR=/usr

  function bw_unlock() {
      export "$(bw unlock | grep '$ export' | awk '{ print $3}')"
  }

  alias clip='xsel -ib'

  source /usr/share/autojump/autojump.sh
fi

ASDF_DIR=$HOME/.asdf
source ${ASDF_DIR}/asdf.sh

fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit

autojump_init=$(brew --prefix autojump)/etc/profile.d/autojump.sh
[ -f ${autojump_init} ] && . ${autojump_init}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

asdf_init=$(brew --prefix asdf)/libexec/asdf.sh
asdf_completions=$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
chmod 755 $asdf_init
chmod 755 $asdf_completions
source $asdf_init
$asdf_completions

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

for file in ~/.akj_profiles/*; do
  source "${file}"
done
