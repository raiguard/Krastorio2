local random_generator = nil

local function randomizePosition(start_position, range)
	if not random_generator or not random_generator.valid then
		random_generator = game.create_random_generator()
	end
	math.randomseed(random_generator())
	
	local x_modifier = (math.random(-1, 1)) * math.random(1, range)
	local y_modifier = (math.random(-1, 1)) * math.random(1, range)
	
	return {x = start_position.x - x_modifier, y = start_position.y - y_modifier}
end

local function createCrashSite()
	local start_items =
	{
		"iron-plate",
		"copper-cable",
		"iron-gear-wheel",
		"electronic-circuit"
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
		"kr-mineable-wreckage",
		"kr-crash-site-chest-2",
		"kr-mineable-wreckage",
		"kr-big-ship-wreck-1",
		"kr-mineable-wreckage",
		"kr-big-ship-wreck-2",
		"kr-mineable-wreckage",
		"kr-big-ship-wreck-3",
		"kr-mineable-wreckage"
	}
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
					math.randomseed(random_generator())
					item_name = start_items[math.random(1, 4)]
					item_count = math.random(5, 10)
					
					created_entity.get_inventory(defines.inventory.chest).insert({name = item_name, count = item_count})
					
					if not insert_one_shelter then
						created_entity.get_inventory(defines.inventory.chest).insert({name = "kr-shelter", count = 1})
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