local config = require("dynamic_theme_changer.config")
local mood_detector = require("dynamic_theme_changer.mood_detector")

local M = {}

local function set_colorscheme(theme)
	vim.cmd("colorscheme " .. theme)
end

local function update_theme()
	local mood = mood_detector.detect_mood()
	local theme = M.config.themes[mood]
	set_colorscheme(theme)
end

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", {}, config.defaults, opts or {})

	-- Initial theme update
	update_theme()

	-- Set up auto-command for periodic updates
	vim.api.nvim_create_autocmd("VimEnter", {
		callback = function()
			-- Delay the timer start to ensure it runs after lazy loading
			vim.defer_fn(function()
				vim.fn.timer_start(M.config.update_interval * 1000, function()
					update_theme()
				end, { ["repeat"] = -1 }) -- Repeat indefinitely
			end, 100) -- 100ms delay
		end,
	})
end

return M
