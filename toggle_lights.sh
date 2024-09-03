#!/usr/bin/env zsh

set -e

source $(brew --prefix asdf)/libexec/asdf.sh
jq=$(brew --prefix jq)/bin/jq

sound_lights='--host 192.168.3.59'

asdf exec pip list | grep python-kasa > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    asdf exec pip install python-kasa
fi

on() {
   asdf exec kasa --type plug "${=sound_lights}" on
}

off() {
   asdf exec kasa --type plug "${=sound_lights}" off
}

state() {
   asdf exec kasa --json --type plug "${=sound_lights}" state | $jq .system.get_sysinfo.on_time
}

current=$(state)

if [[ $current -eq 0 ]]; then
    on
else
    off
fi
