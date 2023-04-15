-- FIXME :It doesn't work
-- local dpi         = require 'beautiful.xresources'.apply_dpi
-- bling.widget.tabbed_misc.titlebar_indicator(client, {
--     layout = wibox.layout.fixed.vertical,
--     layout_spacing = dpi(5),         -- Set spacing in between items
--     icon_size = dpi(24),             -- Set icon size
--     icon_margin = 0,                 -- Set icon margin
--     fg_color = '#cccccc',            -- Normal color for text
--     fg_color_focus = '#ffffff',      -- Color for focused text
--     bg_color_focus = '#282828',      -- Color for the focused items
--     bg_color = '#1d2021',            -- Color for normal / unfocused items
--     icon_shape = gears.shape.circle, -- Set icon shape,
-- })
-- INFO :Avoid titlebar get conflict
local no_titlebar = {
    ['Chromium-browser']       = true,
    ['QQ']                     = true,
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
    awful.titlebar(c, { position = 'top', size = conf.titlebar_size}):setup {
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
                widget = awful.titlebar.widget.titlewidget(c),
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal,
        },
        {
            -- Right
            awful.titlebar.widget.minimizebutton(c),
            -- awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal(),
        },
        layout = wibox.layout.align.horizontal,
    }
end)
