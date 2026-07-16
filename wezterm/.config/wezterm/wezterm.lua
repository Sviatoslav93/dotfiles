local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.color_scheme = "GitHub Dark"
config.max_fps = 144
config.front_end = "WebGpu"
config.prefer_egl = true

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"Noto Color Emoji",
})

config.font_size = 12
config.line_height = 1.2

config.cell_width = 1.0
config.window_background_opacity = 0.96
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.cursor_blink_rate = 0
config.default_cursor_style = "SteadyBlock"
config.colors = {
	cursor_bg = "#cba6f7",
	cursor_border = "#cba6f7",
}

config.scrollback_lines = 100000

config.max_fps = 120
config.prefer_egl = true

config.window_close_confirmation = "NeverPrompt"

config.adjust_window_size_when_changing_font_size = false

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

return config
