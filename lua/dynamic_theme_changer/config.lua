local M = {}

M.defaults = {
	themes = {
		[1] = "PaperColor", -- energetic
		[2] = "gruvbox", -- focused
		[3] = "tokyonight", -- relaxed
		[4] = "nightfox", -- calm
	},
	update_interval = 60, -- Update theme every minute (in seconds)
	debug = false, -- Set to true to enable debug messages
	custom_logic = nil, -- Placeholder for custom mood detection logic
}

M.mood_names = {
	[1] = "energetic",
	[2] = "focused",
	[3] = "relaxed",
	[4] = "calm",
}

return M
