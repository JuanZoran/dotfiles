---@diagnostic disable-next-line: undefined-field
beautiful.init(util.conf_dir .. '/theme/theme.lua')
local dpi = require 'beautiful.xresources'.apply_dpi
require 'awful.autofocus'

local conf         = {
    editor     = 'nvim',
    terminal   = 'wezterm',
}

conf.editor_cmd    = conf.terminal .. ' -e ' .. conf.editor
local layout = awful.layout
conf.layout        = {
    layout.suit.tile,
    -- layout.suit.tile.left,
    layout.suit.floating,
    layout.suit.tile.bottom,
    layout.suit.max,
    bling.layout.centered,
    -- layout.suit.floating,
    -- layout.suit.tile.top,

    -- INFO :Default
    -- layout.suit.tile,
    -- layout.suit.floating,
    -- layout.suit.tile.left,
    -- layout.suit.tile.bottom,
    -- layout.suit.tile.top,
    -- layout.suit.fair,
    -- layout.suit.fair.horizontal,
    -- layout.suit.spiral,
    -- layout.suit.spiral.dwindle,
    -- layout.suit.max,
    -- layout.suit.max.fullscreen,
    -- layout.suit.magnifier,
    -- layout.suit.corner.nw,

    -- layout.suit.corner.ne,
    -- layout.suit.corner.sw,
    -- layout.suit.corner.se,
}

conf.widget_fg     = '#a6adc8'
conf.widget_bg     = '#1e1e2e'
conf.titlebar_size = dpi(30)
_G.conf = conf
