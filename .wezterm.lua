local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

config.font = wezterm.font("SFMono Nerd Font", { weight = "DemiBold" })
config.font_size = 17.0
config.line_height = 1.1
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.native_macos_fullscreen_mode = true
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 1.0,
}

config.keys = {
	{ key = "f", mods = "CMD|CTRL", action = action.ToggleFullScreen },
	{ key = "y", mods = "CMD", action = action.ActivateCopyMode },
	{ key = "LeftArrow", mods = "CMD|SHIFT", action = action.MoveTabRelative(-1) },
	{ key = "RightArrow", mods = "CMD|SHIFT", action = action.MoveTabRelative(1) },
	{ key = "d", mods = "CMD", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD|SHIFT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "CMD|SHIFT", action = action.CloseCurrentPane({ confirm = false }) },
	{ key = "p", mods = "CMD", action = action.TogglePaneZoomState },
	{
		key = "k",
		mods = "CMD",
		action = action.Multiple({
			action.ClearScrollback("ScrollbackAndViewport"),
			action.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
}

config.color_scheme = "Tokyo Night Moon"
config.colors = {
	split = "#3b4261",
}

smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	modifiers = {
		move = "CTRL",
		resize = "CTRL|ALT",
		swap = false,
	},
})

return config
