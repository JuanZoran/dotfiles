local path = ... .. '.'
awful.screen.connect_for_each_screen(function(s)
    local widgets = require 'widgets'

    local button = util.button
    local self = setmetatable({}, {
        __index = function(_, name)
            local widget = require(path .. name)
            if type(widget) == 'function' then
                widget = widget(s)
            end
            return widget
        end,
    })

    s.layoutbox = awful.widget.layoutbox(s)
    s.layoutbox:buttons(util.keys {
        button { 1, function() awful.layout.inc(1) end },
        button { 3, function() awful.layout.inc(-1) end },
        button { 4, function() awful.layout.inc(1) end },
        button { 5, function() awful.layout.inc(-1) end },
    })

    --- INFO : Conf
    local size = s.geometry
    local auto_hidden = false
    s.wibar = awful.wibar {
        screen   = s,
        -- maximum_height = dpi(65),
        -- minimum_width  = s.geometry.width,
        -- maximum_width  = s.geometry.width,
        position = 'top',
        shape    = gears.shape.rounded_rect,
        height   = size.height * 0.03,
        width    = size.width,
        stretch  = false, -- 是否wibar需要拉伸填满屏幕。
        bg       = beautiful.color.dark,
        fg       = beautiful.color.dim_blue,
        -- opacity      = 0.8,       -- wibox 的不透明度，介于 0 和 1 之间。
        -- border_width = 4,
        -- border_color = '#69bbae',
    }

    local widget_font = beautiful.font_name .. ' 10'
    s.wibar:setup {
        layout = wibox.layout.align.horizontal,
        expand = 'none',
        {
            self.taglist,
            -- bg = '#282832'
            -- Left widgets
            -- wibox.layout.margin(awesome_icon, 7, 7, 7, 7),
            self.tasklist,

            layout = wibox.layout.fixed.horizontal,
        },
        {
            self.clock,
            layout = wibox.layout.fixed.horizontal,
        },
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            widgets['volume-widget'] {
                icon_and_text_args = { font = widget_font },
            },
            {
                self.systray,
                bg = beautiful.color.dim,
                shape = gears.shape.rounded_rect,
                -- forced_width = 300,
                widget = wibox.container.background,
            },
            -- awful.widget.keyboardlayout(), -- Keyboard map indicator and switcher
            widgets['github-activity-widget'] {
                username = 'JuanZoran',
            },
            s.layoutbox,
            -- lain.widget.net {
            --     settings = function()
            --         widget:set_markup(' ' .. net_now.received .. '|' .. net_now.sent)
            --         -- widget:set_markup((' %s|%s'):format(net_now.sent, net_now.received))
            --     end,
            -- },
            -- lain.widget.cpu {
            --     settings = function()
            --         widget:set_markup('Cpu ' .. cpu_now.usage)
            --     end,
            -- },
        },
    }
    -- Add widgets
    -- This is a valid wallpaper definition
    bling.module.wallpaper.setup {
        screen       = s,
        change_timer = 1800,
        position     = 'maximized',
        wallpaper    = { util.home .. '/background/dark' }, -- folders
        set_function = bling.module.wallpaper.setters.random,
    }


    if auto_hidden then
        s.show_wibar_timer = gears.timer {
            timeout = 0.25, -- 250ms delay between checks if the bar should be shown
            callback = function()
                local coords = mouse.coords()
                local s_g = s.geometry
                if coords.x < s_g.x or coords.x > s_g.x + s_g.width
                    -- comment this out if you want to show bar even for fullscreen windows
                    or (next(s.clients) and s.clients[1].fullscreen)
                then
                    if s.wibar.visible then s.wibar.visible = false end
                    return
                end
                -- moving the mouse within 5px of the bottom of the screen shows the bar
                if coords.y > s_g.y + s_g.height - s.wibar.height then
                    s.wibar.visible = true
                    s.show_wibar_timer:stop()
                end
            end,
            autostart = true,
        }
        s.wibar:connect_signal('mouse::leave', function()
            s.wibar.visible = false
            s.show_wibar_timer:start()
        end)
    end
end)

-- INFO : More option for wibar setup
-- ontop	On top of other windows. 在其他窗口之上。
-- cursor	The mouse cursor
-- visible	Visibility.
-- type     窗口类型（桌面、普通、停靠栏……）。
-- drawable	wibox 的可绘制对象。
-- widget	The widget that the wibox displays.
-- wibox    显示的小部件。
-- window	The X window id. X 窗口标识。
-- shape_bounding	The wibox’s bounding shape as a (native) cairo surface.
-- wibox 的边界形状作为（本地）cairo 表面。
-- shape_clip	wibox 的剪辑形状作为（本地）cairo 表面。
-- shape_input	wibox 的输入形状作为（本地）cairo 表面。
-- input_passthrough 将输入转发到 wibox 下面的客户端。
-- bgimage 可绘制对象的背景图像。
-- x            = 0,
-- y            = 500,
