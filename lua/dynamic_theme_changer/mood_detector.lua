local M = {}

local moods = { "energetic", "focused", "relaxed", "calm" }
local current_index = 1

function M.detect_mood()
	local mood = moods[current_index]
	current_index = (current_index % #moods) + 1
	return mood
end

return M
