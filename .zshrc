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

asdf current java > /dev/null 2>&1 && export JAVA_HOME=$(asdf where java)
export PATH=$PATH:/$JAVA_HOME/bin

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
