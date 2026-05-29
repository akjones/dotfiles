if [[ "$(uname)" == 'Darwin' ]]; then
  export HOMEBREW_NO_ANALYTICS=1

  autojump_init="$HOMEBREW_PREFIX/opt/autojump/etc/profile.d/autojump.sh"
  [[ -f "$autojump_init" ]] && source "$autojump_init"
fi

if [[ "$(uname)" == 'Linux' ]]; then
  export ARDUINO_DIR=/home/andrew/lib/arduino
  export ARDMK_DIR=/home/andrew/projects/arduino/Arduino-Makefile
  export AVR_TOOLS_DIR=/usr

  function bw_unlock() {
    export "$(bw unlock | grep '$ export' | awk '{ print $3}')"
  }

  alias clip='xsel -ib'
  source /usr/share/autojump/autojump.sh
fi
