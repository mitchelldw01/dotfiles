local wezterm = require("wezterm")
local action = wezterm.action
local config = {}

config.font = wezterm.font("SF Mono")
config.font_size = 17.0
config.color_scheme = "Night Owl (Gogh)"
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false

config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 1.0,
}

config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 0,
}

config.keys = {
	{ key = "k", mods = "CMD", action = action.ClearScrollback("ScrollbackAndViewport") },
	{ key = "f", mods = "CMD|CTRL", action = action.ToggleFullScreen },
	{ key = "d", mods = "CMD", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD|SHIFT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "CMD|SHIFT", action = action.CloseCurrentPane({ confirm = true }) },
	{ key = "h", mods = "CMD|SHIFT", action = action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD|SHIFT", action = action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CMD|SHIFT", action = action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CMD|SHIFT", action = action.ActivatePaneDirection("Down") },
	{ key = "t", mods = "CMD|SHIFT", action = action.ShowTabNavigator },
	{ key = "LeftArrow", mods = "CMD|SHIFT", action = action.MoveTabRelative(-1) },
	{ key = "RightArrow", mods = "CMD|SHIFT", action = action.MoveTabRelative(1) },
}

return config
