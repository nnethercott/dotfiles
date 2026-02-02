-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font_size = 14
config.color_scheme = "Monokai Remastered"

config.font = wezterm.font_with_fallback({
	{ family = "Myna Nerd Font", harfbuzz_features = { "calt=0", "clig=0", "liga=0" } },
	-- { family = "JetBrainsMono Nerd Font", harfbuzz_features = { "calt=0", "clig=0", "liga=0" } },
	{ family = "Symbols Nerd Font Mono", scale = 0.8 },
})

-- Use WezTerm's integrated titlebar so we can control its transparency
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
-- config.window_decorations = "RESIZE|MACOS_FORCE_ENABLE_SHADOW"

config.window_padding = {
	left = 0,
	right = 0,
	top = 55, -- 55
	bottom = 0,
}

config.window_background_opacity = 0.7
config.macos_window_background_blur = 10 -- macOS only
-- config.window_background_image = constants.bg_image

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

-- keys
config.leader = { key = "a", mods = "CTRL" }
config.keys = {
	-- misc
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
	-- panes
	{ key = "=", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "Enter", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "w", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
	-- tabs
	{ key = "t", mods = "CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CTRL", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{ key = "]", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "[", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
}

-- remove dimming on inactive split
config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 1.0,
}

-- allow ctrl+w close processes
config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"tmux",
	"nvim",
	"vim",
}

-- tab bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

config.colors = {
	tab_bar = {
		background = "rgba(0,0,0,0.0)",
		active_tab = {
			bg_color = "#ff79c6", -- brightmagenta
			fg_color = "#000000",
		},

	},
}

-- Finally, return the configuration to wezterm:
return config
