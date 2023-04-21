-- local theme_assets = require 'beautiful.theme_assets'
local dpi          = require 'beautiful.xresources'.apply_dpi
local Jb           = 'JetBrains Mono Nerd Font'
local norm_font    = Jb .. ' 12'
local gfs          = require 'gears.filesystem'
local themes_path  = gfs.get_themes_dir()

local icon_dir     = util.conf_dir .. '/theme'

local c            = {
    dark         = '#0c0e0f',
    dim_blue     = '#6791c9',
    disabled     = '#707880',
    dim          = '#181b28',
    gray         = '#8a8e97',
    rosewater    = '#f5e0dc',
    flamingo     = '#f2cdcd',
    pink         = '#f5c2e7',
    mauve        = '#cba6f7',
    red          = '#f38ba8',
    maroon       = '#eba0ac',
    white        = '#ffffff',
    peach        = '#fab387',
    yellow       = '#f9e2af',
    green        = '#a6e3a1',
    custom       = '#69bbae',
    teal         = '#94e2d5',
    sky          = '#89dceb',
    sapphire     = '#74c7ec',
    blue         = '#89b4fa',
    lavender     = '#b4befe',
    base         = '#1e1e2e',
    purple       = '#7c3aed',
    light_purple = '#c61ad9',
    mantle       = '#181825',
}

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


---@class beautiful
local theme                            = {
    font_name      = Jb,
    font           = norm_font,
    color          = c,

    -- INFO :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                            Bg                            │
    --  ╰──────────────────────────────────────────────────────────╯
    active         = '#6A6E78',
    bg_normal      = c.base,
    bg_focus       = c.blue,
    bg_urgent      = c.base,
    bg_minimize    = c.base,
    -- bg_systray    = '#1A1B26',
    -- bg_sidebar  = '#161719',
    -- bg_selected = '#1D1F22',
    -- bg_widget   = '#1D1F22',

    icon_bg        = c.white,
    icon_normal    = c.rosewater,
    icon_selected  = c.white,

    -- INFO :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                            Fg                            │
    --  ╰──────────────────────────────────────────────────────────╯
    fg_normal      = c.lavender,
    fg_focus       = c.white,
    fg_contrast    = c.white,
    fg_urgent      = '#8A8E97',
    fg_minimize    = '#8A8E97',

    useless_gap    = 15,
    border_width   = 3,
    border_normal  = c.blue,
    border_focus   = c.purple,

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
    menu_submenu_icon    = themes_path .. 'default/submenu.png',
    menu_height          = dpi(25),
    menu_width           = dpi(200),
    menu_fg_normal       = '#89dceb',
    menu_bg_normal       = '#181825',
    -- menu_bg_normal    = '#8aadf4',

    -- INFO :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                         Hotkeys                          │
    --  ╰──────────────────────────────────────────────────────────╯
    hotkeys_bg           = c.dark,
    hotkeys_modifiers_fg = c.sapphire,
    -- HACK :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           Icon                           │
    --  ╰──────────────────────────────────────────────────────────╯
    -- icon_theme           = 'WhiteSur',
    -- INFO :
    --  ╭──────────────────────────────────────────────────────────╮
    --  │ layout                                                   │
    --  ╰──────────────────────────────────────────────────────────╯
    -- --- Layout
    -- --- You can use your own layout icons like this:
    layout_floating      = icon_dir .. '/layouts/floating.png',
    layout_max           = icon_dir .. '/layouts/max.png',
    layout_tile          = icon_dir .. '/layouts/tile.png',
    layout_dwindle       = icon_dir .. '/layouts/dwindle.png',
    layout_centered      = icon_dir .. '/layouts/centered.png',
    layout_machi         = icon_dir .. '/layouts/machi.png',

    -- layout_fairv         = icon_dir .. '/layouts/fairvw.png',
    -- layout_magnifier     = icon_dir .. '/layouts/magnifierw.png',
    -- layout_fullscreen    = icon_dir .. '/layouts/fullscreenw.png',
    -- layout_tilebottom    = icon_dir .. '/layouts/tilebottomw.png',
    -- layout_tileleft      = icon_dir .. '/layouts/tileleftw.png',
    -- layout_tiletop       = icon_dir .. '/layouts/tiletopw.png',
    -- layout_spiral        = icon_dir .. '/layouts/spiralw.png',
    -- layout_cornernw      = icon_dir .. '/layouts/cornernww.png',
    -- layout_cornerne      = icon_dir .. '/layouts/cornernew.png',
    -- layout_cornersw      = icon_dir .. '/layouts/cornersww.png',
    -- layout_cornerse      = icon_dir .. '/layouts/cornersew.png',
    -- layout_fairh         = icon_dir .. '/layouts/fairhw.png',


    -- -- INFO :
    -- --  ╭──────────────────────────────────────────────────────────╮
    -- --  │ Titlebar                                                 │
    -- --  ╰──────────────────────────────────────────────────────────╯
    titlebar_bg_normal                              = c.dark,
    titlebar_bg_focus                               = c.dark,
    titlebar_close_button_normal                    = icon_dir .. '/titlebar/normal.svg',
    titlebar_close_button_focus                     = icon_dir .. '/titlebar/close_focus.svg',
    titlebar_close_button_normal_hover              = icon_dir .. '/titlebar/close_focus_hover.svg',
    titlebar_close_button_focus_hover               = icon_dir .. '/titlebar/close_focus_hover.svg',

    -- Minimize Button
    titlebar_minimize_button_normal                 = icon_dir .. '/titlebar/normal.svg',
    titlebar_minimize_button_focus                  = icon_dir .. '/titlebar/minimize_focus.svg',
    titlebar_minimize_button_normal_hover           = icon_dir .. '/titlebar/minimize_focus_hover.svg',
    titlebar_minimize_button_focus_hover            = icon_dir .. '/titlebar/minimize_focus_hover.svg',

    -- Maximized Button (While Window is Maximized)
    titlebar_maximized_button_normal_active         = icon_dir .. '/titlebar/normal.svg',
    titlebar_maximized_button_focus_active          = icon_dir .. '/titlebar/maximized_focus.svg',
    titlebar_maximized_button_normal_active_hover   = icon_dir .. '/titlebar/maximized_focus_hover.svg',
    titlebar_maximized_button_focus_active_hover    = icon_dir .. '/titlebar/maximized_focus_hover.svg',

    -- Maximized Button (While Window is not Maximized)
    titlebar_maximized_button_normal_inactive       = icon_dir .. '/titlebar/normal.svg',
    titlebar_maximized_button_focus_inactive        = icon_dir .. '/titlebar/maximized_focus.svg',
    titlebar_maximized_button_normal_inactive_hover = icon_dir .. '/titlebar/maximized_focus_hover.svg',
    titlebar_maximized_button_focus_inactive_hover  = icon_dir .. '/titlebar/maximized_focus_hover.svg',

    -- TODO: TITBLE
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
    taglist_fg_focus                                = c.custom,
    taglist_fg_empty                                = c.gray,
    -- taglist_bg_focus = {
    --     type = 'linear',
    --     from = { 00, 00, 10 },
    --     to = { 100, 100, 30 },
    --     stops = { { 0, '#3F8CFF' }, { 1, '#5197FF' } },
    -- },
}

