-- todo, add design recipe comments for cleanup
local Camera = {}

-- camera shouldnt know what its following but just its x and y

-- local state vars (hidden inside module)
local camX = 0
local camY = 0
local target = nil

-- and for smoothness we should use lerp (linear interpolation) where we add math smoothing
local lerpSpeed = 5

local function calculateTarget(target)
	local targetX = target.x - (love.graphics.getWidth() / 2)
	local targetY = target.y - (love.graphics.getHeight() / 2)
	return targetX, targetY
end

function Camera.follow(t) -- duck typing by passing in abstracted x and y target, doesn't know what its following
	if t then
		target = t
	end
end

function Camera.update(dt)
	-- declaring targetX and targetY is actually faster register access and no memory overhead, cause outside this function would require
	-- to access upvalues (lexical closures) and it requries some extra pointer lookup stuff
	if target then
		local targetX, targetY = calculateTarget(target)

		camX = camX + (targetX - camX) * lerpSpeed * dt
		camY = camY + (targetY - camY) * lerpSpeed * dt
	end
end

function Camera.attach() -- calls love.graphics.push()
	love.graphics.push()
	love.graphics.translate(-camX, -camY)
end

function Camera.detach() -- calls love.graphics.pop()
	love.graphics.pop()
end

return Camera
