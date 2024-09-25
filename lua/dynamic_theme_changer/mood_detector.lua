local M = {}

local function get_current_hour()
	return tonumber(os.date("%H"))
end

function M.detect_mood()
	local hour = get_current_hour()

	if hour >= 5 and hour < 12 then
		return "energetic"
	elseif hour >= 12 and hour < 17 then
		return "focused"
	elseif hour >= 17 and hour < 21 then
		return "relaxed"
	else
		return "calm"
	end
end

return M
