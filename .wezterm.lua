-- Pull wezterm API
local wezterm = require("wezterm")

-- CONFIGS
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 16

config.window_decorations = "RESIZE"

config.colors = {
	-- General Colors
	foreground = "#CDD6F4", -- Text
	background = "#1E1E2E", -- Background
	cursor_bg = "#A6E3A1", -- Cursor background
	cursor_border = "#A6E3A1", -- Cursor border
	cursor_fg = "#1E1E2E", -- Cursor foreground
	selection_bg = "#45475A", -- Selection background
	selection_fg = "#F5E0DC", -- Selection foreground

	-- ANSI Colors
	ansi = {
		"#45475A", -- Black
		"#F38BA8", -- Red
		"#A6E3A1", -- Green
		"#F9E2AF", -- Yellow
		"#89B4FA", -- Blue
		"#CBA6F7", -- Magenta
		"#94E2D5", -- Cyan
		"#BAC2DE", -- White
	},

	-- Bright Colors
	brights = {
		"#585B70", -- Bright Black (Grey)
		"#F38BA8", -- Bright Red
		"#A6E3A1", -- Bright Green
		"#F9E2AF", -- Bright Yellow
		"#89B4FA", -- Bright Blue
		"#CBA6F7", -- Bright Magenta
		"#94E2D5", -- Bright Cyan
		"#A6ADC8", -- Bright White
	},
}


-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 1
return config
