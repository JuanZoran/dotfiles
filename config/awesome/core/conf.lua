beautiful.init(util.conf_dir .. '/theme/theme.lua')
local dpi = require 'beautiful.xresources'.apply_dpi
require 'awful.autofocus'

local conf         = {
    rofi_theme = 'rofi',
    editor     = 'nvim',
    terminal   = 'wezterm',
}

conf.editor_cmd    = conf.terminal .. ' -e ' .. conf.editor
conf.layout        = {
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    awful.layout.suit.floating,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.max,
    bling.layout.centered,
    -- awful.layout.suit.floating,
    -- awful.layout.suit.tile.top,

    -- INFO :Default
    -- awful.layout.suit.tile,
    -- awful.layout.suit.floating,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,

    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

conf.widget_fg     = '#a6adc8'
conf.widget_bg     = '#1e1e2e'
conf.titlebar_size = dpi(30)


_G.conf = conf
