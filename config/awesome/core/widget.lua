local wconf = conf.widgets
-- INFO :
--  ╭──────────────────────────────────────────────────────────╮
--  │                      bling settings                      │
--  ╰──────────────────────────────────────────────────────────╯
bling.widget.tag_preview.enable {
    show_client_content = false, -- Whether or not to show the client content
    x = 10,                      -- The x-coord of the popup
    y = 10,                      -- The y-coord of the popup
    scale = 0.25,                -- The scale of the previews compared to the screen
    honor_padding = false,       -- Honor padding when creating widget size
    honor_workarea = false,      -- Honor work area when creating widget size
    placement_fn = function(c)   -- Place the widget using awful.placement (this overrides x & y)
        awful.placement.top_left(c, {
            margins = {
                top = 30,
                left = 30,
            },
        })
    end,
    background_widget = wibox.widget { -- Set a background image (like a wallpaper) for the widget
        image                 = beautiful.wallpaper,
        horizontal_fit_policy = 'fit',
        vertical_fit_policy   = 'fit',
        widget                = wibox.widget.imagebox,
    },
}

bling.widget.task_preview.enable {
    -- x = 1,                    -- The x-coord of the popup
    -- y = 1,                    -- The y-coord of the popup
    height = 400,              -- The height of the popup
    width = 400,               -- The width of the popup
    placement_fn = function(c) -- Place the widget using awful.placement (this overrides x & y)
        -- awful.placement.top(c, {
        --     margins = {
        --         top = 70,
        --     },
        -- })
        awful.placement.bottom(c, {
            margins = { bottom = 50 },
        })
    end,
}
--  ╭──────────────────────────────────────────────────────────╮
--  │                    End bling settings                    │
--  ╰──────────────────────────────────────────────────────────╯


local btn_act = util.enum.bottom
local button = util.button
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.suit.tile)
    -- Create a taglist widget
    s.taglist = awful.widget.taglist {
        screen          = s,
        style           = { shape = gears.shape.rounded_rect },
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

    -- Create a tasklist widget
    s.tasklist = awful.widget.tasklist {
        screen          = s,
        filter          = awful.widget.tasklist.filter.currenttags,
        buttons         = util.keys {
            button { btn_act.LEFT, function(c)
                if c == client.focus then
                    c.minimized = true
                else
                    c:emit_signal('request::activate', 'tasklist', { raise = true })
                end
            end, },
            button { btn_act.RIGHT, function() awful.menu.client_list { theme = { width = 250 } } end },
            button { btn_act.SCROLL_DOWN, function() awful.client.focus.byidx(1) end },
            button { btn_act.SCROLL_UP, function() awful.client.focus.byidx(-1) end },
        },
        layout          = {
            spacing_widget = {
                {
                    forced_width  = 5,
                    forced_height = 24,
                    thickness     = 1,
                    color         = '#777777',
                    widget        = wibox.widget.separator,
                },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place,
            },
            spacing        = 1,
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
                self:connect_signal('mouse::enter', function()
                    awesome.emit_signal('bling::task_preview::visibility', s,
                        true, c)
                end)
                self:connect_signal('mouse::leave', function()
                    awesome.emit_signal('bling::task_preview::visibility', s,
                        false, c)
                end)
            end,
            layout = wibox.layout.align.vertical,
        },
    }

    -- Create the wibox
    s.wibar = awful.wibar(wconf.get_wibar(s))
    s.layoutbox = awful.widget.layoutbox(s)
    s.layoutbox:buttons(util.keys {
        button { 1, function() awful.layout.inc(1) end },
        button { 3, function() awful.layout.inc(-1) end },
        button { 4, function() awful.layout.inc(1) end },
        button { 5, function() awful.layout.inc(-1) end },
    })

    s.wibar:setup {
        layout = wibox.layout.align.horizontal,
        expand = 'none',
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- wibox.layout.margin(awesome_icon, 7, 7, 7, 7),
            s.tasklist,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            {
                s.taglist,
                widget = wibox.container.background,
            },
        },
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,

            wibox.layout.margin(wibox.widget.systray { icon_size = wconf.systray.icon_size }, 10, 10, 10, 10),
            awful.widget.keyboardlayout(),                                                                                                -- Keyboard map indicator and switcher
            s.layoutbox,
            require'lib.volume-control.volume'.getwidget(),
            wibox.layout.margin(
                awful.widget.textclock('<span font="JetBrains Mono Nerd Font Mono 12"> %H:%M </span>', 5), 0, 10, 7, 7),                  -- Clock
        },
    }
    -- Add widgets
    -- This is a valid wallpaper definition
    bling.module.wallpaper.setup {
        screen       = s,
        change_timer = 1800,
        position     = 'maximized',
        wallpaper    = { os.getenv 'HOME' .. '/background' }, -- folders
        set_function = bling.module.wallpaper.setters.random,
    }
end)
