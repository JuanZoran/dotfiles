local theme_assets = require 'beautiful.theme_assets'
local dpi          = require 'beautiful.xresources'.apply_dpi

local Jb           = 'JetBrains Mono Nerd Font'
local norm_font    = Jb .. ' 12'
local gfs          = require 'gears.filesystem'
local themes_path  = gfs.get_themes_dir()


-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

local theme                 = {
    font          = norm_font,

    -- INFO :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                            Bg                            │
    --  ╰──────────────────────────────────────────────────────────╯
    active        = '#6A6E78',
    -- bg             = '#161719',
    bg_normal     = '#1A1B26',
    bg_focus      = '#1A1B26',
    bg_urgent     = '#1A1B26',
    bg_minimize   = '#1A1B26',
    bg_systray    = '#1A1B26',

    -- bg_sidebar  = '#161719',
    -- bg_selected = '#1D1F22',
    -- bg_widget   = '#1D1F22',

    icon_bg       = '#FFFFFF',
    icon_normal   = '#8A8E97',
    icon_selected = '#FFFFFF',

    -- INFO :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                            Fg                            │
    --  ╰──────────────────────────────────────────────────────────╯
    fg_normal     = '#8A8E97',
    fg_focus      = '#FFFFFF',
    fg_contrast   = '#FFFFFF',
    fg_urgent     = '#8A8E97',
    fg_minimize   = '#8A8E97',

    useless_gap   = 20,
    border_width  = 2,
    border_normal = '#4E5173',
    border_focus  = '#8C91FA',
    border_marked = '#4E5173',
    border_color  = '#252628',


    -- INFO :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          radius                          │
    --  ╰──────────────────────────────────────────────────────────╯
    bar_radius     = dpi(25),
    border_radius  = dpi(10),
    client_radius  = dpi(12),
    sidebar_radius = dpi(40),
    dock_radius    = dpi(25),


    -- INFO :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           Menu                           │
    --  ╰──────────────────────────────────────────────────────────╯
    -- Variables set for theming the menu:
    -- menu_[bg|fg]_[normal|focus]
    -- menu_[border_color|border_width]
    menu_submenu_icon = themes_path .. 'default/submenu.png',
    menu_height       = dpi(25),
    menu_width        = dpi(200),
    menu_bg_normal    = '#1b1f27',
    -- menu_bg_normal    = '#8aadf4',
    -- menu_fg_normal    = '#81c8be',
    -- HACK :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           Icon                           │
    --  ╰──────────────────────────────────────────────────────────╯
    icon_theme        = 'WhiteSur',
    -- INFO :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │ layout                                                   │
    --  ╰──────────────────────────────────────────────────────────╯
    -- layout_fairh                              = themes_path .. 'default/layouts/fairhw.png',
    -- layout_fairv                              = themes_path .. 'default/layouts/fairvw.png',
    -- layout_floating                           = themes_path .. 'default/layouts/floatingw.png',
    -- layout_magnifier                          = themes_path .. 'default/layouts/magnifierw.png',
    -- layout_max                                = themes_path .. 'default/layouts/maxw.png',
    -- layout_fullscreen                         = themes_path .. 'default/layouts/fullscreenw.png',
    -- layout_tilebottom                         = themes_path .. 'default/layouts/tilebottomw.png',
    -- layout_tileleft                           = themes_path .. 'default/layouts/tileleftw.png',
    -- layout_tile                               = themes_path .. 'default/layouts/tilew.png',
    -- layout_tiletop                            = themes_path .. 'default/layouts/tiletopw.png',
    -- layout_spiral                             = themes_path .. 'default/layouts/spiralw.png',
    -- layout_dwindle                            = themes_path .. 'default/layouts/dwindlew.png',
    -- layout_cornernw                           = themes_path .. 'default/layouts/cornernww.png',
    -- layout_cornerne                           = themes_path .. 'default/layouts/cornernew.png',
    -- layout_cornersw                           = themes_path .. 'default/layouts/cornersww.png',
    -- layout_cornerse                           = themes_path .. 'default/layouts/cornersew.png',


    -- -- INFO :
    -- --  ╭──────────────────────────────────────────────────────────╮
    -- --  │ Titlebar                                                 │
    -- --  ╰──────────────────────────────────────────────────────────╯
    -- -- You can add as many variables as
    -- -- you wish and access them by using
    -- -- beautiful.variable in your rc.lua
    -- --theme.bg_widget = "#cc0000"
    -- -- Define the image to load
    titlebar_close_button_normal                  = util.conf_dir .. '/theme/titlebar/inactive.png',
    titlebar_close_button_focus                   = util.conf_dir .. '/theme/titlebar/close.png',
    titlebar_close_button_focus_hover             = util.conf_dir .. '/theme/titlebar/close_hover.png',
    titlebar_minimize_button_normal               = util.conf_dir .. '/theme/titlebar/inactive.png',
    titlebar_minimize_button_focus                = util.conf_dir .. '/theme/titlebar/minimize.png',
    titlebar_minimize_button_focus_hover          = util.conf_dir .. '/theme/titlebar/minimize_hover.png',
    titlebar_floating_button_normal_inactive      = util.conf_dir .. '/theme/titlebar/inactive.png',
    titlebar_floating_button_focus_inactive       = util.conf_dir .. '/theme/titlebar/floating.png',
    titlebar_floating_button_normal_active        = util.conf_dir .. '/theme/titlebar/inactive.png',
    titlebar_floating_button_focus_active         = util.conf_dir .. '/theme/titlebar/floating.png',
    titlebar_floating_button_focus_active_hover   = util.conf_dir .. '/theme/titlebar/floating_hover.png',
    titlebar_floating_button_focus_inactive_hover = util.conf_dir .. '/theme/titlebar/floating_hover.png',
    -- titlebar_unfocused                        = '#252628',
    -- titlebar_close_button_normal              = themes_path .. 'default/titlebar/close_normal.png',
    -- titlebar_close_button_focus               = themes_path .. 'default/titlebar/close_focus.png',
    -- titlebar_minimize_button_normal           = themes_path .. 'default/titlebar/minimize_normal.png',
    -- titlebar_minimize_button_focus            = themes_path .. 'default/titlebar/minimize_focus.png',
    -- titlebar_ontop_button_normal_inactive     = themes_path .. 'default/titlebar/ontop_normal_inactive.png',
    -- titlebar_ontop_button_focus_inactive      = themes_path .. 'default/titlebar/ontop_focus_inactive.png',
    -- titlebar_ontop_button_normal_active       = themes_path .. 'default/titlebar/ontop_normal_active.png',
    -- titlebar_ontop_button_focus_active        = themes_path .. 'default/titlebar/ontop_focus_active.png',
    -- titlebar_sticky_button_normal_inactive    = themes_path .. 'default/titlebar/sticky_normal_inactive.png',
    -- titlebar_sticky_button_focus_inactive     = themes_path .. 'default/titlebar/sticky_focus_inactive.png',
    -- titlebar_sticky_button_normal_active      = themes_path .. 'default/titlebar/sticky_normal_active.png',
    -- titlebar_sticky_button_focus_active       = themes_path .. 'default/titlebar/sticky_focus_active.png',
    -- titlebar_floating_button_normal_inactive  = themes_path .. 'default/titlebar/floating_normal_inactive.png',
    -- titlebar_floating_button_focus_inactive   = themes_path .. 'default/titlebar/floating_focus_inactive.png',
    -- titlebar_floating_button_normal_active    = themes_path .. 'default/titlebar/floating_normal_active.png',
    -- titlebar_floating_button_focus_active     = themes_path .. 'default/titlebar/floating_focus_active.png',
    -- titlebar_maximized_button_normal_inactive = themes_path .. 'default/titlebar/maximized_normal_inactive.png',
    -- titlebar_maximized_button_focus_inactive  = themes_path .. 'default/titlebar/maximized_focus_inactive.png',
    -- titlebar_maximized_button_normal_active   = themes_path .. 'default/titlebar/maximized_normal_active.png',
    -- titlebar_maximized_button_focus_active    = themes_path .. 'default/titlebar/maximized_focus_active.png',

    -- INFO :
    -- Notifications
    -- Variables set for theming notifications:
    -- notification_font
    -- notification_[bg|fg]
    -- notification_[width|height|margin]
    -- notification_[border_color|border_width|shape|opacity]


    -- INFO :
    -- Taglist
    taglist_bg_focus = {
        type = 'linear',
        from = { 00, 00, 10 },
        to = { 100, 100, 30 },
        stops = { { 0, '#3F8CFF' }, { 1, '#5197FF' } },
    },
}

