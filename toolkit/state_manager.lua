-- TODO
-- DOCUMENTATION
local StateManager = {}
local states = {}
local active_state = nil

-- add a new screen into the manager
function StateManager.add(state_name, state_module)
	states[state_name] = state_module
end

-- need a function to switch between states/screens
function StateManager.switch(state_name)
	if not states[state_name] then
		error("State '" .. state_name .. "' does not exist in the toolkit!")
	end
	active_state = states[state_name] -- not the actual logic but something like this

	-- if state has a load function, it will run it when needed
	if active_state.load then
		active_state.load()
	end
end

function StateManager.update(dt)
	if active_state and active_state.update then -- if not nil, so if theres currently an active state
		active_state.update(dt)
	end
end

function StateManager.draw()
	if active_state and active_state.draw then
		active_state.draw()
	end
end

return StateManager
