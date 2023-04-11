-- INFO :Avoid titlebar get conflict
local no_titlebar = {
    ['Chromium-browser'] = true,
    ['QQ'] = true,
}
local normal_size = 28

-- FIXME :
client.connect_signal('request::titlebars', function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal('request::activate', 'titlebar', { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
            c:emit_signal('request::activate', 'titlebar', { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, { position = 'top', size = no_titlebar[c.class] and 0 or normal_size }):setup {
        -- awful.titlebar(c, { position = 'top', size = no_titlebar[c.class] and 0 or normal_size }):setup {
        {
            buttons = buttons,
            layout = wibox.layout.align.horizontal,
        },
        {
            buttons = buttons,
            layout = wibox.layout.align.horizontal,
        },
        {
            buttons = buttons,
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.closebutton(c),
            awful.titlebar.widget.floatingbutton(c),
            layout = wibox.layout.align.horizontal,
        },
        layout = wibox.layout.align.horizontal,
    }
end)
