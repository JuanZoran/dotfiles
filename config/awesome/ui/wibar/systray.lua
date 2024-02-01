return function(s)
    return {
        {
            {
                widget = wibox.widget.systray,
                base_size = 20,
                screen = s,
            },
            shape  = gears.shape.rounded_rect,
            widget = wibox.container.background,
        },
        -- left = 8,
        right = 8,
        top = 8,
        widget = wibox.container.margin,
    }
end
-- return {
--     {
--         {
--             widget = wibox.widget.systray,
--             base_size = 25,
--         },
--         shape  = gears.shape.rounded_rect,
--         widget = wibox.container.background,
--     },
--     left = 8,
--     right = 8,
--     top = 8,
--     widget = wibox.container.margin,
-- }
