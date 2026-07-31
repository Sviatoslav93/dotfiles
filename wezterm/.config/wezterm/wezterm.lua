local wezterm = require("wezterm")
local config = wezterm.config_builder()

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
config.window_background_opacity = 0.90
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- config.cursor_blink_rate = 0
-- config.default_cursor_style = "SteadyBlock"
config.colors = {
	foreground = "#c5c9c5",
	background = "#181616",

	cursor_bg = "#c8c093",
	cursor_fg = "#c8c093",
	cursor_border = "#c8c093",

	selection_fg = "#c8c093",
	selection_bg = "#2d4f67",

	scrollbar_thumb = "#16161d",
	split = "#16161d",

	ansi = {
		"#0d0c0c",
		"#c4746e",
		"#8a9a7b",
		"#c4b28a",
		"#8ba4b0",
		"#a292a3",
		"#8ea4a2",
		"#c8c093",
	},
	brights = {
		"#a6a69c",
		"#e46876",
		"#87a987",
		"#e6c384",
		"#7fb4ca",
		"#938aa9",
		"#7aa89f",
		"#c5c9c5",
	},
}

config.scrollback_lines = 100000

config.window_close_confirmation = "NeverPrompt"

config.adjust_window_size_when_changing_font_size = false

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

return config
