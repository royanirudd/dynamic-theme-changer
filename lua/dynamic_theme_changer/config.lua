local M = {}

M.defaults = {
	themes = {
		energetic = "PaperColor",
		focused = "gruvbox",
		relaxed = "tokyonight",
		calm = "nightfox",
	},
	update_interval = 60, -- Update theme every minute (in seconds)
	debug = false, -- Set to true to enable debug messages
	custom_logic = nil, -- Placeholder for custom mood detection logic
}

return M
