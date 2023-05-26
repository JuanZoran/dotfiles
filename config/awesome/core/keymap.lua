local mapper = require 'lib.mapper'
mapper.setup {
    trigger = { 'Control', 'Shift', 'd' },
}

local keymap = mapper.keymap
local map    = keymap.map
local cmap   = keymap.client_map

local modkey = 'Mod4'
local altkey = 'Mod1'

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

map({ modkey, 'Tab' }, function() awesome.emit_signal 'bling::window_switcher::turn_on' end)
map({ modkey, 'Left' }, function() awful.tag.viewprev() end)
map({ modkey, 'Right' }, function() awful.tag.viewnext() end)
map({ modkey, 'Control', 'r' }, awesome.restart)
map({ modkey, 'Shift', 'q' }, awesome.quit)
map({ modkey, 'Escape' }, awful.tag.history.restore)

map({ modkey, 'Control', 'j' }, function() awful.screen.focus_relative(-1) end)
map({ modkey, 'Control', 'l' }, function() awful.screen.focus_relative(1) end)


map({ modkey, 'a' }, function() awful.spawn(conf.terminal) end)

-- INFO : Client Movement
map({ modkey, 'Shift', 'i' }, function() awful.client.swap.bydirection 'up' end)
map({ modkey, 'Shift', 'k' }, function() awful.client.swap.bydirection 'down' end)
map({ modkey, 'Shift', 'j' }, function() awful.client.swap.bydirection 'left' end)
map({ modkey, 'Shift', 'l' }, function() awful.client.swap.bydirection 'right' end)

-- INFO : Client Focus
map({ modkey, 'i' }, function() awful.client.focus.bydirection 'up' end)
map({ modkey, 'k' }, function() awful.client.focus.bydirection 'down' end)
map({ modkey, 'j' }, function() awful.client.focus.bydirection 'left' end)
map({ modkey, 'l' }, function() awful.client.focus.bydirection 'right' end)


-- INFO : volume
map('XF86AudioRaiseVolume', function() awful.spawn.with_shell 'pactl set-sink-volume @DEFAULT_SINK@ +5%' end)
map('XF86AudioLowerVolume', function() awful.spawn.with_shell 'pactl set-sink-volume @DEFAULT_SINK@ -5%' end)
map({ altkey, 'Up' }, function() awful.spawn.with_shell 'pactl set-sink-volume @DEFAULT_SINK@ +5%' end)
map({ altkey, 'Down' }, function() awful.spawn.with_shell 'pactl set-sink-volume @DEFAULT_SINK@ -5%' end)


-- INFO : Brightness
map({ altkey, 'Shift', 'Up' }, function() awful.spawn.with_shell 'xbacklight -inc 5' end)
map({ altkey, 'Shift', 'Down' }, function() awful.spawn.with_shell 'xbacklight -dec 5' end)

-- INFO : Standard program
map({ modkey, 'Return' }, function() awful.spawn(conf.terminal) end)
map({ modkey, 's' }, function() awful.spawn.with_shell 'flameshot gui' end)
map({ modkey, 'space' }, function() awful.layout.inc(1) end)
map({ modkey, 'Shift', 'space' }, function() awful.layout.inc(-1) end)

map({ modkey, 'Control', 'n' }, function()
    local c = awful.client.restore()
    if c then
        c:emit_signal('request::activate', 'key.unminimize', { raise = true })
    end
end)

-- INFO : Prompt

map({ modkey, 'e' },
    function() awful.spawn('rofi -theme ~/.config/awesome/rofis/' .. conf.rofi_theme .. '/config.rasi -show window') end)
map({ modkey, 'r' },
    function() awful.spawn('rofi -theme ~/.config/awesome/rofis/' .. conf.rofi_theme .. '/config.rasi -show run') end)


for i = 1, 5 do
    local num = '#' .. i + 9

    map({ modkey, num }, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then tag:view_only() end
    end)

    -- Move client to tag.
    map({ modkey, 'Shift', num }, function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then client.focus:move_to_tag(tag) end
        end
    end)

    -- Toggle tag on focused client.
    -- map({ modkey, 'Control', num }, function()
    --     if client.focus then
    --         local tag = client.focus.screen.tags[i]
    --         if tag then client.focus:toggle_tag(tag) end
    --     end
    -- end)

    -- Toggle tag display.
    -- map({ modkey, num }, function()
    --     local screen = awful.screen.focused()
    --     local tag = screen.tags[i]
    --     if tag then awful.tag.viewtoggle(tag) end
    -- end)
