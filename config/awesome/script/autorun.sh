#!/usr/bin/env bash
run() {
    if ! pgrep -f "$1" ; then
        "$@"&
    fi
}

run picom
run qq
run telegram
run flameshot



# NetWork Manager
run nm-applet --sm-disable
# remap Ctrl to escape
run xcape -e 'Control_L=Escape'


# autolock screen
run xautolock -time 10 -locker 'betterlockscreen -l dim' # 在无操作十分种后锁定会话
