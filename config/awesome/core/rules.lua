local key = require 'core.mappings'
-- local dpi         = require 'beautiful.xresources'.apply_dpi
-- Rules to apply to new clients (through the "manage" signal).
-- require'ruled'

awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus        = awful.client.focus.filter,
            raise        = true,
            keys         = key.clientkeys,
            buttons      = key.clientbuttons,
            screen       = awful.screen.preferred,
            -- placement    = awful.placement.no_overlap + awful.placement.no_offscreen,
            placement    = awful.placement.no_offscreen + awful.placement.centered,
        },
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {
                'DTA',   -- Firefox addon DownThemAll.
                'copyq', -- Includes session name in class.
                'pinentry',
            },
            class = {
                'Arandr',
                'Blueman-manager',
                'Gpick',
                'Kruler',
                'MessageWin',  -- kalarm.
                'Sxiv',
                'Tor Browser', -- Needs a fixed window size to avoid fingerprinting by screen size.
                'Wpa_gui',
                'veromix',
                'xtightvncviewer' },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                'Event Tester', -- xev.
            },
            role = {
                'AlarmWindow',   -- Thunderbird's calendar.
                'ConfigManager', -- Thunderbird's about:config.
                'pop-up',        -- e.g. Google Chrome's (detached) Developer Tools.
            },
        },
        properties = { floating = true },
    },

    -- Add titlebars to normal clients and dialogs
    {
        rule_any = {
            type = { 'normal', 'dialog' },
        },
        properties = { titlebars_enabled = true },
    },

    -- {
    --     rule_any = {
    --         fullscreen = true,
    --     },
    --     properties = {
    --         floating = true,
    --         titlebars_enabled = false,
    --         layer = 'below',
    --     },
    -- },

    {
        rule_any = {
            class = { 'QQ', 'neovide' },
        },
        properties = {
            floating = true,
        },
    },
}

client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)
-- Set Firefox to always map on the tag named "2" on screen 1.
-- { rule = { class = "Firefox" },
--   properties = { screen = 1, tag = "2" } },
