local key              = {}
local modkey           = 'Mod4'
local altkey           = 'Mod1'
local menubar          = require 'menubar'
menubar.utils.terminal = conf.terminal -- Set the terminal for applications that require it



local hotkeys_popup = require 'awful.hotkeys_popup'
require 'awful.hotkeys_popup.keys'

local keys = util.keys

--- INFO : Custom Configuration Defines
local k = awful.key.new

-- INFO :Custom utility
bling.widget.window_switcher.enable {
    type = 'thumbnail', -- set to anything other than "thumbnail" to disable client previews

    -- keybindings (the examples provided are also the default if kept unset)
    hide_window_switcher_key = 'Escape',                      -- The key on which to close the popup
    minimize_key = 'n',                                       -- The key on which to minimize the selected client
    unminimize_key = 'N',                                     -- The key on which to unminimize all clients
    kill_client_key = 'q',                                    -- The key on which to close the selected client
    cycle_key = 'Tab',                                        -- The key on which to cycle through all clients
    previous_key = 'Left',                                    -- The key on which to select the previous client
    next_key = 'Right',                                       -- The key on which to select the next client
    vim_previous_key = 'j',                                   -- Alternative key on which to select the previous client
    vim_next_key = 'l',                                       -- Alternative key on which to select the next client

    cycleClientsByIdx = awful.client.focus.byidx,             -- The function to cycle the clients
    filterClients = awful.widget.tasklist.filter.currenttags, -- The function to filter the viewed clients
}


awful.key.ignore_modifiers = { 'Lock', 'Mod2' }
awful.keygrabber {
    keybindings = {
        { { modkey }, 'd', function()
            naughty.notify { text = 'begin ... ' }
        end, },
    },
    export_keybindings = true,
    stop_key = 'Escape',
    -- stop_callback = function(_, stop_key, _, sequence)
    --     naughty.notify { text = 'stop_key: ' .. stop_key .. ', sequence: ' .. sequence }
    -- end,
    keypressed_callback = function(_, mods, map, event)
        for _, mod in ipairs(mods) do
            naughty.notify { text = 'keypressed_callback: [mods]: ' ..
                mod .. '[key]: ' .. map .. '[event]: ' .. event, }
        end
    end,
}

