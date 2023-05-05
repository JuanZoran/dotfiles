local dpi = require 'beautiful.xresources'.apply_dpi

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

local c       = beautiful.color
---@see https://awesomewm.org/apidoc/widgets/awful.widget.taglist.html#awful.widget.taglist
local style   = {
    -- INFO :
    fg_focus    = c.light_purple,
    fg_empty    = c.dim_blue,
    fg_occupied = c.teal,
    spacing     = dpi(30),
}

----------------------------------------------------------------------
local btn_act = util.enum.bottom
local button  = util.button
----------------------------------------------------------------------

local buttons = util.keys {
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
}


return function(s)
    awful.tag( -- { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        { '1', '2', '3', '4' },
        s, awful.layout.layouts[1])

    return awful.widget.taglist {
        screen          = s,
        filter          = awful.widget.taglist.filter.all,
        layout          = { spacing = 0, layout = wibox.layout.fixed.horizontal },
        style           = style,
        buttons         = buttons,
        widget_template = {
            widget = wibox.container.background,
            {
                { id = 'text_role', font = beautiful.font_name .. ' 12', widget = wibox.widget.textbox },
                -- id = 'margin_role',
                top    = dpi(0),
                bottom = dpi(0),
                left   = dpi(2),
                right  = dpi(2),
                widget = wibox.container.margin,
            },
            ---@diagnostic disable-next-line: unused-local
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
        },
    }
end
