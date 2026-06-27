-- TODO -- current comments cover the old way i implemented using OOP concepts, but i switched to ECS.
-- so change comments to explain the new Data Oriented design and not OOP design...
-- cause the old way, where there are players and entities as objects, are now just a number, an id, inside ecs_registry...
-- so world does no longer care about managing individual entities but pivoted to managing time and execution order of the systems...

-- in the OOP world, if we wanted a player we had to create a Player class, write an update function for it and pass it to World.add()
-- now in the ECS world, if i want a player, I just the Registry to create a new ID and give it a tranform, a velocity and a render componenet... or even input

-- TODO -- swap the if statements in the update and draw to assert instead so it doesn't crash

-- this file serves as a centralized bucket that automates the lifecycle of the game objects using OOP concepts like polymorphism
-- it basically says idk what u are and idc what you do, as long as you have a function named update, draw and you give urself to me i will run u...
local World = {}
local update_systems = {}
local draw_systems = {}

-- Given a stateless system module, insert it into the update_systems table
-- @param system: any update type of stateless system
--
-- example: World.addUpdateSystem(ControlSystem) inserts ControlSystem system into systems
function World.addUpdateSystem(system)
	table.insert(update_systems, system)
end

-- Given a stateless system module responsible for rendering, insert it into the draw_systems table
-- @param system: any draw type of stateless system
--
-- example: World.addDrawSystem(RenderingSystem) inserts Rendering system into systems
function World.addDrawSystem(system)
	table.insert(draw_systems, system)
end

-- Given a delta time dt, any game logic/system that has an update function is updated frame by frame
-- @param dt: delta time
--
-- example: World.update(dt) automatically updates ControlSystem, MovementSystem
function World.update(dt)
	for i = 1, #update_systems do
		if update_systems[i].update then
			update_systems[i].update(dt)
		end
	end
end

-- Draws the visual state of the registry by executing any registered rendering pipelines
--
-- example: World.draw() automatically draws a system with a draw function (like render)
function World.draw()
	for i = 1, #draw_systems do
		if draw_systems[i].draw then
			draw_systems[i].draw()
		end
	end
end

-- Clears the systems tables from all its values
function World.clear()
	update_systems = {}
	draw_systems = {}
end

return World
