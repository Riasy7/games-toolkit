-- event driven design
-- no loops, compared to previous update loop method

local InputMapper = {}
local bindings = {} -- maps physical key to the action (example: space maps to JUMP)
local action_states = {} -- boolean map of the actions (ex: JUMP to true)

function InputMapper.load(config)
	bindings = config
end

function InputMapper.pressed(key)
	local action = bindings[key]

	if action then
		action_states[action] = true
	end
end

function InputMapper.released(key)
	local action = bindings[key]
	if action then
		action_states[action] = false
	end
end

function InputMapper.isPressed(action)
	return action_states[action]
end

return InputMapper
