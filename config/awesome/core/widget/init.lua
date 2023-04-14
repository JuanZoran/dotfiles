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


-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    -- local btn_act = util.enum.bottom
    local button = util.button
    -- Each screen has its own tag table.
    awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.suit.tile)

    s.taglist  = require 'core.widget.taglist' (s)
    s.tasklist = require 'core.widget.tasklist' (s)
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
            -- require 'core.widget.storage',
            -- require 'core.widget.brightness',
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
