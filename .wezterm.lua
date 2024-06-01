local wezterm = require("wezterm")
local action = wezterm.action
local config = {}

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
	{ key = "t", mods = "CMD|SHIFT", action = action.ShowTabNavigator },
	{ key = "p", mods = "CMD|SHIFT", action = action.TogglePaneZoomState },
	{ key = "LeftArrow", mods = "CMD|SHIFT", action = action.MoveTabRelative(-1) },
	{ key = "RightArrow", mods = "CMD|SHIFT", action = action.MoveTabRelative(1) },
	{
		key = "k",
		mods = "CMD",
		action = action.Multiple({
			action.ClearScrollback("ScrollbackAndViewport"),
			action.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
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
	split = "#9693ac",
}

return config
