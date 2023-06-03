local wibox = require 'wibox'
local dpi   = require 'beautiful.xresources'.apply_dpi


local brightness_progress = wibox.widget {
    color            = beautiful.color.maroon,
    background_color = '#00000000',
    forced_width     = dpi(28),
    border_width     = dpi(1),
    border_color     = '#615D76',
    paddings         = dpi(3),
    value            = require 'signal.brightness'.current,
    max_value        = 100,
    margins          = dpi(3),
    forced_height    = dpi(25),
    -- bar_shape        = helpers.rrect(2),
    -- shape            = helpers.rrect(4),
    widget           = wibox.widget.progressbar,
}

awesome.connect_signal('brightness::change', function(value)
    if value <= 10 then value = value * 10 end
    print(value)
    brightness_progress.value = value
end)

return {
    {
        {
            font = '得意黑 10',
            text = '亮度',
            widget = wibox.widget.textbox,
        },
        {
            value = 70,
            forced_width = dpi(70),
            shape = gears.shape.rounded_bar,
            widget = brightness_progress,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    top = 3,
    bottom = 3,
    widget = wibox.container.margin,
}
