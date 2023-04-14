-- if true then
--     return {
--         -- cursor_blink_ease_in  = 'EaseIn',
--         -- cursor_blink_ease_out = 'EaseOut',
--         cursor_blink_ease_in  = 'Constant',
--         cursor_blink_ease_out = 'Constant',
--         default_cursor_style  = 'BlinkingBar',
--         cursor_blink_rate     = 500,
--     }
-- end

local wz = require 'wezterm'

-- TODO : enable or not
local background_dir = os.getenv 'HOME' .. '/background'
local files = wz.read_dir(background_dir)
local background = files[math.random(#files)]

local mappings = require 'mappings'
return {
    keys                         = mappings.keys,
    key_tables                   = mappings.key_tables,
    leader                       = mappings.leader,
    disable_default_key_bindings = true,


    color_scheme              = 'tokyonight-storm',
    -- color_scheme              = '3024 night',
    use_dead_keys             = false,
    enable_scroll_bar         = true,
    use_fancy_tab_bar         = true,
    -- enable_kitty_graphics        = true,
    enable_csi_u_key_encoding = false,

    default_cursor_style      = 'BlinkingBar',
    -- animation_fps             = 100,

    cursor_blink_rate     = 500,
    cursor_blink_ease_in  = 'EaseIn',
    cursor_blink_ease_out = 'EaseOut',

    text_blink_rate           = 500,
    text_blink_ease_in        = 'EaseIn',
    text_blink_ease_out       = 'EaseOut',
    text_blink_rapid_ease_in  = 'EaseIn',
    text_blink_rapid_ease_out = 'EaseOut',


    -- TODO : more configurations for this
    background = {
        {
            source = {
                File = background,
            },
            hsb = { brightness = 0.10 },
            -- opacity = 0.8,
        },
    },


    window_decorations           = 'RESIZE',
    warn_about_missing_glyphs    = false,
    hide_tab_bar_if_only_one_tab = false,
    color_scheme_dirs            = { os.getenv 'HOME' .. '/.config/wezterm/colors/' },


    adjust_window_size_when_changing_font_size = false,


    font = wz.font_with_fallback {
        -- "FiraCode Nerd Font Mono",
        'JetBrains Mono Nerd Font Mono',
        '得意黑',
    },
}
