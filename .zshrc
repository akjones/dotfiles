# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# General aliases
alias runHotJetty="gradle -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=1337 jettyRun"
alias start_mongo="mongod run --config /usr/local/etc/mongod.conf"
alias start_pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias v="mvim"

# Git aliases
alias gpr="git pull --rebase"
alias gspr="git stash; git pull --rebase; git stash pop"

# Rails aliases
alias berspec="bundle exec rspec"

# GetUp! aliases
alias getup_bastion="ssh ubuntu@204.236.229.45"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew gradle osx pip ruby gem rvm)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:/users/akjones/lib/gradle/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
