pcall(require, 'luarocks.loader')
_G.awful     = require 'awful' -- Standard awesome library
_G.wibox     = require 'wibox' -- Widget and layout library

---@class beautiful
_G.beautiful = require 'beautiful' -- Theme handling library
_G.gears     = require 'gears'     --
_G.bling     = require 'lib.bling' -- Notification library

print        = function(...)
    local inspect = require 'inspect'
    for _, v in ipairs { ... } do
        require 'naughty'.notify { text = inspect(v) }
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
require 'core.keymap'
require 'core.signals'
require 'core.rules'
require 'ui'
require 'core.titlebar'

-- os.execute 'bash ~/.config/awesome/script/sync.sh'
-- awful.spawn 'xrandr  --output HDMI-0 --mode 2560x1440  --pos 0x0 --rate 75 --primary --output DP-2 --pos 2560x360 --auto'












































-- local buttons_example = wibox {
--     visible = true,
--     bg = beautiful.color.purple,
--     ontop = true,
--     height = 100,
--     width = 200,
--     shape = function(cr, width, height)
--         gears.shape.rounded_rect(cr, width, height, 3)
--     end,
-- }


--
-- awful.popup {
--     widget       = {
--         {
--             {
--                 text   = 'foobar',
--                 widget = wibox.widget.textbox,
--             },
--             {
--                 {
--                     text   = 'foobar',
--                     widget = wibox.widget.textbox,
--                 },
--                 bg     = '#ff00ff',
--                 clip   = true,
--                 shape  = gears.shape.rounded_bar,
--                 widget = wibox.widget.background,
--             },
--             {
--                 value         = 0.5,
--                 forced_height = 30,
--                 forced_width  = 100,
--                 widget        = wibox.widget.progressbar,
--             },
--             layout = wibox.layout.fixed.vertical,
--         },
--         margins = 10,
--         widget  = wibox.container.margin,
--     },
--     ontop       = true,
--     border_color = '#00ff00',
--     border_width = 5,
--     placement    = awful.placement.centered,
--     shape        = gears.shape.rounded_rect,
--     visible      = true,
-- }



--
--
-- local button = wibox.widget {
--     {
--         {
--             text = "I'm a button!",
--             widget = wibox.widget.textbox,
--         },
--         top = 4,
--         bottom = 4,
--         left = 8,
--         right = 8,
--         widget = wibox.container.margin,
--     },
--     bg = '#4C566A',                 -- basic
--     shape_border_width = 10,
--     shape_border_color = '#4C566A', -- outline
--     shape = function(cr, width, height)
--         gears.shape.rounded_rect(cr, width, height, 4)
--     end,
--     widget = wibox.container.background,
-- }
-- buttons_example:setup {
--     button,
--     -- walign = 'center',
--     -- valigh = 'center',
--     layout = wibox.container.place,
-- }
-- awful.placement.top(buttons_example, { margins = { top = 40 }, parent = awful.screen.focused() })
