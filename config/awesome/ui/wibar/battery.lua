local wibox   = require 'wibox'
local c       = beautiful.color
local dpi     = require 'beautiful.xresources'.apply_dpi
local helpers = require 'helpers'


--------------------
local battery_progress        = wibox.widget {
    color            = c.sapphire,
    background_color = beautiful.bg_normal,
    border_color     = beautiful.fg_normal .. 'A6',
    forced_height    = dpi(25),
    border_width     = 1,
    paddings         = 2,
    bar_shape        = helpers.rrect(2),
    shape            = helpers.rrect(4),
    value            = 100,
    max_value        = 100,
    widget           = wibox.widget.progressbar,
}

local battery_percentage_text = wibox.widget {
    -- id = 'percent_text',
    text = '50%',
    font = beautiful.font_name .. 'Medium 10',
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
}

local charging_icon           = wibox.widget {
    markup = "<span foreground='" .. c.purple .. "'></span>",
    font = beautiful.icon_var .. '10',
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
}


-- INFO : Load battery widget
local tmp          = require 'widgets.battery-widget' {
    use_display_device = true,
    instant_update = true,
}

--     The device state.
-- UNKNOWN           = 0¶
-- CHARGING          = 1¶
-- DISCHARGING       = 2¶
-- EMPTY             = 3¶
-- FULLY_CHARGED     = 4¶
-- PENDING_CHARGE    = 5¶
-- PENDING_DISCHARGE = 6¶
-- LAST              = 7¶
local charging_map = {
    [0] = false,
    [1] = true,
    [2] = false,
    [3] = false,
    [4] = true,
    [5] = true,
    [6] = false,
    [7] = false,
}

tmp:connect_signal('upower::update', function(_, device)
    battery_percentage_text.text = math.floor(device.percentage) .. '%'
    battery_progress.value = device.percentage

    charging_icon.visible = (charging_map)[device.state]
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
            {
                battery_progress,
                charging_icon,
                layout = wibox.layout.stack,
            },
            direction = 'east',
            widget = wibox.container.rotate,
        },
        top = 4,
        bottom = 5,
        widget = wibox.container.margin,
    },
    battery_percentage_text,
    spacing = dpi(3),
    layout = wibox.layout.fixed.horizontal,
}
