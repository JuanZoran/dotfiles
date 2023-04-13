require 'awful.autofocus'

local conf = {
    rofi_theme = 'rofi',
}

conf.editor     = 'nvim'
conf.terminal   = 'wezterm'
conf.editor_cmd = conf.terminal .. ' -e ' .. conf.editor

conf.layout     = {
    bling.layout.centered,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile,
    -- awful.layout.suit.floating,
    -- awful.layout.suit.tile.left,
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


conf.widgets = {
    systray = {
        icon_size = 30,
    },
    get_wibar = function(s)
        return {
            shape        = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end,
            position     = 'top',
            x            = 0,
            y            = 20,
            screen       = s,
            height       = 45,
            width        = 900,
            stretch      = false,
            -- bg        = '#1A1B26', -- bar bg color
            border_width = 0,
            -- border_color = '#3f4859',
        }
    end,
}

_G.conf = conf
