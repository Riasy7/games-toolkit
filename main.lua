local stateManager = require("toolkit.state_manager")
local input = require("toolkit.input_mapper")

function love.load()
	-- hardcoded for testing
	input.load({ space = "SELECT", g = "GO_TO_SANDBOX", m = "GO_TO_MENU", escape = "QUIT" })

	stateManager.add("menu", require("game.states.menu"))
	stateManager.add("sandbox", require("game.states.sandbox"))

	stateManager.switch("menu")
end

function love.update(dt)
	stateManager.update(dt)

	if input.isPressed("QUIT") then
		love.event.quit()
	end
end

function love.draw()
	stateManager.draw()
end

-- quick test
function love.keypressed(key)
	input.pressed(key)

	if input.isPressed("GO_TO_SANDBOX") then
		stateManager.switch("sandbox")
	elseif input.isPressed("GO_TO_MENU") then
		stateManager.switch("menu")
	end
end

function love.keyreleased(key)
	input.released(key)
end
