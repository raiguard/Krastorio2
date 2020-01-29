if mods["space-exploration"] then

-- -- Entities
---------------------------------------------------------------------------------------------

	-- Adding new space loader if krastorio 2 loaders are enabled
	if krastorio.general.getSafeSettingValue("kr-loaders") then
		-- MISSING!!!!!!!!!!!!
	end

	-- SPACE COLLISIONS
	-- Adding space collisions
	-- This is a BLACKLIST, all entities in this table CAN'T(NOT) be placed in the space
	local krastorio_entities_to_add =
	{	
		["assembling-machine"] =
		{
			"kr-advanced-furnace",			
			"kr-electrolysis-plant",
			"kr-filtration-plant",				
			"kr-air-filter"
		},
		["generator"] =
		{
			"kr-advanced-steam-turbine"
		},
		["furnace"] =
		{
			"kr-crusher",
			"kr-air-purifier"
		},		
		["transport-belt"] =
		{
			"kr-advanced-transport-belt",
			"kr-advanced-splitter",
			"kr-advanced-underground-belt",
			"kr-superior-transport-belt",
			"kr-superior-splitter",
			"kr-superior-underground-belt"
		},
		["loader-1x1"] =
		{
			"kr-loader",
			"kr-fast-loader",
			"kr-express-loader",
			"kr-advanced-loader",
			"kr-superior-loader"
		},
		["mining-drill"] =
		{
			"kr-water-pumpjack"
		},
		["electric-energy-interface"] =
		{
			"kr-wind-turbine"
		}
	}
	
	for category_name, entities in pairs(krastorio_entities_to_add) do
		for _, entity_name in pairs(entities) do
			krastorio.entities.addCollisionMaskOnEntity(category_name, entity_name, space_collision_layer)
		end
	end
	
	-- Removing space collision
	-- This is a WHITELIST, all entities in this table CAN(POSITIVE) BE placed in the space
	local krastorio_entities_to_remove =
	{
		-- MISSING!!!!!!!!!!!!
		["mining-drill"] =
		{
			"kr-quarry-drill"
		}
	}
	
	for category_name, entities in pairs(krastorio_entities_to_remove) do
		for _, entity_name in pairs(entities) do
			krastorio.entities.removeCollisionMaskOnEntity(category_name, entity_name, space_collision_layer)
		end
	end
	

-- -- Technologies
---------------------------------------------------------------------------------------------
	-- Changing icons to Krastorio 2
	-- -- Science packs
	-- Automation science pack
	krastorio.icons.setItemIcon("automation-science-pack",          kr_cards_icons_path .. "automation-tech-card.png")	
	data.raw.tool["automation-science-pack"].order = "b02[automation-tech-card]"
	krastorio.icons.setTechnologyIcon("automation-science-pack", kr_technologies_icons_path .. "automation-tech-card.png")

	-- Logistic science pack
	krastorio.icons.setItemIcon("logistic-science-pack",            kr_cards_icons_path .. "logistic-tech-card.png")
	data.raw.tool["logistic-science-pack"].order = "b03[logistic-tech-card]"
	krastorio.icons.setTechnologyIcon("logistic-science-pack",      kr_technologies_icons_path .. "logistic-tech-card.png")

	-- Military science pack
	krastorio.icons.setItemIcon("military-science-pack",            kr_cards_icons_path .. "military-tech-card.png")
	data.raw.tool["military-science-pack"].order = "b04[military-tech-card]"
	krastorio.icons.setTechnologyIcon("military-science-pack",      kr_technologies_icons_path .. "military-tech-card.png")

	-- Chemical science pack
	krastorio.icons.setItemIcon("chemical-science-pack",            kr_cards_icons_path .. "chemical-tech-card.png")
	data.raw.tool["chemical-science-pack"].order = "b05[chemical-tech-card]"
	krastorio.icons.setTechnologyIcon("chemical-science-pack",      kr_technologies_icons_path .. "chemical-tech-card.png")

	-- Production science pack
	krastorio.icons.setItemIcon("production-science-pack",          kr_cards_icons_path .. "production-tech-card.png")
	data.raw.tool["production-science-pack"].order = "b06[production-tech-card]"
	krastorio.icons.setTechnologyIcon("production-science-pack",    kr_technologies_icons_path .. "production-tech-card.png")

	-- Utility science pack
	krastorio.icons.setItemIcon("utility-science-pack",             kr_cards_icons_path .. "utility-tech-card.png")
	data.raw.tool["utility-science-pack"].order = "b07[utility-tech-card]"
	krastorio.icons.setTechnologyIcon("utility-science-pack",       kr_technologies_icons_path .. "utility-tech-card.png")

	-- Space science pack
	krastorio.icons.setItemIcon("space-science-pack",               kr_cards_icons_path .. "optimization-tech-card.png")
	data.raw.tool["space-science-pack"].order = "b09[optimization-tech-card]"
	krastorio.icons.setTechnologyIcon("space-science-pack",         kr_technologies_icons_path .. "optimization-tech-card.png")
	
	
	-- --  Modules
	-- Return to Krastorio 2/Vanilla modules on the first 3 tiers
	
	-- Speed modules
	krastorio.technologies.removeResearchUnitIngredient("speed-module-2", "production-science-pack", 1)
	
	krastorio.technologies.removeResearchUnitIngredient("speed-module-3", "space-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("speed-module-3", "se-material-science-pack")
	
	-- Productivity modules
	krastorio.technologies.removeResearchUnitIngredient("productivity-module-2", "production-science-pack", 1)
	
	krastorio.technologies.removeResearchUnitIngredient("productivity-module-3", "space-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("productivity-module-3", "se-material-science-pack")
	
	-- Efficiency modules
	krastorio.technologies.removeResearchUnitIngredient("effectivity-module-2", "production-science-pack", 1)
	
	krastorio.technologies.removeResearchUnitIngredient("effectivity-module-3", "space-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("effectivity-module-3", "se-biological-science-pack")
---------------------------------------------------------------------------------------------

end