local wezterm = require 'wezterm'

-- local config = wezterm.config_builder()
local config = {}

config.color_scheme = 'Campbell'
-- config.color_scheme = "Dark Pastel"
-- config.color_scheme = "Dissonance"
config.colors = {
    background = '#080808',
    cursor_bg = '#c6c6c6',
    cursor_fg = '#c6c6c6',
    cursor_border = '#c6c6c6',
    -- the foreground color of selected text
    -- the background color of selected text
    selection_bg = '#323437',
    selection_fg = 'none',
}

config.window_padding = {
    left = 7,
    right = 0,
    top = 0,
    bottom = 0,
}

config.font =
    wezterm.font('JetBrains Mono NF', { weight = 'Bold' })
config.font_size = 14;

config.front_end = "WebGpu"

config.detect_password_input = true

config.animation_fps = 1
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.max_fps = 144;
config.default_cursor_style = "SteadyUnderline"

config.cursor_thickness = "2pt"
config.use_fancy_tab_bar = false
config.enable_tab_bar = false

return config
