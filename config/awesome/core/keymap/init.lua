local mapper = require 'lib.mapper'
local awful_client = require 'awful.client'
mapper.setup {}

-- NOTE :This depends on the penlight library
-- require 'pl.utils'.import(require 'pl.func')
local func = require 'pl.func'
local bind1 = func.bind1

local path = ... .. '.'
require(path .. 'misc')

local keymap            = mapper.keymap
local util              = mapper.util
local set               = util.global_map
local cset              = keymap.client_set
local new_mode          = mapper.new_mode

local wrap_func         = util.wrap_func
local with_exec         = util.with_exec
local exec              = util.action_warp
local switch_to_default = util.switch_to_default
local run               = util.run
--  ╭──────────────────────────────────────────────────────────╮
--  │                       awesome mode                       │
--  ╰──────────────────────────────────────────────────────────╯

set('<C-M-r>', awesome.restart)
set('<S-M-q>', awesome.quit)
local _, amap = new_mode('awesome', '<S-C-a>')

-- TODO :
-- Hide client
-- Move client to tag
-- Center window
-- Toggle Titlebar
set('<S-M-l>', run 'betterlockscreen -l dim')
local tag = awful.tag
amap('j', tag.viewprev)
amap('l', tag.viewnext)
amap('d', with_exec(require 'naughty'.destory_all_notifications))
amap('<Esc>', switch_to_default)














--  ╭──────────────────────────────────────────────────────────╮
--  │                        Rofi Mode                         │
--  ╰──────────────────────────────────────────────────────────╯
-- local rofi = 'rofi -theme ~/.config/awesome/rofis/' .. conf.rofi_theme .. '/config.rasi -show '
local _, rmap = new_mode('rofi', '<S-C-r>')
rmap('<Esc>', switch_to_default)
local rofi = 'rofi -show '
local rofi_win, rofi_run = run(rofi .. 'window'), run(rofi .. 'drun')
set('<M-e>', rofi_win)
set('<M-r>', rofi_run)
rmap('<CR>', with_exec(run 'chromium-browser'))
rmap('n', with_exec(run 'neovide'))
rmap('r', with_exec(rofi_run))
rmap('w', with_exec(rofi_win))
















--  ╭──────────────────────────────────────────────────────────╮
--  │                       device mode                        │
--  ╰──────────────────────────────────────────────────────────╯
local _, dmap = new_mode('device', '<S-C-d>')
dmap('<Esc>', switch_to_default)
set('<M-a>', run(conf.terminal))


local volume          = require 'helpers.volume'
local brightness      = require 'signal.brightness'

local volume_up       = bind1(volume.increase, 5)
local volume_down     = bind1(volume.decrease, 5)
local brightness_up   = bind1(brightness.increase, 5)
local brightness_down = bind1(brightness.decrease, 5)

-- For habits this should be removed later
set('<A-Up>', volume_up)
set('<S-A-Up>', brightness_up)
set('<A-Down>', volume_down)
set('<S-A-Down>', brightness_down)
dmap('<BS>', volume.toggle_mute)
dmap('i', volume_up)
dmap('k', volume_down)
dmap('I', brightness_up)
dmap('K', brightness_down)
-- set('<M-S-Space>', function() awful.layout.inc(-1) end)
-- set('<M-Space>', function() awful.layout.inc(1) end)













--  ╭──────────────────────────────────────────────────────────╮
--  │                     --- Window mode                      │
--  ╰──────────────────────────────────────────────────────────╯
local _, wmap = new_mode('window', '<S-C-w>')
local swap_client_bydirection = wrap_func(awful_client.swap.bydirection)
wmap('I', swap_client_bydirection 'up')
wmap('K', swap_client_bydirection 'down')
wmap('J', swap_client_bydirection 'left')
wmap('L', swap_client_bydirection 'right')


-- local flash_focus = bling.module.flash_focus
-- flash_focus.enable()
-- local focus_client_bydirection = wrap_func(function(direction)
--     awful_client.focus.bydirection(direction)
--     flash_focus.flashfocus(client.focus)
-- end)
-- local focus_client_bydirection = wrap_func(awful_client.focus.bydirection)
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

for i = 1, 5 do
    -- local num = i
    set('<M-' .. i .. '>', function()
        local screen = awful.screen.focused()
        local _tag = screen.tags[i]
        if _tag then _tag:view_only() end
    end)

    -- Move client to tag.
    set('<S-M-' .. i .. '>', function()
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
end










--  ╭──────────────────────────────────────────────────────────╮
--  │                       Client Mode                        │
--  ╰──────────────────────────────────────────────────────────╯
local _, cmap = new_mode('client', '<S-C-c>')
local with = util.with_client
local toggle_client = util.toggle_client

-- print(client.kill == nil)
cmap('<Esc>', switch_to_default)

local toggle_floating = with(function(c)
    c.floating = not c.floating
    if not c.floating then return end
    c:raise()
    awful.placement.centered(c)
end)
cmap('f', toggle_floating)
set('<S-C-Space>', toggle_floating)

set('<S-M-p>', function()
    local c = awful_client.restore()
    if c then c:activate() end
end)
cset('<M-p>', function(c)
    c.minimized = true
end)


cmap('<C-c>', with(function(c) c:kill() end))
cmap('d', with(function(c) print(c.class) end))
cmap('t', with(toggle_client 'on_top'))

cset('<M-S-c>', function(c) c:kill() end)
cset('<M-o>', function(c) c:move_to_screen() end)
cset('<M-w>', function(c)
    c.maximized = not c.maximized
    c:raise()
end)



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









































-- cmap({ modkey, 'Control', 'Return' }, function(c)
--     if awful.screen.focused().selected_tag:clients()[1] then
--         c:swap(awful.client.getmaster())
--     end
-- end)



-- set('<XF86AudioMute>', run 'pactl set-sink-mute @DEFAULT_SINK@ toggle')
-- set('<XF86AudioRaiseVolume>', volume_up)
-- set('<XF86AudioLowerVolume>', volume_down)
-- set('<XF86MonBrightnessUp>', brightness_up)
-- set('<XF86MonBrightnessDown>', brightness_down)
