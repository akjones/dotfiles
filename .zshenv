export PATH=/opt/homebrew/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:~/.local/bin:/usr/local/sbin:~/.config/emacs/bin:~/.emacs.d/bin:/opt/homebrew/opt/util-linux/sbin:/opt/homebrew/opt/util-linux/bin:~/.jenv/bin:~/.rvm/bin:~/.asdf/shims:/opt/homebrew/sbin:$HOME/.cargo/bin:${KREW_ROOT:-$HOME/.krew}/bin:~/.dotnet/tools:"$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# Homebrew (static — avoids spawning `brew shellenv` subprocess)
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"