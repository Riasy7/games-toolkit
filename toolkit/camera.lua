local Camera = {}

-- camera shouldnt know what its following but just its x and y
-- and for smoothness we should use lerp (linear interpolation) where we add math smoothing

function Camera.follow(target) end -- duck typing by passing in abstracted x and y target

function Camera.attach() end -- calls love.graphics.push()

function Camera.detach() end -- calls love.graphics.pop()
