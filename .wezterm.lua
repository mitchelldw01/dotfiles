local wezterm = require("wezterm")
local action = wezterm.action
local config = {}

config.keys = {
	{ key = "y", mods = "OPT", action = action.ActivateCopyMode },
	{ key = "f", mods = "OPT|CTRL", action = action.ToggleFullScreen },
	{
		key = "c",
		mods = "OPT",
		action = wezterm.action.SendString("zellij action clear\n"),
	},
}

config.native_macos_fullscreen_mode = true
config.enable_tab_bar = false

config.font = wezterm.font("SF Mono", { weight = "DemiBold" })
config.font_size = 17.0

config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 0,
}

config.color_scheme = "tokyonight_night"

return config
