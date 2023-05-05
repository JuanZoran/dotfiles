-- FIXME :It doesn't work
-- local dpi         = require 'beautiful.xresources'.apply_dpi
-- local tabbed_misc = bling.widget.tabbed_misc
-- INFO :Avoid titlebar get conflict
local no_titlebar = {
    ['neovide']                = true,
    -- ['QQ']                     = true,
    ['Chromium-browser']       = true,
    ['TelegramDesktop']        = true,
    ['org.wezfurlong.wezterm'] = true,
}


client.connect_signal('request::titlebars', function(c)
    if no_titlebar[c.class] then return end
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


    ---@format disable-next
    awful.titlebar(c, { position = 'top', size = conf.titlebar_size, font = beautiful.font_name .. ' 10' }):setup {
        {
            -- Left
            awful.titlebar.widget.iconwidget(c),
            layout = wibox.layout.fixed.horizontal,
        },
        {
            -- Middle
            {
                -- Title
                align = 'center',
                font = beautiful.font_name .. ' 10',
                widget = awful.titlebar.widget.titlewidget(c),
                buttons = buttons,
            },
            layout = wibox.layout.flex.horizontal,
        },
        {
            -- Right,
            wibox.container.margin(awful.titlebar.widget.minimizebutton(c)  , 3, 3, 10, 10),
            wibox.container.margin(awful.titlebar.widget.maximizedbutton(c) , 3, 3, 10, 10),
            wibox.container.margin(awful.titlebar.widget.closebutton(c)     , 3, 3, 10, 10),
            layout = wibox.layout.fixed.horizontal,
        },
        layout = wibox.layout.align.horizontal,
    }
end)
