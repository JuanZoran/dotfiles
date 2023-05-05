return {
    {
        {
            widget = wibox.widget.systray,
            icon_size = 20,
        },
        bg     = beautiful.color.dim,
        shape  = gears.shape.rounded_rect,
        widget = wibox.container.background,
    },
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
    layout = wibox.container.margin,
}
