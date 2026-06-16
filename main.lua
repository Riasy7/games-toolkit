local stateManager = require("toolkit.state_manager")

function love.load()
	stateManager.add("menu", require("game.states.menu"))
	stateManager.add("sandbox", require("game.states.sandbox"))

	stateManager.switch("menu")
end

function love.update(dt)
	stateManager.update(dt)
end

function love.draw()
	stateManager.draw()
end

-- quick test
function love.keypressed(key)
	if key == "g" then
		stateManager.switch("sandbox")
	elseif key == "m" then
		stateManager.switch("menu")
	elseif key == "escape" then
		love.event.quit()
	end
end
