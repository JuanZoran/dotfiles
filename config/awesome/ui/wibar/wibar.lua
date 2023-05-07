local height = 3
-- INFO :left
-- left_width   = 550px
-- middle_width = 380px
-- right_width  = 300px
-- width        = ${display.left_width}
-- height       = ${display.height}
-- offset-x     = 1%
-- offset-y     = 1%
-- fixed-center = true
-- width = ${display.middle_width}
-- offset-x = 43%
-- offset-y = 1%
-- height = ${display.height}
-- fixed-center = true
-- height = ${display.height}
-- offset-x = 83%
-- offset-y = 1%
-- fixed-center = true

awful.wibar {


}


-- s.wibar = awful.wibar {
--     screen   = s,
--     position = 'top',
--     height   = size.height * 0.03,
--     width    = size.width * 0.8,
--     shape    = gears.shape.rounded_rect,
--     stretch  = false,     -- 是否wibar需要拉伸填满屏幕。
--     bg       = beautiful.color.black,
--     fg       = beautiful.color.dim_blue,
--     opacity  = 0.8,     -- wibox 的不透明度，介于 0 和 1 之间。


--     border_width = 3,
--     border_color = beautiful.color.light_purple,
-- }

-- awful.wibar {
--     screen       = s,
--     position     = 'top',
--     height       = size.height * 0.03,
--     width        = size.width * 0.8,
--     shape        = gears.shape.rounded_rect,
--     stretch      = false, -- 是否wibar需要拉伸填满屏幕。
--     bg           = beautiful.color.black,
--     fg           = beautiful.color.dim_blue,
--     opacity      = 0.8, -- wibox 的不透明度，介于 0 和 1 之间。
--     border_width = 3,
--     border_color = beautiful.color.light_purple,
-- }


-- s.wibar:setup {
--     layout = wibox.layout.align.horizontal,
--     expand = 'none',
--     {
--         self.clock,
--         self.tasklist,
--         layout = wibox.layout.fixed.horizontal,
--     },
--     {
--         self.taglist,
--         layout = wibox.layout.fixed.horizontal,
--     },
--     {
--         -- Right widgets
--         self.systray,
--         wibox.layout.margin(
--             widgets['github-activity-widget'] {
--                 username = 'JuanZoran',
--             },
--             5, 5, 5, 5),
--         widgets['volume-widget'] {
--             icon_and_text_args = { font = widget_font },
--         },
--         self.battery,
--         s.layoutbox,
--         layout = wibox.layout.fixed.horizontal,
--         -- awful.widget.keyboardlayout(), -- Keyboard map indicator and switcher
--     },
-- }
