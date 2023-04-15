local wconf = conf.widgets
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    -- local btn_act = util.enum.bottom
    local button = util.button
    -- Each screen has its own tag table.
    awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.layouts[1])

    s.taglist   = require 'core.widget.taglist' (s)
    s.tasklist  = require 'core.widget.tasklist' (s)
    -- Create the wibox
    s.layoutbox = awful.widget.layoutbox(s)
    s.layoutbox:buttons(util.keys {
        button { 1, function() awful.layout.inc(1) end },
        button { 3, function() awful.layout.inc(-1) end },
        button { 4, function() awful.layout.inc(1) end },
        button { 5, function() awful.layout.inc(-1) end },
    })

    s.wibar = awful.wibar(wconf.get_wibar(s))
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
            -- wibox.layout.margin(
            -- awful.widget.textclock('<span font="JetBrains Mono Nerd Font Mono 12"> %H:%M </span>', 5), 0, 10, 7, 7), -- Clock
            --      0, 10, 7, 7), -- Clock
        },
    }


    local hidden = function()
        s.wibar.visible = false
        s.show_wibar_timer:start()
    end
    s.show_wibar_timer = gears.timer {
        timeout = 0.25, -- 250ms delay between checks if the bar should be shown
        callback = function()
            local coords = mouse.coords()
            if coords.x < s.geometry.x or coords.x > s.geometry.x + s.geometry.width
                -- comment this out if you want to show bar even for fullscreen windows
                or (next(s.clients) and s.clients[1].fullscreen)
            then
                if s.wibar.visible then hidden() end
                return
            end
            -- moving the mouse within 5px of the bottom of the screen shows the bar
            if coords.y > s.geometry.height - 5 then
                s.wibar.visible = true
                s.show_wibar_timer:stop()
            end
        end,
        autostart = true,
    }
    s.wibar:connect_signal('mouse::leave', hidden)
end)
