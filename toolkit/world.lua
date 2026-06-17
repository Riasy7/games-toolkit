-- this file serves as a centralized bucket that automates the lifecycle of the game objects using OOP concepts like polymorphism
-- it basically says idk what u are and idc what you do, as long as you have a function named update, draw and you give urself to me i will run u...
local World = {}
local objects = {}

-- Given an object of any type of entity, insert it into the objects table
-- @param object: any type of entity, player, weapon...
--
-- example: World.add(player) inserts player object into objects
function World.add(object)
	table.insert(objects, object)
end

-- Given a delta time dt, any object contained in the world is updated (garbage collection as well)
-- @param dt: delta time
--
-- example: World.update(dt) automatically updates player, enemies, and bullets...
function World.update(dt)
	for i = #objects, 1, -1 do -- count backwards to account for the shifting of the table when table.remove happens
		local obj = objects[i]
		if obj.is_dead then
			table.remove(objects, i) -- potential TODO, make this O(1) instead of O(n), but for now its fine
		else
			obj:update(dt)
		end
	end
end

-- Draws any live object in the objects table
--
-- example: World.draw() automatically draws all players, enemies, and bullets..
function World.draw()
	for i = 1, #objects do
		objects[i]:draw()
	end
end

-- Clears the objects table from all its values
function World.clear()
	objects = {}
end
return World
