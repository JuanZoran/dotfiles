--  ╭──────────────────────────────────────────────────────────╮
--  │                      Mouse Bindings                      │
--  ╰──────────────────────────────────────────────────────────╯
local mouse = mapper.keymap.mouse
local cmouse = mapper.keymap.client_mouse

local modkey = 'Mod4'
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
