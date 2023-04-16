-- local container_brightness_widget = wibox.container

local brightness_widget = wibox.widget {
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
}

-- local update_brightness_widget = function(brightness)
--     brightness_widget.text = '  ' .. brightness
-- end

-- local br, br_signal = awful.widget.watch(
--     '/home/sv/Scripts/Scripts-AwesomeWM/brightness-bar.sh',
--     60,
--     function(self, stdout)
--         local brightness = stdout
--         update_brightness_widget(brightness)
--     end
-- )

return {
    {
        {
            {
                widget = brightness_widget,
            },
            left = 12,
            right = 10,
            top = 0,
            bottom = 0,
            widget = wibox.container.margin,
        },
        shape  = gears.shape.rounded_bar,
        fg     = '#f9e2af',
        bg     = conf.widget_bg,
        widget = wibox.container.background,
    },
    spacing = 5,
    layout = wibox.layout.fixed.horizontal,
}