-- Generate taglist squares:
local taglist_square_size   = dpi(4)
theme.taglist_squares_sel   = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)

theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)


-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)


theme.collision_focus_bg = theme.bg_normal
theme.collision_focus_fg = theme.fg_normal


-- theme.tag_preview_widget_border_radius = 10
-- theme.tag_preview_client_border_radius = 10
-- theme.tag_preview_client_opacity = 0.1
-- theme.tag_preview_client_bg = "#1b1f27"
-- theme.tag_preview_client_border_color = "#3f4859"
-- theme.tag_preview_client_border_width = 2
-- theme.tag_preview_widget_bg = "#1b1f27"
-- theme.tag_preview_widget_border_color = "#3f4859"
-- theme.tag_preview_widget_border_width = 2
-- theme.tag_preview_widget_margin = 0
-- theme.search_bar        = '#1D1F22'
-- theme.dark_slider_bg    = '#3F8CFF'
-- theme.arc_bg            = '#161719'
-- theme.arc_color         = '#6192FB'

-- theme.snap_bg           = theme.border_color
-- theme.snap_border_width = dpi(2)
-- theme.red                = '#db7272'
-- theme.grey               = '#8B8B8B'
--  ╭──────────────────────────────────────────────────────────╮
--  │                          Icons                           │
--  ╰──────────────────────────────────────────────────────────╯
-- theme.dark_toggle        = util.conf_dir .. '/icons/bar/light.png'
-- theme.darkmode           = util.conf_dir .. '/icons/bar/darkmode.png'

