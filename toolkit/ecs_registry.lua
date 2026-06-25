local Registry = {}

-- private db hidden in this module
local nextEntityId = 1
local database = {}

-- id generation
function Registry.createEntity()
	local id = nextEntityId
	nextEntityId = nextEntityId + 1

	database[id] = {}
	return id
end

-- attaches component data table to a specific entity id
function Registry.addComponent(entityId, componentName, dataTable)
	if database[entityId] then
		database[entityId][componentName] = dataTable
	else
		print("Cannot add comonent Entity " .. tostring(entityId) .. " does not exist")
	end
end

-- gets a specific componenet data table for an entity id
function Registry.getComponent(entityId, componentName)
	if database[entityId] then
		return database[entityId][componentName]
	end
	return nil
end

-- scans the db and returns a list of the entities that contain all of the components inside of componentList
function Registry.query(componentList)
	local matches = {}

	for id, entity in pairs(database) do
		local hasAll = true

		for i = 1, #componentList do
			local component = componentList[i]

			if entity[component] == nil then
				hasAll = false
				break
			end
		end

		if hasAll then
			matches[#matches + 1] = id
		end
	end

	return matches
end

return Registry
