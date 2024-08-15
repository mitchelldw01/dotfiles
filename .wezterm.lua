local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

config.font = wezterm.font("SFMono Nerd Font", { weight = "DemiBold" })
config.font_size = 17.0
config.line_height = 1.1
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.native_macos_fullscreen_mode = true
config.show_new_tab_button_in_tab_bar = false

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 1.0,
}

config.keys = {
	{ key = "f", mods = "CMD|CTRL", action = action.ToggleFullScreen },
	{ key = "d", mods = "CMD", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD|SHIFT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "CMD|SHIFT", action = action.CloseCurrentPane({ confirm = false }) },
	{ key = "h", mods = "CMD|SHIFT", action = action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD|SHIFT", action = action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CMD|SHIFT", action = action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CMD|SHIFT", action = action.ActivatePaneDirection("Down") },
	{ key = "p", mods = "CMD|SHIFT", action = action.TogglePaneZoomState },
	{ key = "LeftArrow", mods = "CMD|SHIFT", action = action.MoveTabRelative(-1) },
	{ key = "RightArrow", mods = "CMD|SHIFT", action = action.MoveTabRelative(1) },
	{ key = "y", mods = "CMD", action = action.ActivateCopyMode },
	{ key = "u", mods = "CMD", action = action.SwitchToWorkspace({ name = "default" }) },
	{ key = "i", mods = "CMD", action = action.SwitchToWorkspace({ name = "background" }) },
	{
		key = "k",
		mods = "CMD",
		action = action.Multiple({
			action.ClearScrollback("ScrollbackAndViewport"),
			action.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
}

config.color_scheme = "Kanagawa (Gogh)"
config.colors = { split = "#54546d" }

return config
