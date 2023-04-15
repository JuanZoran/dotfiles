-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')
_G.awful     = require 'awful'     -- Standard awesome library
_G.wibox     = require 'wibox'     -- Widget and layout library
_G.beautiful = require 'beautiful' -- Theme handling library
_G.gears     = require 'gears'
_G.naughty   = require 'naughty'   -- Notification library

-- os.execute 'bash ~/.config/awesome/script/sync.sh'
-- awful.spawn 'xrandr  --output HDMI-0 --mode 2560x1440  --pos 0x0 --rate 75 --primary --output DP-2 --pos 2560x360 --auto'

_G.bling = require 'lib.bling' -- Notification library

require 'core'
awful.spawn.with_shell 'bash ~/.config/awesome/script/autorun.sh'