-- theme.clear_icon         = util.conf_dir .. '/icons/notif-center/clear.png'
-- theme.clear_filled       = util.conf_dir .. '/icons/notif-center/clear_filled.png'
-- theme.delete_icon        = util.conf_dir .. '/icons/notif-center/delete.png'

-- theme.profile            = util.conf_dir .. '/icons/bar/uiface2.png'

-- theme.home               = util.conf_dir .. '/icons/tag/home.png'
-- theme.home_selected      = util.conf_dir .. '/icons/tag/home_selected.png'

-- theme.dashboard          = util.conf_dir .. '/icons/tag/dashboard.png'
-- theme.dashboard_selected = util.conf_dir .. '/icons/tag/dashboard_selected.png'

-- theme.folder             = util.conf_dir .. '/icons/tag/folder.png'
-- theme.folder_selected    = util.conf_dir .. '/icons/tag/folder_selected.png'

-- theme.report             = util.conf_dir .. '/icons/tag/report.png'
-- theme.report_selected    = util.conf_dir .. '/icons/tag/report_selected.png'

-- theme.cal                = util.conf_dir .. '/icons/tag/cal.png'
-- theme.cal_selected       = util.conf_dir .. '/icons/tag/cal_selected.png'

-- theme.document           = util.conf_dir .. '/icons/tag/document.png'
-- theme.document_selected  = util.conf_dir .. '/icons/tag/document_selected.png'

-- theme.settings           = util.conf_dir .. '/icons/tag/settings.png'
-- theme.settings_selected  = util.conf_dir .. '/icons/tag/settings_selected.png'

-- theme.wide_icon          = util.conf_dir .. '/icons/bar/wide.png'

-- theme.music_icon         = util.conf_dir .. '/icons/bar/music.png'

-- theme.vol                = util.conf_dir .. '/icons/bar/vol.png'

-- theme.temp               = util.conf_dir .. '/icons/bar/temp.png'
-- theme.cpu                = util.conf_dir .. '/icons/bar/cpu.png'
-- theme.ram                = util.conf_dir .. '/icons/bar/ram.png'

-- theme.notif_icon         = util.conf_dir .. '/icons/notif-center/notif.png'

-- theme.search_icon        = util.conf_dir .. '/icons/bar/search.png'
-- theme.search_bar_icon    = colorize_icon(theme.search_icon, theme.icon_normal)

-- theme.logo               = util.conf_dir .. '/icons/bar/align.png'
-- theme.logo_normal        = colorize_icon(theme.logo, theme.icon_normal)
-- theme.logo_selected      = colorize_icon(theme.logo, theme.icon_selected)

-- theme.moon               = util.conf_dir .. '/icons/bar/moon.png'

-- theme.shutdown           = util.conf_dir .. '/icons/power/shutdown.png'
-- theme.restart            = util.conf_dir .. '/icons/power/restart.png'
-- theme.logout             = util.conf_dir .. '/icons/power/logout.png'

-- theme.dots               = util.conf_dir .. '/icons/bar/dots.png'

-- -- dock icons

-- theme.spotify            = util.conf_dir .. '/icons/dock/Spotify.icns'
-- theme.chrome             = util.conf_dir .. '/icons/dock/Safari.icns'
-- theme.mail               = util.conf_dir .. '/icons/dock/Mail.icns'
-- theme.file               = util.conf_dir .. '/icons/dock/Finder.icns'
-- theme.netflix            = util.conf_dir .. '/icons/dock/Netflix.icns'
-- theme.vscode             = util.conf_dir .. '/icons/dock/Vscode.icns'


-- -- notif
-- theme.notification_icon = colorize_icon(theme.notif_icon, theme.icon_normal)
-- theme.delete            = colorize_icon(theme.delete_icon, theme.red)
-- theme.delete_hover      = colorize_icon(theme.delete_icon, theme.red .. '80')
-- theme.clear             = colorize_icon(theme.clear_icon, theme.grey)
-- theme.clear_hover       = colorize_icon(theme.clear_filled, theme.grey)

return theme