---@format disable-next
-- {{{ Key bindings
key.global = keys {



    k({ modkey            }, '/', hotkeys_popup.show_help, { description = 'show help',      group = 'awesome' }),
    k({ modkey, 'Control' }, 'r', awesome.restart,         { description = 'reload awesome', group = 'awesome' }),
    k({ modkey, 'Shift'   }, 'q', awesome.quit,            { description = 'quit awesome',   group = 'awesome' }),

    k({ modkey }, 'Escape', awful.tag.history.restore,  { description = 'go back',       group = 'tag' }),
    k({ modkey }, 'Left',   awful.tag.viewprev,         { description = 'view previous', group = 'tag' }),
    k({ modkey }, 'Right',  awful.tag.viewnext,         { description = 'view next',     group = 'tag' }),

    -- k({ modkey }, 'w', function() mymainmenu:show() end, { description = 'show main menu', group = 'awesome' }),

    -- Layout manipulation
    -- k({ modkey }, 'u', awful.client.urgent.jumpto, { description = 'jump to urgent client', group = 'client' }),
    k({ modkey, 'Control' }, 'j', function() awful.screen.focus_relative(-1) end, { description = 'focus the previous screen',          group = 'screen' }),
    k({ modkey, 'Control' }, 'l', function() awful.screen.focus_relative(1)  end, { description = 'focus the next screen',              group = 'screen' }),
    k({ modkey, 'Shift' }, 'j',   function() awful.client.swap.byidx(-1)     end, { description = 'swap with previous client by index', group = 'client' }),
    k({ modkey, 'Shift' }, 'l',   function() awful.client.swap.byidx(1)      end, { description = 'swap with next client by index',     group = 'client' }),
    k({ modkey }, 'j',            function() awful.client.focus.byidx(-1)    end, { description = 'focus previous by index',            group = 'client' }),
    k({ modkey }, 'l',            function() awful.client.focus.byidx(1)     end, { description = 'focus next by index',                group = 'client' }),

    k({ modkey }, 'Tab', function()
         awesome.emit_signal("bling::window_switcher::turn_on")
    end, { description = 'Window Switcher', group = 'client' }),
    -- k({ modkey }, 'Tab', function()
    --     awful.client.focus.history.previous()
    --     if client.focus then
    --         client.focus:raise()
    --     end
    -- end, { description = 'go back', group = 'client' }),

    k({ altkey          }, 'Up',     function() awful.spawn.with_shell('pactl set-sink-volume 0 +5%') end, { description = 'Increase volume', group = 'client' }),
    k({ altkey          }, 'Down',   function() awful.spawn.with_shell('pactl set-sink-volume 0 -5%') end, { description = 'Decrease volume', group = 'client' }),
    k({ altkey, "Shift" }, 'Up',     function() awful.spawn.with_shell('xbacklight -inc 5')           end, { description = 'Increase volume', group = 'client' }),
    k({ altkey, 'Shift' }, 'Down',   function() awful.spawn.with_shell('xbacklight -dec 5')           end, { description = 'Decrease volume', group = 'client' }),

    -- Standard program
    k({ modkey            }, 'a',     function() awful.spawn(conf.terminal)              end, { description = 'open a terminal',                       group = 'launcher'}),
    k({ modkey            }, 's',     function() awful.spawn.with_shell('flameshot gui') end, { description = 'screen shot use flameshot',             group = 'launcher' }),
    k({ modkey            }, 'l',     function() awful.tag.incmwfact(0.05)               end, { description = 'increase master width factor',          group = 'layout' }),
    k({ modkey            }, 'h',     function() awful.tag.incmwfact(-0.05)              end, { description = 'decrease master width factor',          group = 'layout' }),
    k({ modkey, 'Shift'   }, 'h',     function() awful.tag.incnmaster(1, nil, true)      end, { description = 'increase the number of master clients', group = 'layout' }),
    k({ modkey, 'Shift'   }, 'l',     function() awful.tag.incnmaster(-1, nil, true)     end, { description = 'decrease the number of master clients', group = 'layout' }),
    k({ modkey, 'Control' }, 'h',     function() awful.tag.incncol(1, nil, true)         end, { description = 'increase the number of columns',        group = 'layout' }),
    k({ modkey, 'Control' }, 'l',     function() awful.tag.incncol(-1, nil, true)        end, { description = 'decrease the number of columns',        group = 'layout' }),
    k({ modkey            }, 'space', function() awful.layout.inc(1)                     end, { description = 'select next',                           group = 'layout' }),
    k({ modkey, 'Shift'   }, 'space', function() awful.layout.inc(-1)                    end, { description = 'select previous',                       group = 'layout' }),

    k({ modkey, 'Control' }, 'n', function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
            c:emit_signal(
                'request::activate', 'key.unminimize', { raise = true }
            )
        end
    end, { description = 'restore minimized', group = 'client' }),

    -- Prompt
    -- k({ modkey }, 'r', function() awful.screen.focused().mypromptbox:run() end,
    --     { description = 'run prompt', group = 'launcher' }),
	-- k({ modkey }, "q", function()
	-- 	awful.util.spawn("rofi -theme ~/.config/awesome/rofis/" .. rofi_theme .. "/config.rasi  -show drun")
	-- end, { description = "show the menubar", group = "rofi apps" }),
	-- k({ modkey }, "w", function()
	-- 	awful.util.spawn("rofi -theme ~/.config/awesome/rofis/" .. rofi_theme .. "/config.rasi -show window")
	-- end, { description = "show the window", group = "rofi window" }),
	k({ modkey }, "r", function()
		awful.util.spawn("rofi -theme ~/.config/awesome/rofis/" .. conf.rofi_theme .. "/config.rasi -show run")
	end, { description = "show the run", group = "rofi run" }),


    k({ modkey }, 'p', function() menubar.show() end,
        { description = 'show the menubar', group = 'launcher' }),
}


key.clientkeys = util.keys {
    k({ modkey }, 'f',
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = 'toggle fullscreen', group = 'client' }),
    k({ modkey, 'Shift' }, 'c', function(c) c:kill() end,
        { description = 'close', group = 'client' }),
    k({ modkey, 'Control' }, 'space', awful.client.floating.toggle,
        { description = 'toggle floating', group = 'client' }),
    k({ modkey, 'Control' }, 'Return', function(c) c:swap(awful.client.getmaster()) end,
        { description = 'move to master', group = 'client' }),
    k({ modkey }, 'o', function(c) c:move_to_screen() end,
        { description = 'move to screen', group = 'client' }),
    k({ modkey }, 't', function(c) c.ontop = not c.ontop end,
        { description = 'toggle keep on top', group = 'client' }),

    k({ modkey }, 'n', function(c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end, { description = 'minimize', group = 'client' }),
    k({ modkey, 'Shift' }, 'd', function(c) naughty.notify { text = c.class } end,
        { description = 'debug current client', group = 'client' }),

    k({ modkey }, 'w', function(c)
        c.maximized = not c.maximized
        c:raise()
    end, { description = '(un)maximize', group = 'client' }),

    k({ modkey, 'Control' }, 'm', function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
    end, { description = '(un)maximize vertically', group = 'client' }),

    k({ modkey, 'Shift' }, 'm', function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
    end, { description = '(un)maximize horizontally', group = 'client' }),
}


-- TODO : Use this to show current volume
-- pactl list sinks | grep 'front-left:'

-- Bind all key umbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    key.global = keys {
        key.global,
        -- View tag only.
        k({ modkey }, '#' .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                tag:view_only()
            end
        end, { description = 'view tag #' .. i, group = 'tag' }),
        -- Toggle tag display.
        k({ modkey, 'Control' }, '#' .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end, { description = 'toggle tag #' .. i, group = 'tag' }),
        -- Move client to tag.
        k({ modkey, 'Shift' }, '#' .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end, { description = 'move focused client to tag #' .. i, group = 'tag' }),
        -- Toggle tag on focused client.
        k({ modkey, 'Control', 'Shift' }, '#' .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end, { description = 'toggle focused client on tag #' .. i, group = 'tag' }),
    }
end


key.clientbuttons = keys {
    awful.button({}, 1, function(c)
        c:emit_signal('request::activate', 'mouse_click', { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal('request::activate', 'mouse_click', { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal('request::activate', 'mouse_click', { raise = true })
        awful.mouse.client.resize(c)
    end),
}

-- Load Debian menu entries
local debian = require 'debian.menu'
local has_fdo, freedesktop = pcall(require, 'freedesktop')
local myawesomemenu = {
    { 'hotkeys',     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { 'edit config', conf.editor_cmd .. ' ' .. awesome.conffile },
    { 'restart',     awesome.restart },
    { 'quit',        function() awesome.quit() end },
}

local menu_awesome = { 'awesome', myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { 'open terminal', terminal }

if has_fdo then
    mymainmenu = freedesktop.menu.build {
        before = { menu_awesome },
        after = { menu_terminal },
    }
else
    mymainmenu = awful.menu {
        items = {
            menu_awesome,
            { 'Debian', debian.menu.Debian_menu.Debian },
            menu_terminal,
        },
    }
end
local button = util.button
key.mouse    = keys {
    button { 3, function() mymainmenu:toggle() end },
    button { 4, awful.tag.viewnext },
    button { 5, awful.tag.viewprev },
}

return key
