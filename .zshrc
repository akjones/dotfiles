# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME='alanpeabody'

# Example aliases
# alias zshconfig='mate ~/.zshrc'
# alias ohmyzsh='mate ~/.oh-my-zsh'

# General aliases
alias runHotJetty='gradle -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=1337 jettyRun'
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

# Git aliases
alias gs='git status'
alias ga='git add'
alias gci='git commit'
alias gco='git checkout '
alias gp='git push'
alias gpr='git pull --rebase'
alias gspr='git stash; git pull --rebase; git stash pop'

# Rails aliases
alias rc='rails console'
alias rg='rails generate'
alias rs='rails server thin'
alias be='bundle exec'
alias berspec='bundle exec rspec'

# GetUp! aliases
alias getup_bastion='ssh ubuntu@204.236.229.45'
alias getup_ci='ssh jenkins@192.168.1.151'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE='true'

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE='true'

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS='true'

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE='true'

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS='true'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew gradle osx pip ruby gem rvm)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
unsetopt histverify

# Customize to your needs...
export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:/users/akjones/lib/gradle/bin:/usr/local/share/npm/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

if [[ `uname` == 'Darwin' ]] then
  export PATH=$PATH:/users/akjones/lib/gradle/bin
fi

# Use Vim key bindings
bindkey -v

# Custom keybindings
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

if [[ `uname` == 'Linux' ]] then
  export ARDUINO_DIR=/home/andrew/lib/arduino
  export ARDMK_DIR=/home/andrew/projects/arduino/Arduino-Makefile
  export AVR_TOOLS_DIR=/usr
fi

if [[ `uname` == 'Darwin' ]] then
  export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
  export PGDATA='/usr/local/var/postgres'
fi
