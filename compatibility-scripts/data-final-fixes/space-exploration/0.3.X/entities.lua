local kr_color_lib = require(kr_path .. "lib/private/data-stages/colorRGB")

if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
	-- Chaning the name of the antimatter reactor for not be the same of the antimatter reactor of SE
	data.raw["burner-generator"]["kr-antimatter-reactor"].localised_name = {"entity-name.kr-singularity-reactor"}
	
	-- Remove the SE fuel refiny to not be redundant
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("se-fuel-refining", "kr-fuel", true)
	data.raw.technology["se-fuel-refining"] = nil
	krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-petroleum-gas")
	krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-light-oil")
	krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-heavy-oil")
	-- Adding to Krastorio fuel refinery the SE fuel refinery crafting category
	krastorio.entities.addCraftingCategory("assembling-machine", "kr-fuel-refinery", "fuel-refining")
	
	-- Fix double radars techs
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("radar", "kr-radar", true)
	krastorio.technologies.addUnlockRecipe("kr-radar", "radar")
	data.raw.technology["radar"] = nil
	
	-- Fix laboratory science packs
	if data.raw.lab["kr-singularity-lab"] then
		table.insert(data.raw.lab["kr-singularity-lab"].inputs, "space-science-pack")
		table.insert(data.raw.lab["kr-singularity-lab"].inputs, "se-deep-space-science-pack")
	end
	
	-- Rebalance the electric boiler to not create infinite energy
	if krastorio.general.getSafeSettingValue("se-electric-boiler") then
		data.raw["boiler"]["se-electric-boiler"].target_temperature = 99
	end
	
	-- Adding new space loader if krastorio 2 loaders are enabled
	if krastorio.general.getSafeSettingValue("kr-loaders") then
		local kr_se_graphic_path = kr_graphic_mod_path .. "compatibility/space-exploration/"
		data:extend(
		{
			kr_loader_item
			{
				name = "kr-se-loader",
				icon = kr_se_graphic_path .. "kr-se-loader.png",
				icon_size = 32,
				order = "d[loader]-a5[se-loader]",
				subgroup = "belt"
			},
			createKrastorioLoader
			{				
				name = "kr-se-loader", 
				speed =	data.raw["transport-belt"]["se-space-transport-belt"].speed,
				belt_animation_set = data.raw["transport-belt"]["se-space-transport-belt"].belt_animation_set,
				order = "z-l[loader]-z[loader]", 
				icon = kr_se_graphic_path .. "kr-se-loader.png",
				icon_size = 32,
				tint = kr_color_lib.convert(240, 240, 240, 125),
				apply_rust = false
			},	
			kr_loader_recipe
			{
				name = "kr-se-loader",
				ingredients = 
				{
					{"kr-express-loader", 1},
					{"rare-metals", 10}
				},
				subgroup = "belt"
			}					
		})
		krastorio.technologies.addUnlockRecipe("se-space-platform-scaffold", "kr-se-loader")
	end
	
	-- SPACE COLLISIONS
	-- After SE have done his magic, because SE don't iterate all entity types,
	-- to be sure that all entities have the right collision layer,
	-- we will manually removing space collision (Enabling some Krastorio 2 entities in space),
	-- for all entities that should be placable in the space, so;
	-- all entities in this WHITELIST table CAN(POSITIVE) and should BE placed in the space.
	local krastorio_entities_to_remove =
	{
		["assembling-machine"] =
		{
			"kr-fuel-refinery"
		},
		["beacon"] =
		{
			"kr-singularity-beacon"
		},
		-- normal containers
		["container"] =
		{
			-- medium storehouse
			"kr-medium-container",
			-- big warehouse	
			"kr-big-container"
		},
		["logistic-container"] =
		{
			-- logistic medium storehouses
			"kr-medium-active-provider-container",
			"kr-medium-buffer-container",
			"kr-medium-passive-provider-container",
			"kr-medium-requester-container",
			"kr-medium-storage-container",
			-- logistic big warehouses
			"kr-big-active-provider-container",
			"kr-big-buffer-container",
			"kr-big-passive-provider-container",
			"kr-big-requester-container",
			"kr-big-storage-container"
		},
		["generator"] =
		{
			"kr-antimatter-reactor"
		},
		["lab"] =
		{
			"kr-singularity-lab"
		},	
		["mining-drill"] =
		{
			"kr-quarry-drill"
		},	
		["storage-tank"] =
		{
			"fluid-storage-1",
			"fluid-storage-2"
		},
		["radar"] =
		{
			"kr-sentinel"
		},
		["solar-panel"] =
		{
			"kr-advanced-solar-panel"
		},
		["accumulator"] =
		{
			"kr-energy-storage",
			"kr-intergalactic-transceiver"
		},
		["inserter"] =
		{
			"kr-superior-inserter",
			"kr-superior-long-inserter",
			"kr-superior-filter-inserter",
			"kr-superior-long-filter-inserter"
		}
	}
	
	for category_name, entities in pairs(krastorio_entities_to_remove) do
		for _, entity_name in pairs(entities) do
			krastorio.entities.removeCollisionMaskOnEntity(category_name, entity_name, space_collision_layer)
		end
	end
end