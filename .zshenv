export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:~/.local/bin:/usr/local/sbin:$HOME/.pulumi/bin:/$JAVA_HOME/bin:~/.cargo/bin

asdf_init=$(brew --prefix asdf)/asdf.sh
asdf_completions=$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
chmod 755 $asdf_init
chmod 755 $asdf_completions
$asdf_init
$asdf_completions
