-- INFO :Avoid titlebar get conflict
local no_titlebar = {
    ['Chromium-browser'] = true,
    ['QQ']               = true,
    ['TelegramDesktop']  = true,
}
local normal_size = 35

client.connect_signal('request::titlebars', function(c)
    -- buttons for the titlebar
    local buttons = util.keys {
        awful.button({}, 1, function()
            c:emit_signal('request::activate', 'titlebar', { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
            c:emit_signal('request::activate', 'titlebar', { raise = true })
            awful.mouse.client.resize(c)
        end),
    }
    awful.titlebar(c, { position = 'top', size = no_titlebar[c.class] and 0 or normal_size }):setup {
        {
            -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal,
        },
        {
            -- Middle
            {
                -- Title
                align = 'center',
                widget = awful.titlebar.widget.titlewidget(c),
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal,
        },
        {
            -- Right
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal,
        },
        layout = wibox.layout.align.horizontal,
    }
end)
