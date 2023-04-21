local key              = {}
local modkey           = 'Mod4'
local altkey           = 'Mod1'
local menubar          = require 'menubar'
menubar.utils.terminal = conf.terminal -- Set the terminal for applications that require it

local hotkeys_popup    = require 'awful.hotkeys_popup'
require 'awful.hotkeys_popup.keys'
local keys = util.keys

--- INFO : Custom Configuration Defines
local k = awful.key.new

-- INFO :Custom utility
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
        local mod = table.concat(mods, '|')
        naughty.notify { text = 'keypressed_callback: [mods]: ' .. mod .. '[key]: ' .. map .. '[event]: ' .. event }
    end,
}

-- These are example rubato tables. You can use one for just y, just x, or both.
-- The duration and easing is up to you. Please check out the rubato docs to learn more.

-- local term_scratch = bling.module.scratchpad {
--     command                 = 'wezterm start --class spad',                    -- How to spawn the scratchpad
--     rule                    = { instance = 'spad' },                           -- The rule that the scratchpad will be searched by
--     sticky                  = true,                                            -- Whether the scratchpad should be sticky
--     autoclose               = true,                                            -- Whether it should hide itself when losing focus
--     floating                = true,                                            -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
--     geometry                = { x = 360, y = 90, height = 900, width = 1200 }, -- The geometry in a floating state
--     reapply                 = true,                                            -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
--     dont_focus_before_close = false,                                           -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
-- }

