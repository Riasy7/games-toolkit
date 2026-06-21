local World = require("toolkit.world")
local Camera = require("toolkit.camera")

local sandbox = {}

function sandbox.load()
	if World.clear then
		World.clear()
	end

	local createTestEntities = require("game.test_entities")
	local playerTarget = createTestEntities()

	Camera.follow(playerTarget)
end

function sandbox.update(dt)
	World.update(dt)

	Camera.update(dt)
end

function sandbox.draw()
	love.graphics.clear(0.1, 0.1, 0.3) -- blue bg

	Camera.attach()

	-- added something on the background so that i can visualize the cmaera actually moving
	love.graphics.setColor(1, 1, 0)
	love.graphics.rectangle("fill", 500, 0, 10, love.graphics.getHeight())
	love.graphics.setColor(1, 1, 1)

	World.draw()

	Camera.detach()

	love.graphics.printf("SANDBOX ENVIRONMENT ACTIVE", 0, 200, love.graphics.getWidth(), "center")
	love.graphics.printf("Press 'M' to switch back to Main Menu", 0, 250, love.graphics.getWidth(), "center")
end

return sandbox
