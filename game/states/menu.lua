local menu = {}

function menu.load() end

function menu.update(dt) end

function menu.draw()
	love.graphics.clear(0.3, 0.1, 0.1) -- some red background
	love.graphics.printf("MAIN MENU", 0, 200, love.graphics.getWidth(), "center")
	love.graphics.printf("Press 'G' to switch to Gameplay Sandbox", 0, 250, love.graphics.getWidth(), "center")
end

return menu
