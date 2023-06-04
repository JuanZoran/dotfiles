----------------------------------------------------------------------
local awful  = require 'awful'
local rubato = require 'lib.rubato'
local c      = beautiful.color
local btn    = awful.button.names
local button = util.button
local dpi    = require 'beautiful.xresources'.apply_dpi
----------------------------------------------------------------------
local buttons = util.keys {
    button { btn.LEFT, function(t) t:view_only() end },
    button { btn.RIGHT, awful.tag.viewtoggle },
    button { btn.SCROLL_DOWN, function(t) awful.tag.viewnext(t.screen) end },
    button { btn.SCROLL_UP, function(t) awful.tag.viewprev(t.screen) end },
}

local icon    = {
    active   = { '  ', c.blue },
    occupied = { '  ', c.green },
    empty    = { '  ', c.gray },
}

return function(s)
    awful.tag({ 1, 2, 3, 4 }, s, awful.layout.layouts[1])

    local function set_icon(self, t)
        local container = self:get_children_by_id 'icon'[1]
        local text_widget = container.widget
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
            create_callback = function(self, t, index, objects) --luacheck: no unused args
                set_icon(self, t)
                -- self.animate = rubato.timed {
                --     duration = 0.15,
                --     subscribed = function(w)
                --         self:get_children_by_id 'icon'[1].forced_width = w
                --     end,
                -- }
            end,
            update_callback = function(self, t, index, objects) --luacheck: no unused args
                set_icon(self, t)
            end,
        },
    }, dpi(20), dpi(20))
end
