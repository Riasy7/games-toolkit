local sandbox = {}

function sandbox.load() end

function sandbox.update(dt) end

function sandbox.draw()
	love.graphics.clear(0.1, 0.1, 0.3) -- blue bg
	love.graphics.printf("SANDBOX ENVIRONMENT ACTIVE", 0, 200, love.graphics.getWidth(), "center")
	love.graphics.printf("Press 'M' to switch back to Main Menu", 0, 250, love.graphics.getWidth(), "center")
end

return sandbox
