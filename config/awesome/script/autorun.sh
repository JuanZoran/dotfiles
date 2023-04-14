#!/usr/bin/env bash
run() {
    if ! pgrep -f "$1" ; then
        "$@"&
    fi
}

source /home/zoran/zsh/exports.zsh

run autorandr -c

run flameshot
run telegram
run picom

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
