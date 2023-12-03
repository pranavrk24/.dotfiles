-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("Iosevka Term Nerd Font")
config.font_size = 16.5

config.use_fancy_tab_bar = false

config.tab_bar_at_bottom = true

--[[ config.window_background_image = '/home/rently/Pictures/wallpapers/zen.png' ]]
--[[ config.window_background_image_hsb = { ]]
--[[   -- Darken the background image by reducing it to 1/3rd ]]
--[[   brightness = 0.1, ]]
--[[]]
--[[   -- You can adjust the hue by scaling its value. ]]
--[[   -- a multiplier of 1.0 leaves the value unchanged. ]]
--[[   hue = 0.8, ]]
--[[]]
--[[   -- You can adjust the saturation also. ]]
--[[   saturation = 1.0, ]]
--[[ } ]]

config.hide_tab_bar_if_only_one_tab = true

config.scrollback_lines = 10000

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

--[[ config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 } ]]
-- config.keys = {
	-- Resize panes
	--[[ { ]]
	--[[   key = 'r', ]]
	--[[   mods = 'LEADER', ]]
	--[[   action = act.ActivateKeyTable { ]]
	--[[     name = 'resize_pane', ]]
	--[[     one_shot = false, ]]
	--[[   }, ]]
	--[[ }, ]]
	--[[]]
	--[[ -- Activate panes ]]
	--[[ { ]]
	--[[   key = "h", ]]
	--[[   mods = "LEADER", ]]
	--[[   action = act.ActivatePaneDirection "Left", ]]
	--[[ }, ]]
	--[[ { ]]
	--[[   key = "k", ]]
	--[[   mods = "LEADER", ]]
	--[[   action = act.ActivatePaneDirection "Up", ]]
	--[[ }, ]]
	--[[ { ]]
	--[[   key = "j", ]]
	--[[   mods = "LEADER", ]]
	--[[   action = act.ActivatePaneDirection "Down", ]]
	--[[ }, ]]
	--[[ { ]]
	--[[   key = "l", ]]
	--[[   mods = "LEADER", ]]
	--[[   action = act.ActivatePaneDirection "Right", ]]
	--[[ }, ]]
	--[[]]
	-- Split panes
	-- {
	--	key = '"',
	--	mods = "LEADER|SHIFT",
	--	action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	-- },
	-- {
	--	key = "%",
	--	mods = "LEADER|SHIFT",
	--	action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	-- },
-- }

-- https://wezfurlong.org/wezterm/config/key-tables.html
config.key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return config
