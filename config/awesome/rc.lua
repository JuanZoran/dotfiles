-- os.execute 'bash ~/.config/awesome/script/sync.sh'
-- awful.spawn 'xrandr  --output HDMI-0 --mode 2560x1440  --pos 0x0 --rate 75 --primary --output DP-2 --pos 2560x360 --auto'
pcall(require, 'luarocks.loader')
_G.awful     = require 'awful' -- Standard awesome library
_G.wibox     = require 'wibox' -- Widget and layout library

---@class beautiful
_G.beautiful = require 'beautiful' -- Theme handling library
_G.gears     = require 'gears'     --
_G.naughty   = require 'naughty'   -- Notification library
-- _G.lain      = require 'lain'      --
_G.bling     = require 'lib.bling' -- Notification library

-- HACK :
--  ╭──────────────────────────────────────────────────────────╮
--  │                          Script                          │
--  ╰──────────────────────────────────────────────────────────╯
-- naughty.notify { text = 'end:' .. beautiful.border_foucs }
awful.spawn.with_shell 'bash ~/.config/awesome/script/autorun.sh'

print = function(...)
    for _, v in ipairs { ... } do
        naughty.notify { text = tostring(v) }
    end
end

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
awful.key.ignore_modifiers = { 'Lock', 'Mod2' }
-- awful.keygrabber {
--     keybindings    = {
--         awful.key {
--             modifiers = { 'Control'},
--             key       = 'z',
--             on_press  = function(self)
--                 print('Is now active!', self)
--             end,
--         },
--     },
--     stop_key            = 'Escape',
--     stop_event          = 'press',
--     keypressed_callback = function(_, modifiers, key)
--         print('A key was pressed:', key, 'with', #modifiers, 'modifier!')
--     end,
--     export_keybindings  = true,
-- }

require 'ui'
require 'core.rules'
require 'core.titlebar'
require 'core.signals'


