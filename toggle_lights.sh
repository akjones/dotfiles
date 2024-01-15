#!/usr/bin/env bash

set -e

on() {
   asdf exec kasa --type plug --alias 'Sound & lights' on
}

off() {
   asdf exec kasa --type plug --alias 'Sound & lights' off
}

state() {
   echo $(asdf exec kasa --json --type plug --alias 'Sound & lights' state | jq .system.get_sysinfo.on_time)
}

current=$(state)

if [[ $current -eq 0 ]]; then
    on
else
    off
fi
