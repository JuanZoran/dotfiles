bling.widget.tag_preview.enable {
    show_client_content = true, -- Whether or not to show the client content
    x = 10,                     -- The x-coord of the popup
    y = 10,                     -- The y-coord of the popup
    scale = 0.25,               -- The scale of the previews compared to the screen
    honor_padding = false,      -- Honor padding when creating widget size
    honor_workarea = false,     -- Honor work area when creating widget size
    placement_fn = function(c)  -- Place the widget using awful.placement (this overrides x & y)
        awful.placement.top_left(c, {
            margins = {
                top = 30,
                left = 30,
            },
        })
    end,
    -- background_widget = wibox.widget { -- Set a background image (like a wallpaper) for the widget
    --     image                 = '/home/zoran/background/dark/awesome.jpg',
    --     horizontal_fit_policy = 'fit',
    --     vertical_fit_policy   = 'fit',
    --     widget                = wibox.widget.imagebox,
    -- },
}


return function(s)
    local dpi = require 'beautiful.xresources'.apply_dpi
    -- Each screen has its own tag table.
    -- awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.layouts[1])
    awful.tag(
        { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        s, awful.layout.layouts[1])

    ----------------------------------------------------------------------
    local btn_act = util.enum.bottom
    local button = util.button
    ----------------------------------------------------------------------
    return awful.widget.taglist {
        screen          = s,
        filter          = awful.widget.taglist.filter.all,
        layout          = { spacing = 0, layout = wibox.layout.fixed.horizontal },
        -- style           = { shape = gears.shape.rounded_bar },
        buttons         = util.keys {
            button { btn_act.LEFT, function(t) t:view_only() end },
            button { mods = { modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end, },
            button { mods = { modkey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end, },
            button { btn_act.RIGHT, awful.tag.viewtoggle },
            button { btn_act.SCROLL_DOWN, function(t) awful.tag.viewnext(t.screen) end },
            button { btn_act.SCROLL_UP, function(t) awful.tag.viewprev(t.screen) end },
        },

        widget_template = {
            {
                { id = 'text_role', font = beautiful.font_name .. ' 12', widget = wibox.widget.textbox },
                -- id = 'margin_role',
                top    = dpi(0),
                bottom = dpi(0),
                left   = dpi(2),
                right  = dpi(2),
                widget = wibox.container.margin,
            },
            -- id = 'background_role',
            widget = wibox.container.background,
            create_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:connect_signal('mouse::enter', function()
                    if #c3:clients() > 0 then
                        awesome.emit_signal('bling::tag_preview::update', c3)
                        awesome.emit_signal('bling::tag_preview::visibility', s, true)
                    end
                end)
                self:connect_signal('mouse::leave', function()
                    awesome.emit_signal('bling::tag_preview::visibility', s, false)
                end)
            end,
            -- update_callback = callback,
        },
    }
end