-- HACK : Window switcher
-- window_switcher_widget_bg                      = c.base,  -- The bg color of the widget
-- window_switcher_widget_border_width            = 3,       -- The border width of the widget
-- window_switcher_widget_border_radius           = dpi(10), -- The border radius of the widget
-- window_switcher_widget_border_color            = c.blue,  -- The border color of the widget
-- window_switcher_clients_spacing                = 20,      -- The space between each client item
-- window_switcher_client_icon_horizontal_spacing = 5,       -- The space between client icon and text
-- -- window_switcher_client_width                   = 400,       -- The width of one client widget
-- -- window_switcher_client_height                  = 200,       -- The height of one client widget
-- window_switcher_client_margins                 = 10,        -- The margin between the content and the border of the widget
-- window_switcher_thumbnail_margins              = 10,        -- The margin between one client thumbnail and the rest of the widget
-- thumbnail_scale                                = false,     -- If set to true, the thumbnails fit policy will be set to "fit" instead of "auto"
-- window_switcher_name_margins                   = 10,        -- The margin of one clients title to the rest of the widget
-- window_switcher_name_valign                    = 'center',  -- How to vertically align one clients title
-- window_switcher_name_forced_width              = 200,       -- The width of one title
-- -- window_switcher_name_font                      = norm_font, -- The font of all titles
-- window_switcher_name_normal_color              = '#89b4fa', -- The color of one title if the client is unfocused
-- window_switcher_name_focus_color               = c.blue,    -- The color of one title if the client is focused
-- window_switcher_icon_valign                    = 'center',  -- How to vertically align the one icon
-- window_switcher_icon_width                     = 40,        -- The width of one icon

theme.tag_preview_widget_border_radius = 10
theme.tag_preview_client_border_radius = 10
theme.tag_preview_client_opacity       = 0.9
theme.tag_preview_client_bg            = theme.bg_normal
theme.tag_preview_client_border_color  = theme.border_normal
theme.tag_preview_client_border_width  = theme.border_width
theme.tag_preview_widget_bg            = theme.bg_normal
theme.tag_preview_widget_border_color  = theme.border_normal
theme.tag_preview_widget_border_width  = 0
theme.tag_preview_widget_margin        = 0

-- theme.search_bar                       =
-- theme.dark_slider_bg                   = '#3F8CFF'
-- theme.arc_bg                           = '#161719'
-- theme.arc_color                        = '#6192FB'

-- theme.snap_bg           = theme.border_color
-- theme.snap_border_width = dpi(2)
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
