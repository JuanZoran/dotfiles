local c                = beautiful.color
local dpi              = require 'beautiful.xresources'.apply_dpi
local helpers          = require 'helpers'
--------------------
local battery_progress = wibox.widget {
    color            = c.sapphire,
    background_color = beautiful.fg_normal .. '00',
    border_width     = dpi(0.5),
    border_color     = beautiful.fg_normal .. 'A6',
    paddings         = dpi(2),
    bar_shape        = helpers.rrect(dpi(2)),
    shape            = helpers.rrect(dpi(4)),
    value            = 1,
    max_value        = 100,
    widget           = wibox.widget.progressbar,
}
-- INFO : Load battery widget
local tmp              = require 'widgets.battery-widget' {
    use_display_device = true,
    instant_update = true,
}

tmp:connect_signal('upower::update', function(_, device)
    battery_progress.value = device.percentage
end)


return {
    {
        {
            battery_progress,
            forced_width = dpi(16),
            direction = 'east',
            widget = wibox.container.rotate,
        },

        {
            markup = "<span foreground='" .. c.purple .. "'></span>",
            font = beautiful.icon_var .. '10',
            align = 'center',
            valign = 'center',
            widget = wibox.widget.textbox,
        },
        layout = wibox.layout.stack,
    },
    layout = wibox.container.margin,
    right  = dpi(3),
    left   = dpi(3),
    top    = dpi(3),
    bottom = dpi(3),
}
