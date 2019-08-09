export TERM="xterm-256color"

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='powerlevel9k/powerlevel9k'
if [[ `uname` == 'Darwin' ]] then
    POWERLEVEL9K_MODE='nerdfont-complete'
fi

# Mac aliases
if [[ `uname` == 'Darwin' ]] then
  alias v='mvim'
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
  alias love="/Applications/love.app/Contents/MacOS/love"
fi

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
alias rc='rails console'
alias rg='rails generate'
alias rs='rails server thin'
alias be='bundle exec'
alias berspec='bundle exec rspec'

plugins=(git asdf brew osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
unsetopt histverify

export PATH=$PATH:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:~/.local/bin:/usr/local/sbin

if [[ `uname` == 'Darwin' ]] then
  export GOPATH=$HOME/src/go
  export PATH=$PATH:$GOPATH/bin

  export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
  export PGDATA='/usr/local/var/postgres'
  export EXTEMPORE='/usr/local/Cellar/extempore/HEAD'

  export HOMEBREW_NO_ANALYTICS=1
fi

if [[ `uname` == 'Linux' ]] then
  export ARDUINO_DIR=/home/andrew/lib/arduino
  export ARDMK_DIR=/home/andrew/projects/arduino/Arduino-Makefile
  export AVR_TOOLS_DIR=/usr

  export GOPATH=$HOME/src/go
  export PATH=$PATH:$GOPATH/bin/*
  export PATH=$PATH:/opt/go/1.12.2/bin

  function bw_unlock() {
      export "$(bw unlock | grep '$ export' | awk '{ print $3}')"
  }

  alias clip='xsel -ib'
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

asdf_init=$(brew --prefix asdf)/asdf.sh
asdf_completions=$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
chmod 755 $asdf_init
chmod 755 $asdf_completions
$asdf_init
$asdf_completions

fortune | ponysay
