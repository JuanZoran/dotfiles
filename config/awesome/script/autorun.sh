#!/usr/bin/env bash
run() {
    if ! pgrep -f "$1" ; then
        "$@"&
    fi
}

# run autorandr -c
run flameshot # Screenshot
run telegram
run picom # compositor
run utools # Utility
run variety # Wallpaper
# run latte-dock
run nm-applet --sm-disable # Network Manager
run xcape -e 'Control_L=Escape' # remap Ctrl to escape

run xidlehook --not-when-fullscreen --not-when-audio --timer 600 'betterscreenlock -l dim' ''
# run xautolock -time 10 -locker 'betterlockscreen -l dim' # 在无操作十分种后锁定会话
# run eww daemon
# "$HOME"/.config/eww/run


sleep 0.4
killall -q polybar
polybar --config=/home/zoran/.config/polybar/config.ini left &
polybar --config=/home/zoran/.config/polybar/config.ini middle &
polybar --config=/home/zoran/.config/polybar/config.ini right &
