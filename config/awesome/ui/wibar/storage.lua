local storage_widget_root = wibox.widget {
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
}

local update_storage_root = function(st_root)
    storage_widget_root.text = ' ' .. st_root
end

local storage_widget_home = wibox.widget {
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
}

local update_storage_home = function(st_home)
    storage_widget_home.text = ' ' .. st_home
end

local storage_root = awful.widget.watch("bash -c \"df -h | awk 'NR==4 {print $4}'\"", 60, function(self, stdout)
    local st_root = stdout
    update_storage_root(st_root)
end)


local storage_home = awful.widget.watch('/home/sv/Scripts/Scripts-AwesomeWM/disk-usage.sh', 60, function(self, stdout)
    update_storage_home(stdout)
end)

return {
    {
        {
            {
                {
                    --{
                    widget = storage_widget_root,
                    --},
                    --{
                    --  widget = storage_widget_home,
                    --},
                    --layout = wibox.layout.flex.horizontal
                },
                left = 0,
                right = 0,
                top = 0,
                bottom = 0,
                widget = wibox.container.margin,
            },
            shape  = gears.shape.rounded_bar,
            fg     = '#b4befe',
            bg     = conf.widget_bg,
            widget = wibox.container.background,
        },
        left = 10,
        right = 10,
        top = 0,
        bottom = 0,
        widget = wibox.container.margin,
    },
    layout = wibox.layout.fixed.horizontal,
}
