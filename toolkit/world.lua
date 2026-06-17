-- this file serves as a centralized bucket that automates the lifecycle of the game objects using OOP concepts like polymorphism
-- it basically says idk what u are and idc what you do, as long as you have a function named update, draw and you give urself to me i will run u...
local World = {}
local objects = {}

function World.add(object)
	table.insert(objects, object)
end

function World.update(dt) end

function World.draw() end
