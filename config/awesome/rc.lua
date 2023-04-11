-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')

_G.awful     = require 'awful'     -- Standard awesome library
_G.wibox     = require 'wibox'     -- Widget and layout library
_G.beautiful = require 'beautiful' -- Theme handling library
_G.gears     = require 'gears'
_G.naughty   = require 'naughty'   -- Notification library

awful.spawn.with_shell 'bash ~/.config/awesome/autorun.sh'

-- INFO : bling module
_G.bling   = require 'lib.bling'
-- _G.rubato    = require 'lib.rubato'
-- INFO :Config Loader
require 'core'
