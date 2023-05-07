local c                       = beautiful.color
local dpi                     = require 'beautiful.xresources'.apply_dpi
local helpers                 = require 'helpers'
--------------------
local battery_progress        = wibox.widget {
    color            = c.sapphire,
    background_color = beautiful.fg_normal .. '00',
    forced_width     = dpi(16),
    border_width     = dpi(0.5),
    border_color     = beautiful.fg_normal .. 'A6',
    paddings         = dpi(2),
    bar_shape        = helpers.rrect(dpi(2)),
    shape            = helpers.rrect(dpi(4)),
    value            = 70,
    max_value        = 100,
    widget           = wibox.widget.progressbar,
}

local battery_percentage_text = wibox.widget {
    id = 'percent_text',
    text = '50%',
    font = beautiful.font_name .. 'Medium 10',
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
}

local charging_icon           = {
    markup = "<span foreground='" .. c.purple .. "'></span>",
    font = beautiful.icon_var .. '10',
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
}

-- INFO : Load battery widget
local tmp                     = require 'widgets.battery-widget' {
    use_display_device = true,
    instant_update = true,
}

tmp:connect_signal('upower::update', function(_, device)
    battery_percentage_text.text = math.floor(device.percentage) .. '%'
    battery_progress.value = device.percentage

    --     The device state.
    -- UNKNOWN= 0¶
    -- CHARGING= 1¶
    -- DISCHARGING= 2¶
    -- EMPTY= 3¶
    -- FULLY_CHARGED= 4¶
    -- PENDING_CHARGE= 5¶
    -- PENDING_DISCHARGE= 6¶
    -- LAST= 7¶

    if device.state == 2 then
        charging_icon.visible = true
    else
        charging_icon.visible = false
    end

    if device.percentage <= 10 then
        battery_progress.color = c.red
    elseif device.percentage <= 20 then
        battery_progress.color = c.orange
    elseif device.percentage <= 30 then
        battery_progress.color = c.yellow
    else
        battery_progress.color = c.green
    end
end)


return {
    {
        {
            battery_progress,
            charging_icon,
            layout = wibox.layout.stack,
        },
        layout = wibox.container.margin,
        right  = dpi(3),
        left   = dpi(3),
        top    = dpi(3),
        bottom = dpi(3),
    },
    battery_percentage_text,
    spacing = dpi(3),
    layout = wibox.layout.fixed.horizontal,
}
