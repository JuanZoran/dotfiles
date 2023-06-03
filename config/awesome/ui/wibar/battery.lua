local wibox = require 'wibox'
local c     = beautiful.color
local dpi   = require 'beautiful.xresources'.apply_dpi
-- local helpers = require 'helpers'


--------------------
local battery_progress = wibox.widget {
    -- color            =
    background_color = '#00000000',
    forced_width     = dpi(28),
    border_width     = dpi(1),
    border_color     = '#615D76',
    paddings         = dpi(3),
    value            = 70,
    max_value        = 100,
    margins          = dpi(3),
    forced_height    = dpi(25),
    widget           = wibox.widget.progressbar,
}

-- local battery_percentage_text = wibox.widget {
--     -- id = 'percent_text',
--     text = '50%',
--     font = beautiful.font_name .. 'Medium 10',
--     align = 'center',
--     valign = 'center',
--     widget = wibox.widget.textbox,
-- }

-- local charging_icon           = wibox.widget {
--     markup = "<span foreground='" .. c.purple .. "'></span>",
--     font = beautiful.icon_var .. '10',
--     align = 'center',
--     valign = 'center',
--     widget = wibox.widget.textbox,
-- }


--     The device state.
-- UNKNOWN           = 0¶
-- CHARGING          = 1¶
-- DISCHARGING       = 2¶
-- EMPTY             = 3¶
-- FULLY_CHARGED     = 4¶
-- PENDING_CHARGE    = 5¶
-- PENDING_DISCHARGE = 6¶
-- LAST              = 7¶
-- local charging_map = {
--     [0] = false,
--     [1] = true,
--     [2] = false,
--     [3] = false,
--     [4] = true,
--     [5] = true,
--     [6] = false,
--     [7] = false,
-- }

-- INFO : Load battery widget
local tmp = require 'widgets.battery-widget' {
    use_display_device = true,
    instant_update = true,
}
tmp:connect_signal('upower::update', function(_, device)
    -- battery_percentage_text.text = math.floor(device.percentage) .. '%'
    -- charging_icon.visible = (charging_map)[device.state]

    battery_progress.value = device.percentage
    if device.percentage <= 30 then
        battery_progress.color = c.red
    elseif device.percentage <= 50 then
        battery_progress.color = c.orange
    elseif device.percentage <= 70 then
        battery_progress.color = c.yellow
    else
        battery_progress.color = c.green
    end
end)

return {
    {
        {
            font = '得意黑 10',
            text = '电量',
            widget = wibox.widget.textbox,
        },
        {
            value = 70,
            forced_width = dpi(70),
            shape = gears.shape.rounded_bar,
            widget = battery_progress,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    top = 3,
    bottom = 3,
    widget = wibox.container.margin,
}
