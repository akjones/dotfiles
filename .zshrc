export TERM="xterm-256color"

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='powerlevel9k/powerlevel9k'
if [[ `uname` == 'Darwin' ]] then
    POWERLEVEL9K_MODE='nerdfont-complete'
fi

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

asdf current java > /dev/null 2>&1 && export JAVA_HOME=$(asdf where java)
export PATH=$PATH:/$JAVA_HOME/bin

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source /Users/akjones/.asdf/installs/rust/1.40.0/env

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
