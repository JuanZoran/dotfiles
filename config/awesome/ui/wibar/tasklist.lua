local btn = awful.button.names

return function(s)
    local button = util.button
    return awful.widget.tasklist {
        screen          = s,
        filter          = awful.widget.tasklist.filter.currenttags,
        buttons         = util.keys {
            button { btn.LEFT, function(c)
                if c == client.focus then
                    c.minimized = true
                else
                    c:emit_signal('request::activate', 'tasklist', { raise = true })
                end
            end, },
            button { btn.RIGHT, function() awful.menu.client_list { theme = { width = 250 } } end },
            button { btn.SCROLL_DOWN, function() awful.client.focus.byidx(1) end },
            button { btn.SCROLL_UP, function() awful.client.focus.byidx(-1) end },
        },
        layout          = {
            spacing_widget = {
                {
                    forced_width  = 5,
                    forced_height = 24,
                    thickness     = 1,
                    color         = beautiful.color.purple,
                    widget        = wibox.widget.separator,
                },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place,
            },
            spacing        = 4,
            layout         = wibox.layout.fixed.horizontal,
        },
        widget_template = {
            {
                wibox.widget.base.make_widget(),
                id     = 'background_role',
                widget = wibox.container.background,
            },
            {
                {
                    id     = 'clienticon',
                    widget = awful.widget.clienticon,
                },
                margins = 3,
                widget  = wibox.container.margin,
            },
            create_callback = function(self, c, index, objects) --luacheck: no unused args
                self:get_children_by_id 'clienticon'[1].client = c
                -- BLING: Toggle the popup on hover and disable it off hover
            end,
            layout = wibox.layout.align.vertical,
        },
    }
end
