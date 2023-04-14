-- local dpi = require 'beautiful.xresources'.apply_dpi
-- ------------------------------------

-- local get_taglist = function(s)
--     -- Taglist buttons
--     local taglist_buttons = util.keys {
--         awful.button({}, 1,
--             function(t) t:view_only() end),
--         awful.button({ modkey }, 1, function(t)
--             if client.focus then client.focus:move_to_tag(t) end
--         end),
--         awful.button({}, 3, awful.tag.viewtoggle),
--         awful.button({ modkey }, 3, function(t)
--             if client.focus then client.focus:toggle_tag(t) end
--         end),
--         awful.button({}, 4, function(t)
--             awful.tag.viewnext(t.screen)
--         end),
--         awful.button({}, 5, function(t)
--             awful.tag.viewprev(t.screen)
--         end),
--     }

--     ----------------------------------------------------------------------

--     local unfocus_icon = ' '
--     local unfocus_color = '#585b70'

--     local empty_icon = ' '
--     local empty_color = '#585b70'

--     local focus_icon = ' '
--     local focus_color = '#b4befe'

--     ----------------------------------------------------------------------

--     -- Function to update the tags
--     local update_tags = function(self, c3)
--         local tagicon = self:get_children_by_id 'icon_role'[1]
--         if c3.selected then
--             tagicon.text = focus_icon
--             self.fg = focus_color
--         elseif #c3:clients() == 0 then
--             tagicon.text = empty_icon
--             self.fg = empty_color
--         else
--             tagicon.text = unfocus_icon
--             self.fg = unfocus_color
--         end
--     end

--     ----------------------------------------------------------------------

--     local icon_taglist = awful.widget.taglist {
--         screen = s,
--         filter = awful.widget.taglist.filter.all,
--         layout = { spacing = 0, layout = wibox.layout.fixed.horizontal },
--         widget_template = {
--             {
--                 { id = 'icon_role', font = 'JetBrainsMono Nerd Font 12', widget = wibox.widget.textbox },
--                 id = 'margin_role',
--                 top = dpi(0),
--                 bottom = dpi(0),
--                 left = dpi(2),
--                 right = dpi(2),
--                 widget = wibox.container.margin,
--             },
--             id = 'background_role',
--             widget = wibox.container.background,
--             create_callback = function(self, c3, index, objects)
--                 update_tags(self, c3)
--             end,

--             update_callback = function(self, c3, index, objects)
--                 update_tags(self, c3)
--             end,
--         },
--         buttons = taglist_buttons,
--     }
--     return icon_taglist
-- end

-- return get_taglist

return function(s)
    local btn_act = util.enum.bottom
    local button = util.button
    return awful.widget.taglist {
        screen          = s,
        style           = { shape = gears.shape.rounded_bar },
        filter          = awful.widget.taglist.filter.all,
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
        layout          = {
            spacing = 0,
            spacing_widget = {
                shape = gears.shape.rounded_rect,
                widget = wibox.widget.separator,
            },
            layout = wibox.layout.fixed.horizontal,
        },
        widget_template = {
            {
                {
                    {
                        {
                            id = 'text_role',
                            widget = wibox.widget.textbox,
                        },
                        widget = wibox.container.background,
                    },
                    {
                        id = 'index_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left = 7,
                right = 7,
                widget = wibox.container.margin,
            },
            id = 'background_role',
            widget = wibox.container.background,
            -- Add support for hover colors and an index label
            create_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:connect_signal('mouse::enter', function()
                    if #c3:clients() > 0 then
                        awesome.emit_signal('bling::tag_preview::update', c3)
                        awesome.emit_signal('bling::tag_preview::visibility', s, true)
                    end
                end)
                self:connect_signal('mouse::leave', function()
                    awesome.emit_signal('bling::tag_preview::visibility', s, false)
                    if self.has_backup then
                        self.bg = self.backup
                    end
                end)
            end,
        },
    }
end
