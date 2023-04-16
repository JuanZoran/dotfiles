-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')
_G.awful     = require 'awful'     -- Standard awesome library
_G.wibox     = require 'wibox'     -- Widget and layout library
_G.beautiful = require 'beautiful' -- Theme handling library
_G.gears     = require 'gears'
_G.naughty   = require 'naughty'   -- Notification library
_G.lain      = require 'lain'
_G.bling     = require 'lib.bling' -- Notification library

require 'core.error_handle'
require 'core.util'
require 'core.conf'


awful.layout.layouts = conf.layout
-- HACK :
--  ╭──────────────────────────────────────────────────────────╮
--  │                         Set keys                         │
--  ╰──────────────────────────────────────────────────────────╯
local key = require 'core.mappings'
root.buttons(key.mouse)
root.keys(key.global)


beautiful.init(util.conf_dir .. '/theme/theme.lua')
require 'ui'

require 'core.rules'
require 'core.titlebar'
require 'core.signals'

-- HACK :
--  ╭──────────────────────────────────────────────────────────╮
--  │                          Script                          │
--  ╰──────────────────────────────────────────────────────────╯
awful.spawn.with_shell 'bash ~/.config/awesome/script/autorun.sh'
-- os.execute 'bash ~/.config/awesome/script/sync.sh'
-- awful.spawn 'xrandr  --output HDMI-0 --mode 2560x1440  --pos 0x0 --rate 75 --primary --output DP-2 --pos 2560x360 --auto'