---@format disable-next
-- {{{ Key bindings
key.global = keys {
    k({ modkey }, 'Left',   awful.tag.viewprev,         { description = 'view previous', group = 'tag' }),
    k({ modkey }, 'Right',  awful.tag.viewnext,         { description = 'view next',     group = 'tag' }),
    k({ modkey            }, '/', hotkeys_popup.show_help, { description = 'show help',      group = 'awesome' }),
    k({ modkey, 'Control' }, 'r', awesome.restart,         { description = 'reload awesome', group = 'awesome' }),
    k({ modkey, 'Shift'   }, 'q', awesome.quit,            { description = 'quit awesome',   group = 'awesome' }),

    k({ modkey }, 'Escape', awful.tag.history.restore,  { description = 'go back',       group = 'tag' }),
    -- k({ modkey }, 'w', function() mymainmenu:show() end, { description = 'show main menu', group = 'awesome' }),

    -- Layout manipulation
    -- k({ modkey }, 'u', awful.client.urgent.jumpto, { description = 'jump to urgent client', group = 'client' }),
    k({ modkey, 'Control' }, 'j', function() awful.screen.focus_relative(-1)        end, { description = 'focus the previous screen',          group = 'screen' }),
    k({ modkey, 'Control' }, 'l', function() awful.screen.focus_relative(1)         end, { description = 'focus the next screen',              group = 'screen' }),

    k({ modkey, 'Shift' }, 'i',   function() awful.client.swap.bydirection('up')     end, { description = 'swap with up client',    group = 'client' }),
    k({ modkey, 'Shift' }, 'k',   function() awful.client.swap.bydirection('down')   end, { description = 'swap with down client',  group = 'client' }),
    k({ modkey, 'Shift' }, 'j',   function() awful.client.swap.bydirection('left')   end, { description = 'swap with left client',  group = 'client' }),
    k({ modkey, 'Shift' }, 'l',   function() awful.client.swap.bydirection('right')  end, { description = 'swap with right client', group = 'client' }),
    k({ modkey }, 'i',            function() awful.client.focus.bydirection('up')    end, { description = 'focus up',               group = 'client' }),
    k({ modkey }, 'k',            function() awful.client.focus.bydirection('down')  end, { description = 'focus down',             group = 'client' }),
    k({ modkey }, 'j',            function() awful.client.focus.bydirection('left')  end, { description = 'focus left',             group = 'client' }),
    k({ modkey }, 'l',            function() awful.client.focus.bydirection('right') end, { description = 'focus right',            group = 'client' }),


    -- k({ modkey }, 'Tab', function()
    --     awful.client.focus.byidx(1)
    -- end, { description = 'Window Switcher', group = 'client' }),
    k({ modkey }, 'Tab', function()
        require 'lib.awesome-cyclefocus'.cycle({modifier="Super_L"})
    end, { description = 'Window Switcher', group = 'client' }),

    -- k({ modkey }, 'Tab', function()
    --      awesome.emit_signal("bling::window_switcher::turn_on")
    -- end, { description = 'Window Switcher', group = 'client' }),
    -- k({ modkey }, 'Tab', function()
    --     awful.client.focus.history.previous()
    --     if client.focus then
    --         client.focus:raise()
    --     end
    -- end, { description = 'go back', group = 'client' }),



    -- k({ altkey          }, 'Up',     function() require'lib.volume-control.volume'.up() end, { description = 'Increase volume', group = 'client' }),
    -- k({ altkey          }, 'Down',   function() require'lib.volume-control.volume'.down() end, { description = 'Decrease volume', group = 'client' }),
    k({}, 'XF86AudioRaiseVolume',  function() awful.spawn.with_shell('pactl set-sink-volume @DEFAULT_SINK@ +5%') end, { description = 'Increase volume', group = 'client' }),
    k({}, 'XF86AudioLowerVolume',  function() awful.spawn.with_shell('pactl set-sink-volume @DEFAULT_SINK@ -5%') end, { description = 'Decrease volume', group = 'client' }),
    k({ altkey          }, 'Up',   function() awful.spawn.with_shell('pactl set-sink-volume @DEFAULT_SINK@ +5%') end, { description = 'Increase volume', group = 'client' }),
    k({ altkey          }, 'Down', function() awful.spawn.with_shell('pactl set-sink-volume @DEFAULT_SINK@ -5%') end, { description = 'Decrease volume', group = 'client' }),
    k({ altkey, "Shift" }, 'Up',   function() awful.spawn.with_shell('xbacklight -inc 5')           end, { description = 'Increase volume', group = 'client' }),
    k({ altkey, 'Shift' }, 'Down', function() awful.spawn.with_shell('xbacklight -dec 5')           end, { description = 'Decrease volume', group = 'client' }),

    -- Standard program
    -- k({ modkey            }, 'a',     function()  term_scratch:toggle()              end, { description = 'open a terminal',                       group = 'launcher'}),
    k({ modkey            }, 'a',     function() awful.spawn(conf.terminal)              end, { description = 'open a terminal',                       group = 'launcher'}),
    k({ modkey            }, 's',     function() awful.spawn.with_shell('flameshot gui') end, { description = 'screen shot use flameshot',             group = 'launcher' }),
    k({ modkey            }, 'space', function() awful.layout.inc(1)                     end, { description = 'select next',                           group = 'layout' }),
    k({ modkey, 'Shift'   }, 'space', function() awful.layout.inc(-1)                    end, { description = 'select previous',                       group = 'layout' }),
    -- k({ modkey            }, 'l',     function() awful.tag.incmwfact(0.05)               end, { description = 'increase master width factor',          group = 'layout' }),
    -- k({ modkey            }, 'h',     function() awful.tag.incmwfact(-0.05)              end, { description = 'decrease master width factor',          group = 'layout' }),
    -- k({ modkey, 'Shift'   }, 'h',     function() awful.tag.incnmaster(1, nil, true)      end, { description = 'increase the number of master clients', group = 'layout' }),
    -- k({ modkey, 'Shift'   }, 'l',     function() awful.tag.incnmaster(-1, nil, true)     end, { description = 'decrease the number of master clients', group = 'layout' }),
    -- k({ modkey, 'Control' }, 'h',     function() awful.tag.incncol(1, nil, true)         end, { description = 'increase the number of columns',        group = 'layout' }),
    -- k({ modkey, 'Control' }, 'l',     function() awful.tag.incncol(-1, nil, true)        end, { description = 'decrease the number of columns',        group = 'layout' }),

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
	-- 	awful.spawn("rofi -theme ~/.config/awesome/rofis/" .. rofi_theme .. "/config.rasi  -show drun")
	-- end, { description = "show the menubar", group = "rofi apps" }),
	-- k({ modkey }, "w", function()
	-- 	awful.spawn("rofi -theme ~/.config/awesome/rofis/" .. rofi_theme .. "/config.rasi -show window")
	-- end, { description = "show the window", group = "rofi window" }),


	k({ modkey }, "r", function()
		awful.spawn.with_shell("rofi -theme ~/.config/awesome/rofis/" .. conf.rofi_theme .. "/config.rasi -show run")
	end, { description = "show the run", group = "rofi run" }),
	-- k({ modkey }, "r", function()
	-- 	awful.spawn_with_shell("/home/zoran/.config/rofi/launchers/type-7/launcher.sh")
	-- end, { description = "show the run", group = "rofi run" }),

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
            if tag then tag:view_only() end
        end, { description = 'view tag #' .. i, group = 'tag' }),

        -- Toggle tag display.
        k({ modkey, 'Control' }, '#' .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then awful.tag.viewtoggle(tag) end
        end, { description = 'toggle tag #' .. i, group = 'tag' }),
        -- Move client to tag.
        k({ modkey, 'Shift' }, '#' .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then client.focus:move_to_tag(tag) end
            end
        end, { description = 'move focused client to tag #' .. i, group = 'tag' }),
        -- Toggle tag on focused client.
        k({ modkey, 'Control', 'Shift' }, '#' .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then client.focus:toggle_tag(tag) end
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

local mainmenu = has_fdo
    and freedesktop.menu.build {
        before = { menu_awesome },
        after = { menu_terminal },
    }
    or awful.menu {
        items = {
            menu_awesome,
            { 'Debian', debian.menu.Debian_menu.Debian },
            menu_terminal,
        },
    }


local button = util.button
key.mouse    = keys {
    button { 3, function() mainmenu:toggle() end },
    button { 4, awful.tag.viewnext },
    button { 5, awful.tag.viewprev },
}

return key
