#!/usr/bin/env bash
run() {
    if ! pgrep -f "$1" ; then
        "$@"&
    fi
}

# run autorandr -c
run flameshot
run telegram
run picom
run utools
# feh --randomize --bg-fill ~/background/*
run variety



killall -q polybar
polybar --config=/home/zoran/.config/polybar/config.ini left &
# polybar --config=/home/zoran/.config/polybar/config.ini middle &
polybar --config=/home/zoran/.config/polybar/config.ini right &

# NetWork Manager
run nm-applet --sm-disable
# remap Ctrl to escape
run xcape -e 'Control_L=Escape'

# autolock screen
run xautolock -time 10 -locker 'betterlockscreen -l dim' # 在无操作十分种后锁定会话
