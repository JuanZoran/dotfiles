local dpi = require 'beautiful.xresources'.apply_dpi
bling.widget.tag_preview.enable {
    show_client_content = true, -- Whether or not to show the client content
    scale = 0.25,               -- The scale of the previews compared to the screen
    honor_padding = true,       -- Honor padding when creating widget size
    honor_workarea = true,      -- Honor work area when creating widget size
    placement_fn = function(c)  -- Place the widget using awful.placement (this overrides x & y)
        awful.placement.next_to_mouse(c, {
            offset = {
                y = dpi(60),
            },
        })
    end,
}

local c       = beautiful.color
---@see https://awesomewm.org/apidoc/widgets/awful.widget.taglist.html#awful.widget.taglist
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

local icon    = {
    active   = { '  ', c.blue },
    occupied = { '  ', c.green },
    empty    = { '  ', c.gray },
}

return function(s)
    awful.tag( -- { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        { 1, 2, 3, 4 },
        s, awful.layout.layouts[1])

    local function set_icon(self, t)
        local container = self:get_children_by_id 'icon'[1]
        local text_widget = container.widget
        -- print(text_widget)
        if t.selected then
            text_widget.text = icon.active[1]
            container.fg = icon.active[2]
        elseif #t:clients() > 0 then
            text_widget.text = icon.occupied[1]
            container.fg = icon.occupied[2]
        else
            text_widget.text = icon.empty[1]
            container.fg = icon.empty[2]
        end
    end


    local create_callback = function(self, t, index, objects) --luacheck: no unused args
        set_icon(self, t)
        self:connect_signal('mouse::enter', function()
            if #t:clients() > 0 then
                awesome.emit_signal('bling::tag_preview::update', t)
                awesome.emit_signal('bling::tag_preview::visibility', s, true)
            end
        end)

        self:connect_signal('mouse::leave', function()
            awesome.emit_signal('bling::tag_preview::visibility', s, false)
        end)
    end

    return wibox.container.margin(awful.widget.taglist {
        screen          = s,
        filter          = awful.widget.taglist.filter.all,
        layout          = wibox.layout.fixed.horizontal,
        style           = {
            spacing = dpi(30),
        },
        buttons         = buttons,
        widget_template = {
            widget = wibox.container.background,
            {
                id = 'icon',
                {
                    text   = icon.empty[1],
                    widget = wibox.widget.textbox,
                },
                fg     = icon.empty[2],
                shape  = gears.shape.circle,
                widget = wibox.container.background,
            },
            ---@diagnostic disable-next-line: unused-local
            create_callback = create_callback,
            update_callback = function(self, t, index, objects) --luacheck: no unused args
                set_icon(self, t)
            end,
        },
    }, dpi(20), dpi(20))
end
