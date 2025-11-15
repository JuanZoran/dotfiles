local wz = require 'wezterm'

-- TODO : enable or not
local background = os.getenv 'HOME' .. '/background/dark'
while os.execute('cd ' .. background) do
    local files = wz.read_dir(background)
    background = files[math.random(#files)]
end

local mappings = require 'mappings'
return {
    -- color_scheme              = 'tokyonight-storm',
    color_scheme                 = 'Catppuccin Macchiato',
    color_scheme_dirs            = { os.getenv 'HOME' .. '/.config/wezterm/colors' },
    keys                         = mappings.keys,
    key_tables                   = mappings.key_tables,
    leader                       = mappings.leader,
    disable_default_key_bindings = true,
    use_ime                      = true,


    use_dead_keys                = false,
    enable_scroll_bar            = false,
    enable_kitty_graphics        = true,
    enable_csi_u_key_encoding    = false,

    default_cursor_style         = 'BlinkingBar',
    animation_fps                = 100,

    cursor_blink_rate            = 500,
    cursor_blink_ease_in         = 'EaseIn',
    cursor_blink_ease_out        = 'EaseOut',

    text_blink_rate              = 500,
    text_blink_ease_in           = 'EaseIn',
    text_blink_ease_out          = 'EaseOut',
    text_blink_rapid_ease_in     = 'EaseIn',
    text_blink_rapid_ease_out    = 'EaseOut',

    -- TODO : more configurations for this
    background                   = {
        {
            source = {
                File = background,
            },
            hsb = { brightness = 0.1 },
            -- opacity = 0.8,
        },
    },
    window_decorations           = 'RESIZE',
    warn_about_missing_glyphs    = false,

    --- INFO :Tab bar
    use_fancy_tab_bar            = false,
    tab_bar_at_bottom            = false,
    hide_tab_bar_if_only_one_tab = false,


    inactive_pane_hsb                          = { saturation = 1.0, brightness = 1.0 },

    font_size                                  = 10,
    enable_wayland                             = false,
    bold_brightens_ansi_colors                 = true,

    adjust_window_size_when_changing_font_size = false,
    font                                       = wz.font_with_fallback {
        'JetBrains Mono Nerd Font Mono',
        '得意黑',
        'FiraCode Nerd Font Mono',
        'Material Icons Round',
    },

    colors                                     = {
        --     foreground = '#c0caf5',
        --     background = '#24283b',
        cursor_fg = '#1d202f',
        cursor_bg = '#58a6ff',
        --     cursor_border = '#c0caf5',
        --     selection_bg = '#364a82',
        --     selection_fg = '#c0caf5',
        --     scrollbar_thumb = '#7aa2f7',
        --     split = '#090909',
        ansi = { '#1d202f', '#f7768e', '#9ece6a', '#e0af68', '#7aa2f7', '#bb9af7', '#7dcfff', '#a9b1d6' },
        brights = { '#414868', '#f7768e', '#9ece6a', '#e0af68', '#7aa2f7', '#bb9af7', '#7dcfff', '#c0caf5' },
        --     -- indexed = { [136] = '#edeff0' },
        --     tab_bar = {
        --         -- background = '#1e1e2e',
        --         background = 'None',
        --         active_tab = {
        --             bg_color = '#181825',
        --             fg_color = '#69bbae',
        --             italic = true,
        --         },
        --         inactive_tab = { bg_color = '#181825', fg_color = '#b4befe' },
        --         inactive_tab_hover = {
        --             bg_color = '#89dceb',
        --             fg_color = '#090909',
        --         },
        --         new_tab = {
        --             bg_color = '#181825',
        --             fg_color = '#89b4fa',
        --         },
        --         new_tab_hover = { bg_color = '#6791c9', fg_color = '#090909' },
        --     },
    },
}
