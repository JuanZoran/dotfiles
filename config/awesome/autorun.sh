#!/usr/bin/env bash
run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run xcape -e 'Control_L=Escape'

# For setup the screen layout correctly
# 设置位置
run xrandr  --output HDMI-0 --mode 2560x1440  --pos 0x0 --rate 75 --primary --output DP-2 --pos 2560x360 --auto

run qq

# NetWork Manager
run nm-applet --sm-disable
