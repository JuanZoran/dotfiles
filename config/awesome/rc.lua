pcall(require, 'luarocks.loader')
_G.awful     = require 'awful' -- Standard awesome library
_G.wibox     = require 'wibox' -- Widget and layout library

---@class beautiful
_G.beautiful = require 'beautiful' -- Theme handling library
_G.gears     = require 'gears'     --
_G.naughty   = require 'naughty'   -- Notification library
_G.bling     = require 'lib.bling' -- Notification library


print = function(...)
    local inspect = require 'inspect'

    for _, v in ipairs { ... } do
        naughty.notify { text = inspect(v) }
    end
end

require 'core.error_handle'
require 'core.util'
require 'core.conf'

-- HACK :
--  ╭──────────────────────────────────────────────────────────╮
--  │                          Script                          │
--  ╰──────────────────────────────────────────────────────────╯
-- naughty.notify { text = 'end:' .. beautiful.border_foucs }
awful.spawn.with_shell 'bash ~/.config/awesome/script/autorun.sh'

awful.layout.layouts = conf.layout
require 'ui'
require 'core.titlebar'
require 'core.rules'
require 'core.signals'
require 'core.keymap'
-- os.execute 'bash ~/.config/awesome/script/sync.sh'
-- awful.spawn 'xrandr  --output HDMI-0 --mode 2560x1440  --pos 0x0 --rate 75 --primary --output DP-2 --pos 2560x360 --auto'