end


--- INFO : Client Keybinds
cmap({ modkey, 'Control', 'w' }, function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
end)

cmap({ modkey, 'Shift', 'c' }, function(c) c:kill() end)
cmap({ modkey, 'Control', 'space' }, awful.client.floating.toggle)


cmap({ modkey, 'o' }, function(c) c:move_to_screen() end)
cmap({ modkey, 't' }, function(c) c.ontop = not c.ontop end)
cmap({ modkey, 'n' }, function(c) c.minimized = true end)
cmap({ modkey, 'Shift', 'd' }, function(c) naughty.notify { text = c.class } end)
cmap({ modkey, 'w' }, function(c)
    c.maximized = not c.maximized
    c:raise()
end)


-- INFO : Mouse Bindings
local mouse = keymap.mouse
local cmouse = keymap.client_mouse


local names = awful.button.names
cmouse(names.LEFT, function(c)
    c:emit_signal('request::activate', 'mouse_click', { raise = true })
end)
cmouse({ modkey, names.LEFT }, function(c)
    c:emit_signal('request::activate', 'mouse_click', { raise = true })
    awful.mouse.client.move(c)
end)

cmouse({ modkey, names.RIGHT }, function(c)
    c:emit_signal('request::activate', 'mouse_click', { raise = true })
    awful.mouse.client.resize(c)
end)


--- INFO : Set global mousebindings
-- Load Debian menu entries
local menubar              = require 'menubar'
menubar.utils.terminal     = conf.terminal -- Set the terminal for applications that require it
local debian               = require 'debian.menu'
local has_fdo, freedesktop = pcall(require, 'freedesktop')
local awesomemenu          = {
    { 'edit config', conf.editor_cmd .. ' ' .. awesome.conffile },
    { 'restart',     awesome.restart },
    { 'quit',        awesome.quit },
}

local menu_awesome         = { 'awesome', awesomemenu }
local menu_terminal        = { 'open terminal', conf.terminal }

local mainmenu             = has_fdo
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

mouse(names.RIGHT, function() mainmenu:toggle() end)
mouse(names.SCROLL_UP, awful.tag.viewnext)
mouse(names.SCROLL_DOWN, awful.tag.viewprev)


-- cmap({ modkey, 'Control', 'Return' }, function(c)
--     if awful.screen.focused().selected_tag:clients()[1] then
--         c:swap(awful.client.getmaster())
--     end
-- end)
-- cmap({ modkey, 'Control', 'm' }, function(c)
--     c.maximized_vertical = not c.maximized_vertical
--     c:raise()
-- end)
-- cmap({ modkey, 'Shift', 'm' }, function(c)
--     c.maximized_horizontal = not c.maximized_horizontal
--     c:raise()
-- end)


-- k({ modkey }, "r", function()
-- 	awful.spawn_with_shell("/home/zoran/.config/rofi/launchers/type-7/launcher.sh")
-- end, { description = "show the run", group = "rofi run" })
-- k({ modkey }, 'r', function() awful.screen.focused().mypromptbox:run() end,
--     { description = 'run prompt', group = 'launcher' })
-- k({ modkey }, "q", function()
-- 	awful.spawn("rofi -theme ~/.config/awesome/rofis/" .. rofi_theme .. "/config.rasi  -show drun")
-- end, { description = "show the menubar", group = "rofi apps" })


-- INFO : Resize
-- k({ modkey            }, 'l',     function() awful.tag.incmwfact(0.05)               end, { description = 'increase master width factor',          group = 'layout' })
-- k({ modkey            }, 'h',     function() awful.tag.incmwfact(-0.05)              end, { description = 'decrease master width factor',          group = 'layout' })
-- k({ modkey, 'Shift'   }, 'h',     function() awful.tag.incnmaster(1, nil, true)      end, { description = 'increase the number of master clients', group = 'layout' })
-- k({ modkey, 'Shift'   }, 'l',     function() awful.tag.incnmaster(-1, nil, true)     end, { description = 'decrease the number of master clients', group = 'layout' })
-- k({ modkey, 'Control' }, 'h',     function() awful.tag.incncol(1, nil, true)         end, { description = 'increase the number of columns',        group = 'layout' })
-- k({ modkey, 'Control' }, 'l',     function() awful.tag.incncol(-1, nil, true)        end, { description = 'decrease the number of columns',        group = 'layout' })

-- k({ modkey }, 'p', function() menubar.show() end,
--     { description = 'show the menubar', group = 'launcher' })
