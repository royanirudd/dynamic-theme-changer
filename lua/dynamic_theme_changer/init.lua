local config = require("dynamic_theme_changer.config")
local mood_detector = require("dynamic_theme_changer.mood_detector")

local M = {}

local function set_colorscheme(theme)
	vim.cmd("colorscheme " .. theme)
end

local function update_theme()
	local mood_number = M.config.custom_logic and M.config.custom_logic() or mood_detector.detect_mood()
	local theme = M.config.themes[mood_number]
	set_colorscheme(theme)
	if M.config.debug then
		local mood_name = M.config.mood_names[mood_number]
		print("Current mood: " .. mood_name .. " (" .. mood_number .. "), Theme: " .. theme)
	end
end

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", {}, config.defaults, opts or {})

	-- Initial theme update
	update_theme()

	-- Set up timer for periodic updates
	vim.fn.timer_start(M.config.update_interval * 1000, function()
		update_theme()
	end, { ["repeat"] = -1 }) -- Repeat indefinitely
end

return M
