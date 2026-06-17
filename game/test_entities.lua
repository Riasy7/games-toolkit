local World = require("toolkit.world")
local input = require("toolkit.input_mapper")

local Drifter = {}
Drifter.__index = Drifter

function Drifter.new(name, x, y, color)
	return setmetatable({ name = name, x = x, y = y, color = color, is_dead = false }, Drifter)
end

function Drifter:update(dt)
	self.x = self.x + 60 * dt

	-- test for garbage collection
	if self.x > 700 then
		self.is_dead = true
		print("LOG: " .. self.name .. " was cleaned up by world.lua!")
	end
end

function Drifter:draw()
	love.graphics.setColor(self.color)
	love.graphics.circle("fill", self.x, self.y, 25)
	love.graphics.setColor(1, 1, 1) -- reset to white
end

-- populate world when sandbox boots up
return function()
	World.add(Drifter.new("Red Circle", 100, 300, { 1, 0, 0 }))
	World.add(Drifter.new("Blue Circle", 100, 450, { 0, 0, 1 }))
end
