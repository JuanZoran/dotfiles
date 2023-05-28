local mapper = require 'lib.mapper'
local awful_client = require 'awful.client'
mapper.setup {
    trigger = '<C-S-d>',
}

local keymap   = mapper.keymap
local util     = mapper.util
local set      = util.global_map
local map      = keymap.map
local cset     = keymap.client_set
local new_mode = mapper.new_mode

bling.widget.window_switcher.enable {
    type = 'thumbnail',                                       -- set to anything other than "thumbnail" to disable client previews
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
local wrap_func         = util.wrap_func
local exec              = util.action_warp
local switch_to_default = util.switch_to_default


local run = wrap_func(awful.spawn)
--  ╭──────────────────────────────────────────────────────────╮
--  │                       awesome mode                       │
--  ╰──────────────────────────────────────────────────────────╯
set('<C-M-r>', awesome.restart)
local _, amap = new_mode('awesome', '<S-C-a>')
local tag     = awful.tag
-- amap('<C-r>', awesome.restart)
amap('q', awesome.quit)
amap('j', tag.viewprev)
amap('l', tag.viewnext)
amap('<Esc>', switch_to_default)
-- INFO : Prompt
local rofi = 'rofi -theme ~/.config/awesome/rofis/' .. conf.rofi_theme .. '/config.rasi -show '
local rofi_win, rofi_run = run(rofi .. 'window'), run(rofi .. 'run')
set('<M-e>', rofi_win)
set('<M-r>', rofi_run)
amap('r', exec { rofi_run, switch_to_default })
amap('w', exec { rofi_win, switch_to_default })


set('<M-a>', run(conf.terminal))
-- INFO : volume
local volume_up, volume_down = run 'pactl set-sink-volume @DEFAULT_SINK@ +5%',
    run 'pactl set-sink-volume @DEFAULT_SINK@ -5%'
local brightness_up, brightness_down = run 'xbacklight -inc 5',
    run 'xbacklight -dec 5'

set('<XF86AudioMute>', run 'pactl set-sink-mute @DEFAULT_SINK@ toggle')
set('<XF86AudioRaiseVolume>', volume_up)
set('<XF86AudioLowerVolume>', volume_down)
set('<XF86MonBrightnessUp>', brightness_up)
set('<XF86MonBrightnessDown>', brightness_down)
-- For habits this should be removed later
-- set('<A-Up>', volume_up)
-- set('<S-A-Up>', brightness_up)
-- set('<A-Down>', volume_down)
-- set('<S-A-Down>', brightness_down)

--  ╭──────────────────────────────────────────────────────────╮
--  │                     --- Window mode                      │
--  ╰──────────────────────────────────────────────────────────╯
local _, wmap = new_mode('window', '<S-C-w>')
local swap_client_bydirection = wrap_func(awful_client.swap.bydirection)
wmap('I', swap_client_bydirection 'up')
wmap('K', swap_client_bydirection 'down')
wmap('J', swap_client_bydirection 'left')
wmap('L', swap_client_bydirection 'right')

local focus_client_bydirection = wrap_func(awful_client.focus.bydirection)
wmap('i', focus_client_bydirection 'up')
wmap('k', focus_client_bydirection 'down')
wmap('j', focus_client_bydirection 'left')
wmap('l', focus_client_bydirection 'right')
wmap('<Esc>', switch_to_default)

local screen_focus_relative = wrap_func(awful.screen.focus_relative)
set('<C-M-j>', screen_focus_relative(-1))
set('<C-M-l>', screen_focus_relative(1))


-- set('<S-C-h>', util.send_string('world', { 'Shift', 'Control' }))
local emit_signal = wrap_func(awesome.emit_signal)
set('<M-Tab>', emit_signal 'bling::window_switcher::turn_on')

-- local run_with_shell = wrap_func(awful.spawn.with_shell)
set('<M-s>', run 'flameshot gui')

--  ╭──────────────────────────────────────────────────────────╮
--  │                       device mode                        │
--  ╰──────────────────────────────────────────────────────────╯
local _, dmap = new_mode('device', '<S-C-d>')
dmap('i', volume_up)
dmap('k', volume_down)
dmap('I', brightness_up)
dmap('K', brightness_down)
dmap('<Esc>', switch_to_default)
-- set('<M-S-Space>', function() awful.layout.inc(-1) end)
-- set('<M-Space>', function() awful.layout.inc(1) end)


local modkey = 'Mod4'
for i = 1, 5 do
    -- local num = i
    local num = '#' .. i + 9

    map({ modkey, num }, function()
        local screen = awful.screen.focused()
        local _tag = screen.tags[i]
        if _tag then _tag:view_only() end
    end)

    -- Move client to tag.
    map({ modkey, 'Shift', num }, function()
        if client.focus then
            local _tag = client.focus.screen.tags[i]
            if _tag then client.focus:move_to_tag(_tag) end
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


cset('<M-S-c>', function(c) c:kill() end)
cset('<M-o>', function(c) c:move_to_screen() end)
cset('<M-w>', function(c)
    c.maximized = not c.maximized
    c:raise()
end)



--  ╭──────────────────────────────────────────────────────────╮
--  │                      Mouse Bindings                      │
--  ╰──────────────────────────────────────────────────────────╯
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


--- INFO : Client Keybinds
local _, cmap = new_mode('client', '<S-C-c>')
local with = util.with_client
local toggle_client = util.toggle_client

-- print(client.kill == nil)
cmap('<Esc>', switch_to_default)
cmap('f', with(function(c)
    c.floating = not c.floating
    c:raise()
end))

cmap('<C-c>', with(function(c) c:kill() end))
cmap('d', with(function(c) print(c.class) end))
cmap('t', with(toggle_client 'on_top'))

--  x, y , width, height
---@format disable
cmap('i'     , with(function (c) c:relative_move(nil, -50, nil, nil)  end))
cmap('k'     , with(function (c) c:relative_move(nil, 50, nil, nil)   end))
cmap('j'     , with(function (c) c:relative_move(-50, nil, nil, nil)  end))
cmap('l'     , with(function (c) c:relative_move(50, nil, nil, nil)   end))
cmap('I'     , with(function (c) c:relative_move(nil, -300, nil, nil) end))
cmap('K'     , with(function (c) c:relative_move(nil, 300, nil, nil)  end))
cmap('J'     , with(function (c) c:relative_move(-300, nil, nil, nil) end))
cmap('L'     , with(function (c) c:relative_move(300, nil, nil, nil)  end))
cmap('<C-j>' , with(function (c) c:relative_move(nil, nil, -50, nil)  end))
cmap('<C-l>' , with(function (c) c:relative_move(nil, nil, 50, nil)   end))
cmap('<C-i>' , with(function (c) c:relative_move(nil, nil, nil, -50)  end))
cmap('<C-k>' , with(function (c) c:relative_move(nil, nil, nil, 50)   end))
-- local abbr_mode = handler.new_mode('a')
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
