
local shelter_name = "kr-shelter"
local KRASTORIO_SHELTER_EVENT_FILTER =
{
	-- shelter entity name
	{
		filter = "name", 
        name   = shelter_name
    }
}

local function showOnSurfaceText(tag)
	if not tag then error("You shouldn't be creating a tag without any parameters.") end
	if not tag.entity then error("No entity to follow for tag.") end
	if not tag.entity.valid then error("Well the entity wasn't valid to create a tag.") end
	if not tag.position then
		if not tag.offset then
			tag.offset = {x = 0, y = 0}
		else
		if not tag.offset.x then tag.offset.x = tag.offset[1] or 0 end
		if not tag.offset.y then tag.offset.y = tag.offset[2] or 0 end
		end
		tag.position = {x = tag.entity.position.x + tag.offset.x, y = tag.entity.position.y + tag.offset.y}
	end
		
	tag.entity.surface.create_entity
	{
		type         = "flying-text",
		name         = "flying-text",
		position     = tag.position,
		text         = tag.text or tag.entity.localised_name,
		color        = tag.color or {},
		time_to_live = 200,
		speed        = 0.05
	}
end

-- The dictionary is structured like:
-- default_spawn_points[surface][force] -> position
-- spawn_points[surface][force] -> {animation, light}entity of shelter 

-- Called when the game is created
local function shelterVariablesInitializing()
	global.default_spawn_points = {}
	global.spawn_points         = {}
	
	if game.surfaces[1] then
		global.default_spawn_points[1] = {}
		global.spawn_points[1]         = {}
		for _, player in pairs(game.players) do
			if not global.default_spawn_points[1][player.force.index] then
				global.default_spawn_points[1][player.force.index] = player.force.get_spawn_position(1)
			end
		end
	end
end

-- @surface_index, index of the new surface
local function saveStartPoint(surface_index)
	global.default_spawn_points[surface_index] = {}
	global.spawn_points[surface_index]         = {}
	
	for _, player in pairs(game.players) do
		if not global.default_spawn_points[surface_index][player.force.index] then
			global.default_spawn_points[surface_index][player.force.index] = player.force.get_spawn_position(surface_index)
		end
	end
end

-- @event, on_built_entity or on_robot_built_entity
local function onBuiltAnEntity(event)
	local entity = event.created_entity
	if entity.valid and entity.name == shelter_name then
		local surface = entity.surface.index
		local force   = entity.force.index
	
		if global.spawn_points[surface] then
			if not global.spawn_points[surface][force] then -- the first on the surface
				entity.force.set_spawn_position({entity.position.x, entity.position.y + 3}, surface)
				-- create shelter light
				local container = entity.surface.create_entity
				{
					type     = "container",
					name     = "kr-shelter-container",
					force    = entity.force,
					player   = entity.last_user,
					position = entity.position,
					create_build_effect_smoke = false
				}
				local light = entity.surface.create_entity
				{
					type     = "lamp",
					name     = "kr-shelter-light",
					force    = entity.force,
					player   = entity.last_user,
					position = entity.position,
					create_build_effect_smoke = false
				}
				global.spawn_points[surface][force] = {entity, container, light}
			else -- exist another shelter 
				for _, product in pairs(entity.prototype.mineable_properties.products) do
					entity.last_user.insert{name=product.name or product[1], count=product.amount or product[2]}
				end				
				showOnSurfaceText
				{
					entity = entity,
					text   = {"other.kr-shelter-error"},
					color  = {1, 0, 0}
				}
				entity.destroy()
			end
		end
	end
end

-- @event, on_player_mined_entity or on_robot_mined_entity or on_entity_died
local function onRemovingAnEntity(event)
	local entity = event.entity
	
	if entity.valid and entity.name == shelter_name or entity.name == "kr-shelter-container" or entity.name == "kr-shelter-light" then
		local surface = entity.surface.index
		local force   = entity.force.index
	
		if global.spawn_points[surface] then
			if global.spawn_points[surface][force] then
				-- reset spawn point
				global.spawn_points[surface][force] = nil
				if global.default_spawn_points[surface][force] then
					entity.force.set_spawn_position(global.default_spawn_points[surface][force], surface)
				else
					entity.force.set_spawn_position({0, 0}, surface)
				end
				-- Remove entities
				for _, entity in pairs(global.spawn_points[surface][force]) do 
					if entity.valid then
						entity.destroy()
					end
				end
			end
		end
	end	
end

return
{ 
	-- -- Bootstrap
	-- For setup variables
	{ shelterVariablesInitializing, "on_init" },
	-- -- Actions		
	{ saveStartPoint, "on_surface_created" }, 
	{ onBuiltAnEntity, "on_built_entity", KRASTORIO_SHELTER_EVENT_FILTER },
	{ onBuiltAnEntity, "on_robot_built_entity", KRASTORIO_SHELTER_EVENT_FILTER },
	{ onRemovingAnEntity, "on_player_mined_entity" },
	{ onRemovingAnEntity, "on_robot_mined_entity" },
	{ onRemovingAnEntity, "on_entity_died", KRASTORIO_SHELTER_EVENT_FILTER }
}
