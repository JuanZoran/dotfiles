#!/usr/bin/env bash
run() {
    if ! pgrep -f "$1" ; then
        "$@"&
    fi
}
run picom & # compositor
# run autorandr -c
run flameshot # Screenshot
run qq
run telegram
run utools # Utility
run nm-applet --sm-disable # Network Manager
# run xidlehook --not-when-fullscreen --not-when-audio \
run xidlehook --not-when-audio \
    --timer 600 'betterlockscreen -l dim' ''  \
    --timer 1000 'systemctl suspend' ''


# scroll
synclient \
    VertScrollDelta=-44 \
    HorizScrollDelta=-44 \
    PalmDetect=1 \
    TapButton1=1 \
    TapButton2=3 \

run xmodmap "$HOME"/.Xmodmap # remap CapsLock to Ctrl
run xcape -e 'Control_L=Escape' # remap Ctrl to escape


# run variety # Wallpaper
# run latte-dock
# run xautolock -time 10 -locker 'betterlockscreen -l dim' # 在无操作十分种后锁定会话
# run eww daemon
# "$HOME"/.config/eww/run
# kill -q polybar
# sleep 0.3
# polybar --config=/home/zoran/.config/polybar/config.ini left &
# polybar --config=/home/zoran/.config/polybar/config.ini middle &
# polybar --config=/home/zoran/.config/polybar/config.ini right &
# for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload --config=/home/zoran/.config/polybar/config.ini left &
#     MONITOR=$m polybar --reload --config=/home/zoran/.config/polybar/config.ini middle &
#     MONITOR=$m polybar --reload --config=/home/zoran/.config/polybar/config.ini right &
# done
