-- INFO :
--  ╭──────────────────────────────────────────────────────────╮
--  │                      bling settings                      │
--  ╰──────────────────────────────────────────────────────────╯

-- FIXME :This doesn work
bling.widget.tag_preview.enable {
    show_client_content = false, -- Whether or not to show the client content
    x = 10,                      -- The x-coord of the popup
    y = 10,                      -- The y-coord of the popup
    scale = 0.15,                -- The scale of the previews compared to the screen
    honor_padding = false,       -- Honor padding when creating widget size
    honor_workarea = false,      -- Honor work area when creating widget size
    placement_fn = function(c)   -- Place the widget using awful.placement (this overrides x & y)
        awful.placement.top(c, {
            margins = {
                top = 70,
            },
        })
    end,
}

bling.widget.task_preview.enable {
    x = 20,                    -- The x-coord of the popup
    y = 20,                    -- The y-coord of the popup
    height = 200,              -- The height of the popup
    width = 200,               -- The width of the popup
    placement_fn = function(c) -- Place the widget using awful.placement (this overrides x & y)
        awful.placement.bottom(c, {
            margins = {
                bottom = 30,
            },
        })
    end,
}

local wconf = conf.widgets
--  ╭──────────────────────────────────────────────────────────╮
--  │                    End bling settings                    │
--  ╰──────────────────────────────────────────────────────────╯
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == 'function' then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', set_wallpaper)


local btn_act = util.enum.bottom
local button = util.button
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)
    -- Each screen has its own tag table.
    awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.suit.tile)

    -- Create a taglist widget
    s.taglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = util.keys {
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
        style   = { shape = gears.shape.rounded_rect },
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
            spacing = 5,
            spacing_widget = {
                {
                    forced_width = 2,
                    color = '#3f4859',
                    shape = gears.shape.rounded_bar,
                    widget = wibox.widget.separator,
                },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place,
            },
            layout = wibox.layout.flex.horizontal,
        },
        widget_template = {
            {
                {
                    {
                        {
                            id = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget = wibox.container.margin,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left = 10,
                right = 10,
                widget = wibox.container.margin,
            },
            id = 'background_role',
            widget = wibox.container.background,
        },
    }

    -- Create the wibox
    s.wibar = awful.wibar(wconf.get_wibar(s))
    s.layoutbox = awful.widget.layoutbox(s)
    s.layoutbox:buttons(util.keys {
        button { 1, function() awful.layout.inc(1) end },
        button { 3, function() awful.layout.inc(-1) end },
        -- button { 4, function() awful.layout.inc(1) end },
        -- button { 5, function() awful.layout.inc(-1) end },
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
            awful.widget.keyboardlayout(), -- Keyboard map indicator and switcher
            s.layoutbox,
            wibox.layout.margin(
                awful.widget.textclock('<span font="JetBrains Mono Nerd Font Mono 12"> %H:%M </span>', 5), 0, 10, 7, 7), -- Clock
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
