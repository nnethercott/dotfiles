-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- nate
config.font_size = 14
config.color_scheme = "Monokai Remastered"

config.font = wezterm.font_with_fallback({
	{ family = "Myna", harfbuzz_features = { "calt=0", "clig=0", "liga=0" } },
	-- { family = "JetBrainsMono Nerd Font", harfbuzz_features = { "calt=0", "clig=0", "liga=0" } },
	{ family = "Symbols Nerd Font Mono", scale = 0.8 },
})

-- Use WezTerm's integrated titlebar so we can control its transparency
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
config.window_padding = {
	left = 0,
	right = 0,
	top = 55,
	bottom = 0,
}

config.enable_tab_bar = false
config.window_background_opacity = 0.7
config.macos_window_background_blur = 10 -- macOS only
-- config.window_background_image = constants.bg_image

-- Disable the default Alt+Enter fullscreen toggle
config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.window_frame = {
	border_left_width = "0.0cell",
	border_right_width = "0.0cell",
	border_left_color = "#5f6269",
	border_right_color = "#5f6269",
}

-- config.cell_width = 1.0
config.line_height = 1.07

-- disable bell
config.audible_bell = "Disabled"

-- Finally, return the configuration to wezterm:
return config
