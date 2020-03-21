random_generator = nil
crash_site_enabled = true
local start_items =
{
	"iron-plate",
	"copper-cable",
	"iron-gear-wheel",
	"electronic-circuit",
	"wood",
}
local entities_to_place =
{
	"kr-crash-site-lab-repaired",
	"kr-mineable-wreckage",
	"kr-crash-site-assembling-machine-1-repaired",
	"kr-mineable-wreckage",
	"kr-crash-site-assembling-machine-2-repaired",
	"kr-mineable-wreckage",
	"kr-crash-site-generator",
	"kr-mineable-wreckage",
	"kr-crash-site-chest-1",
	"kr-crash-site-chest-1",
	"kr-crash-site-chest-1",
	"kr-mineable-wreckage",
	"kr-crash-site-chest-2",
	"kr-crash-site-assembling-machine-1-repaired",
	"kr-crash-site-chest-2",
	"kr-crash-site-chest-2",
	"kr-mineable-wreckage",
	--"kr-big-ship-wreck-1",
	"kr-mineable-wreckage",
	"kr-big-ship-wreck-2",
	"kr-crash-site-assembling-machine-2-repaired",
	"kr-mineable-wreckage",
	"kr-big-ship-wreck-3",
	"kr-mineable-wreckage"
}

if not remote.interfaces["kr-crash-site"] then
	remote.add_interface("kr-crash-site",
	{
		crash_site_enabled = 
		function(bool)
			if type(bool) ~= "boolean" then 
				error("Value for 'set_crash_site' must be a boolean.")
			end
			crash_site_enabled = bool
		end,
		add_crash_site_item = 
		function(item_name)
			if type(bool) ~= "string" then 
				error("Value for 'add_crash_site_item' must be a string.")
			end
			table.insert(start_items, item_name)
		end,
		add_crash_site_entity = 
		function(entity_name)
			if type(bool) ~= "string" then 
				error("Value for 'add_crash_site_entity' must be a string.")
			end
			table.insert(entities_to_place, entity_name)
		end
	})
end

local function randomizePosition(start_position, range)
	if not random_generator or not random_generator.valid then
		random_generator = game.create_random_generator()
		math.randomseed(random_generator())
	end	
	
	local x_modifier = (math.random(-1, 1)) * math.random(1, range)
	local y_modifier = (math.random(-1, 1)) * math.random(1, range)
	
	return {x = start_position.x - x_modifier, y = start_position.y - y_modifier}
end

local function createCrashSite()
	if not crash_site_enabled then
		return false
	end

	local surface = game.surfaces[1]
	local player_force = game.forces[1]
	local start_position = player_force.get_spawn_position(1)
	local to_place_position = nil
	local created_entity = nil
	local insert_one_shelter = false
	local item_name, item_count = nil, nil
	local try_count = 0
	
	for _, entity_name in pairs(entities_to_place) do
		try_count = 1
		while try_count < 1000 do
			to_place_position = randomizePosition(start_position, 25)
			to_place_position = surface.find_non_colliding_position(entity_name, to_place_position, 30, 3)
			if to_place_position then
				created_entity = surface.create_entity(
				{
					name = entity_name,
					position = to_place_position,
					force = player_force,
					create_build_effect_smoke = false
				})
				if created_entity.type == "container" then
					if not random_generator or not random_generator.valid then
						random_generator = game.create_random_generator()
					end
					item_name = start_items[math.random(1, 5)]
					item_name_2 = start_items[math.random(1, 5)]
					item_name_3 = start_items[math.random(1, 5)]
					item_count = math.random(1, 50)
					item_count_2 = math.random(1, 50)
					item_count_3 = math.random(1, 50)
					
					created_entity.get_inventory(defines.inventory.chest).insert({name = item_name, count = item_count})
					created_entity.get_inventory(defines.inventory.chest).insert({name = item_name_2, count = item_count_2})
					created_entity.get_inventory(defines.inventory.chest).insert({name = item_name_3, count = item_count_3})
					
					if not insert_one_shelter then
						created_entity.get_inventory(defines.inventory.chest).insert({name = "kr-shelter", count = 1})
						created_entity.get_inventory(defines.inventory.chest).insert({name = "wood", count = 100})
						insert_one_shelter = true
					end
				end
				break
			else 
				try_count = try_count + 1
			end		
		end
		if try_count >= 1000 then
			return nil
		end
	end
end

-- With control-callbacks-merger
return
{
	-- -- Bootstrap
	{ createCrashSite, "on_init" }    
}