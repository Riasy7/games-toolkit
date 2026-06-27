local ControlSystem = {}

local Registry = require("toolki.ecs_registry")
local InputMapper = require("toolkit.input_mapper")

function ControlSystem.update(dt)
	local ids = Registry.query("input", "velocity")

	for i = 1, #ids do
		local id = ids[i]

		local input = Registry.getComponent(id, "input")
		local velocity = Registry.getComponent(id, "velocity")

		velocity.vx = 0
		velocity.vy = 0

		if InputMapper.isPressed(input.right) then
			velocity.vx = input.speed
		end
		if InputMapper.isPressed(input.left) then
			velocity.vx = -input.speed
		end
		if InputMapper.isPressed(input.down) then
			velocity.vy = input.speed
		end
		if InputMapper.isPressed(input.up) then
			velocity.vy = -input.speed
		end
	end
end

return ControlSystem
