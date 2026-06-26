local MovementSystem = {}
local Registry = require("ecs_registry")

function MovementSystem.update(dt)
	local ids = Registry.query({ "transform", "velocity" })

	for i = 1, #ids do
		local id = ids[i]

		-- lua has pass by reference here not by value, so we are updating the db directly in registry
		local transform = Registry.getComponent(id, "transform")
		local velocity = Registry.getComponent(id, "velocity")

		-- xf = xi + v * deltaT
		transform.x = transform.x + velocity.vx * dt
		transform.y = transform.y + velocity.vy * dt
	end
end

return MovementSystem
