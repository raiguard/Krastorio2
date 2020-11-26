require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

local KRASTORIO_SHELTER_EVENT_FILTER =
{
	-- shelter entity name
	{
		filter = "name", 
        name   = "kr-shelter"
    },
	{
		filter = "name", 
        name   = "kr-shelter-container"
    },
	{
		filter = "name", 
        name   = "kr-shelter-light"
    },
	{
		filter = "name", 
        name   = "kr-shelter-plus"
    },
	{
		filter = "name", 
        name   = "kr-shelter-plus-container"
    },
	{
		filter = "name", 
        name   = "kr-shelter-plus-light"
    }
}

local function onInitAndConf()
	if not global.krastorio.script_initialization_status["shelter"] then
		shelterVariablesInitializing()
		global.krastorio.script_initialization_status["shelter"] = true
	end
end

-- The dictionary is structured like:
-- default_spawn_points[surface][force] -> position
-- spawn_points[surface][force] -> {animation, light}entity of shelter 

-- Called when the game is created
function shelterVariablesInitializing()
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
local function saveStartPoint(event)
	local surface_index = event.surface_index
	global.default_spawn_points[surface_index] = {}
	global.spawn_points[surface_index]         = {}
		
	for _, player in pairs(game.players) do		
		if not global.default_spawn_points[surface_index][player.force.index] then
			local base_spawn_point = player.force.get_spawn_position(surface_index) or {x = 0, y = 0}
			global.default_spawn_points[surface_index][player.force.index] = base_spawn_point
		end
	end
end

-- @event, on_built_entity or on_robot_built_entity
local function onBuiltAnEntity(event)
	local entity = event.created_entity or event.entity
	if entity.valid and (entity.name == "kr-shelter" or entity.name == "kr-shelter-plus") then
		local surface = entity.surface.index
		local force   = entity.force.index
	
		if global.spawn_points[surface] then
			if not global.spawn_points[surface][force] then -- the first on the surface
				entity.force.set_spawn_position({entity.position.x, entity.position.y + 3}, surface)
				if entity.name == "kr-shelter" then
					-- create shelter light
					entity.surface.create_entity
					{
						type     = "container",
						name     = "kr-shelter-container",
						force    = entity.force,
						player   = entity.last_user,
						position = entity.position,
						create_build_effect_smoke = false
					}
					--[[ (Deprecated)
					local light = entity.surface.create_entity
					{
						type     = "lamp",
						name     = "kr-shelter-light",
						force    = entity.force,
						player   = entity.last_user,
						position = entity.position,
						create_build_effect_smoke = false
					}
					--]]
					global.spawn_points[surface][force] = {entity} -- {entity, light}
				else
					-- create shelter plus light
					entity.surface.create_entity
					{
						type     = "container",
						name     = "kr-shelter-plus-container",
						force    = entity.force,
						player   = entity.last_user,
						position = entity.position,
						create_build_effect_smoke = false
					}
					--[[ (Deprecated)
					local light = entity.surface.create_entity
					{
						type     = "lamp",
						name     = "kr-shelter-plus-light",
						force    = entity.force,
						player   = entity.last_user,
						position = entity.position,
						create_build_effect_smoke = false
					}
					--]]
					global.spawn_points[surface][force] = {entity}-- {entity, light}
				end
			else -- exist another shelter 
				for _, product in pairs(entity.prototype.mineable_properties.products) do
					entity.last_user.insert{name=product.name or product[1], count=product.amount or product[2]}
				end				
				krastorio.flying_texts.showOnSurfaceText
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
	
	if entity.valid and (entity.name == "kr-shelter" or entity.name == "kr-shelter-container" or entity.name == "kr-shelter-light" or entity.name == "kr-shelter-plus" or entity.name == "kr-shelter-plus-container" or entity.name == "kr-shelter-plus-light") then
		local surface = entity.surface.index
		local force   = entity.force.index
	
		if global.spawn_points[surface] then
			if global.spawn_points[surface][force] then
				-- reset spawn point				
				if global.default_spawn_points[surface][force] then
					entity.force.set_spawn_position(global.default_spawn_points[surface][force], surface)
				else
					entity.force.set_spawn_position({0, 0}, surface)
				end
				-- Remove entities (for compatibility)
				for _, entity in pairs(global.spawn_points[surface][force]) do 
					if entity and entity.valid then
						entity.destroy()
					end
				end
				-- Remove entities record
				global.spawn_points[surface][force] = nil
			end
		end
	end	
end

return
{ 
	-- -- Bootstrap
	-- For setup variables
	{ onInitAndConf, "on_init" },
	{ onInitAndConf, "on_configuration_changed" },
	-- -- Actions		
	{ saveStartPoint, "on_surface_created" }, 
	{ onBuiltAnEntity, "on_built_entity", KRASTORIO_SHELTER_EVENT_FILTER },
	{ onBuiltAnEntity, "on_robot_built_entity", KRASTORIO_SHELTER_EVENT_FILTER },
	{ onBuiltAnEntity, "script_raised_built" },
	{ onBuiltAnEntity, "script_raised_revive" },		
	{ onRemovingAnEntity, "on_player_mined_entity", KRASTORIO_SHELTER_EVENT_FILTER },
	{ onRemovingAnEntity, "on_robot_mined_entity", KRASTORIO_SHELTER_EVENT_FILTER },
	{ onRemovingAnEntity, "on_entity_died", KRASTORIO_SHELTER_EVENT_FILTER }
}
