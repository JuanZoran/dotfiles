-- local gears = require("gears")
-- local theme_assets = require("beautiful.theme_assets")
-- local naughty = require("naughty")
-- local xrdb = xresources.get_current_theme()
-- local themes_path = gfs.get_themes_dir()
-- local beautiful = require("beautiful")

local Jb         = 'JetBrains Mono Nerd Font'
local norm_font  = Jb .. ' 12'
local conf_dir   = util.conf_dir
local home       = util.home
local xresources = require 'beautiful.xresources'
local dpi        = xresources.apply_dpi

-- themes

local theme                                          = {
    font = norm_font,
    dir  = home .. '/.config/awesome/theme',
    -- wallpaper = home .. '/background/awesome.jpg'
}

-- INFO :
--  ╭──────────────────────────────────────────────────────────╮
--  │                  bling module settings                   │
--  ╰──────────────────────────────────────────────────────────╯
-- theme.flash_focus_start_opacity = 0.9 -- the starting opacity
-- theme.flash_focus_step = 0.9
-- bling.module.flash_focus.enable()
theme.window_switcher_widget_bg                      = '#000000' -- The bg color of the widget
theme.window_switcher_widget_border_width            = 3         -- The border width of the widget
theme.window_switcher_widget_border_radius           = 0         -- The border radius of the widget
theme.window_switcher_widget_border_color            = '#58a6ff' -- The border color of the widget
theme.window_switcher_clients_spacing                = 20        -- The space between each client item
theme.window_switcher_client_icon_horizontal_spacing = 5         -- The space between client icon and text
theme.window_switcher_client_width                   = 150       -- The width of one client widget
theme.window_switcher_client_height                  = 250       -- The height of one client widget
theme.window_switcher_client_margins                 = 10        -- The margin between the content and the border of the widget
theme.window_switcher_thumbnail_margins              = 10        -- The margin between one client thumbnail and the rest of the widget
theme.thumbnail_scale                                = true      -- If set to true, the thumbnails fit policy will be set to "fit" instead of "auto"
theme.window_switcher_name_margins                   = 10        -- The margin of one clients title to the rest of the widget
theme.window_switcher_name_valign                    = 'left'    -- How to vertically align one clients title
theme.window_switcher_name_forced_width              = 200       -- The width of one title
theme.window_switcher_name_font                      = norm_font -- The font of all titles
theme.window_switcher_name_normal_color              = '#599eff' -- The color of one title if the client is unfocused
theme.window_switcher_name_focus_color               = '#89e051' -- The color of one title if the client is focused
theme.window_switcher_icon_valign                    = 'center'  -- How to vertically align the one icon
theme.window_switcher_icon_width                     = 40        -- The width of one icon


--  ╭──────────────────────────────────────────────────────────╮
--  │                       End Setting                        │
--  ╰──────────────────────────────────────────────────────────╯
theme.bg_normal   = '#1A1B26'
theme.bg_focus    = '#1A1B26'
theme.bg_urgent   = '#1A1B26'
theme.bg_minimize = '#1A1B26'
theme.bg_systray  = theme.bg_normal


-- decorations.enable_rounding()

theme.useless_gap   = 18
theme.border_width  = 2
theme.border_radius = 10
theme.border_normal = '#4E5173'
theme.border_focus  = '#8C91FA'
theme.border_marked = '#4E5173'


-- widgets
theme.taglist_fg          = '#80d1ff'
theme.taglist_fg_empty    = '#3f4859'
theme.taglist_fg_occupied = '#949eb3'
theme.taglist_font        = norm_font


-- menu
theme.menu_submenu_icon = conf_dir .. 'theme/submenu.png'
theme.menu_height       = dpi(25)
theme.menu_width        = dpi(120)
theme.menu_bg           = '#1b1f27'
theme.menu_font         = norm_font


-- awesome icon
theme.awesome_icon = conf_dir .. 'theme/awesome.png'


-- tag preview
theme.tag_preview_widget_border_radius = 10
theme.tag_preview_client_border_radius = 10
theme.tag_preview_client_opacity       = 0.1
theme.tag_preview_client_bg            = '#1b1f27'
theme.tag_preview_client_border_color  = '#3f4859'
theme.tag_preview_client_border_width  = 2
theme.tag_preview_widget_bg            = '#1b1f27'
theme.tag_preview_widget_border_color  = '#3f4859'
theme.tag_preview_widget_border_width  = 2
theme.tag_preview_widget_margin        = 0


-- titlebar
theme.titlebar_close_button_normal                  = conf_dir .. 'theme/titlebar/inactive.png'
theme.titlebar_close_button_focus                   = conf_dir .. 'theme/titlebar/close.png'
theme.titlebar_close_button_focus_hover             = conf_dir .. 'theme/titlebar/close_hover.png'

theme.titlebar_minimize_button_normal               = conf_dir .. 'theme/titlebar/inactive.png'
theme.titlebar_minimize_button_focus                = conf_dir .. 'theme/titlebar/minimize.png'
theme.titlebar_minimize_button_focus_hover          = conf_dir .. 'theme/titlebar/minimize_hover.png'

theme.titlebar_floating_button_normal_inactive      = conf_dir .. 'theme/titlebar/inactive.png'
theme.titlebar_floating_button_focus_inactive       = conf_dir .. 'theme/titlebar/floating.png'
theme.titlebar_floating_button_normal_active        = conf_dir .. 'theme/titlebar/inactive.png'
theme.titlebar_floating_button_focus_active         = conf_dir .. 'theme/titlebar/floating.png'
theme.titlebar_floating_button_focus_active_hover   = conf_dir .. 'theme/titlebar/floating_hover.png'
theme.titlebar_floating_button_focus_inactive_hover = conf_dir .. 'theme/titlebar/floating_hover.png'
-- theme.icon_theme                                    = nil

return theme
