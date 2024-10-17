local M = {}

local current_mood = 0

function M.detect_mood()
	current_mood = (current_mood % 4) + 1
	return current_mood
end

return M
