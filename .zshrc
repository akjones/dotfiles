export TERM="xterm-256color"

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='powerlevel9k/powerlevel9k'

# General aliases
alias start_mongo='mongod run --config /usr/local/etc/mongod.conf'
alias start_pg='pg_ctl -l /usr/local/var/postgres/server.log start'
alias start_redis='redis-server /usr/local/etc/redis.conf'
alias start_es='elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'

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

# Python aliases
alias virtualenv='python ~/.local/lib/python2.7/site-packages/virtualenv.py'

plugins=(git brew osx pip ruby gem rvm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
unsetopt histverify

export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:/usr/local/share/npm/bin:~/.local/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export PATH=$PATH:$NVM_BIN
export PATH=$PATH:/usr/local/opt/go/libexec/bin

if [[ `uname` == 'Darwin' ]] then
  export PATH=$PATH:/Users/akjones/lib/gradle/bin

  export NVM_DIR=~/.nvm
  source ~/.nvm/nvm.sh
  alias node='$NVM_BIN/node'
  alias npm='$NVM_BIN/npm'

  export GOPATH=$HOME/projects/go
  export PATH=$PATH:$GOPATH/bin

fi

# Environment variables
if [[ `uname` == 'Linux' ]] then
  export ARDUINO_DIR=/home/andrew/lib/arduino
  export ARDMK_DIR=/home/andrew/projects/arduino/Arduino-Makefile
  export AVR_TOOLS_DIR=/usr

  export NVM_DIR=~/.nvm
  source ~/.nvm/nvm.sh
  alias node='$NVM_BIN/node'
  alias npm='$NVM_BIN/npm'
fi

if [[ `uname` == 'Darwin' ]] then
  export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
  export PGDATA='/usr/local/var/postgres'
  export EXTEMPORE='/usr/local/Cellar/extempore/HEAD'

  export GHC_DOT_APP="/opt/homebrew-cask/Caskroom/ghc/7.8.4-r0/ghc-7.8.4.app"
  if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:/Users/akjones/.cabal/share/x86_64-osx-ghc-7.8.4:${PATH}"
  fi

  export HOMEBREW_NO_ANALYTICS=1
fi


[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

nvm use stable --silent
