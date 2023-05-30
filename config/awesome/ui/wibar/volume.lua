local refresh_rate = 0.5
---@class beautiful
---@field xresources table


local dpi = beautiful.xresources.apply_dpi

--  Sound the widget

local normal_color = '#c4a7e7'
local muted_color = '#f55385'
local voice_progress = wibox.widget {
    color = '#c4a7e7',
    background_color = '#00000000',
    forced_width = dpi(28),
    border_width = dpi(1),
    border_color = '#615D76',
    paddings = dpi(3),
    value = 70,
    max_value = 100,
    margins = dpi(3),
    widget = wibox.widget.progressbar,
}


require 'awful.widget.watch' (require 'helpers'.volume.get_info_cmd, refresh_rate, function(_, stdout)
    if stdout == 'muted\n' then
        voice_progress.color = muted_color
    else
        voice_progress.color = normal_color
        voice_progress.value = tonumber(stdout:match '%d+')
    end
end)

return {
    {
        {
            font = '得意黑 10',
            text = '音量',
            widget = wibox.widget.textbox,
        },
        {
            value = 70,
            forced_width = dpi(70),
            shape = gears.shape.rounded_bar,
            widget = voice_progress,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    top = 3,
    bottom = 3,
    widget = wibox.container.margin,
}
