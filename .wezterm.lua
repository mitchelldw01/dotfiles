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
	left = 12,
	right = 12,
	top = 12,
	bottom = 0,
}

local rose_pine = wezterm.color.get_builtin_schemes()["rose-pine"]

for i, color in ipairs(rose_pine.ansi) do
	if color == "#31748f" then
		rose_pine.ansi[i] = "#3d90b2"
	end
end

for i, color in ipairs(rose_pine.brights) do
	if color == "#31748f" then
		rose_pine.brights[i] = "#3d90b2"
	end
end

config.color_schemes = {
	["custom-rose-pine"] = rose_pine,
}

config.color_scheme = "custom-rose-pine"

config.colors = {
	selection_bg = "#403d52",
}

return config
