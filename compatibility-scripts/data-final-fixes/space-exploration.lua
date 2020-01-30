local data_util = require("__space-exploration__/data_util")

if mods["space-exploration"] then

-- -- Entities
---------------------------------------------------------------------------------------------

	-- Adding new space loader if krastorio 2 loaders are enabled
	if krastorio.general.getSafeSettingValue("kr-loaders") then
		-- MISSING!!!!!!!!!!!!
	end

	-- SPACE COLLISIONS
	-- Adding space collisions (Disabling some Krastorio 2 entities in space)
	-- This is a BLACKLIST, all entities in this table CAN'T(NOT) be placed in the space
	local krastorio_entities_to_add =
	{	
		["assembling-machine"] =
		{
			"kr-advanced-furnace",			
			"kr-electrolysis-plant",
			"kr-filtration-plant",				
			"kr-air-filter",
			"kr-fuel-refinery"
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
	
	-- Removing space collision (Enable some Krastorio 2 entities in space)
	-- This is a WHITELIST, all entities in this table CAN(POSITIVE) BE placed in the space
	local krastorio_entities_to_remove =
	{
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
			"biusart-lab",
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
		}
	}
	
	for category_name, entities in pairs(krastorio_entities_to_remove) do
		for _, entity_name in pairs(entities) do
			krastorio.entities.removeCollisionMaskOnEntity(category_name, entity_name, space_collision_layer)
		end
	end

	-- Adding to Krastorio fuel refinery the SE fuel refinery crafting category
	krastorio.entities.addCraftingCategory("assembling-machine", "kr-fuel-refinery", "fuel-refining")

-- -- Equipments
---------------------------------------------------------------------------------------------	

	-- Armors grid
	data.raw.armor["se-thruster-suit"].equipment_grid   = "medium-equipment-grid"
	data.raw.armor["se-thruster-suit-2"].equipment_grid = "large-equipment-grid"
	data.raw.armor["se-thruster-suit-3"].equipment_grid = "mk3-armor-grid"
	data.raw.armor["se-thruster-suit-4"].equipment_grid = "mk4-armor-grid"
	
		-- -- Shields
	-- Energy shield mk1
	data.raw.technology["energy-shield-equipment"].prerequisites = {"modular-armor", "military-science-pack"}
	data.raw.technology["energy-shield-equipment"].unit.count = 150
	data.raw.technology["energy-shield-equipment"].unit.ingredients =
	{
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"military-science-pack", 1}
	}
	
	krastorio.recipes.overrideIngredients("energy-shield-equipment", 
	{
		{"battery" , 2},
		{"advanced-circuit" , 5},
		{"steel-plate" , 10}
	})
	
	-- Energy shield mk2
	krastorio.technologies.removePrerequisite("energy-shield-mk2-equipment", "se-material-science-pack")
	krastorio.recipes.removeIngredientWithPrerequisite("energy-shield-mk2-equipment", "se-subatomic-data")
	krastorio.recipes.removeIngredientWithPrerequisite("energy-shield-mk2-equipment", "se-plasma-thermodynamics-data")
	
	-- Energy shield mk3	
	krastorio.recipes.removeIngredientWithPrerequisite("energy-shield-mk3-equipment", "se-forcefield-data")
		
	-- Energy shield mk4
	krastorio.recipes.removeIngredientWithPrerequisite("energy-shield-mk4-equipment", "se-superconductive-cable")
	
	-- Re-graphics update
	local objects_to_modify =
	{
		["energy-shield-equipment"] = 
		{
			["energy-shield-equipment"]     = {"energy-shield-mk1-equipment.png", 32, 64, 64},
			["energy-shield-mk2-equipment"] = {"energy-shield-mk2-equipment.png", 32, 64, 64},
			["energy-shield-mk3-equipment"] = {"energy-shield-mk3-equipment.png", 32, 64, 64},
			["energy-shield-mk4-equipment"] = {"energy-shield-mk4-equipment.png", 32, 64, 64}
		}
	}
	
	-- iterating...
	updateVanillaEquipmentGraphics(objects_to_modify, kr_universal_equipments_icons_path, kr_universal_equipments_path)

	-- Energy shield mk5
	data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].categories = {"armor"}
	data.raw.item["energy-shield-mk5-equipment"].subgroup   = "character-equipment"
	data.raw.item["energy-shield-mk5-equipment"].order      = "s[energy-shield]-s5[energy-shield]"
	
	-- Energy shield mk6
	data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].categories = {"armor"}
	data.raw.item["energy-shield-mk6-equipment"].subgroup   = "character-equipment"
	data.raw.item["energy-shield-mk6-equipment"].order      = "s[energy-shield]-s6[energy-shield]"
	
	-- Adaptive armors (only order changing)
	data.raw.item["se-adaptive-armour-equipment-1"].subgroup  = "character-equipment"
	data.raw.item["se-adaptive-armour-equipment-1"].order     = "s[energy-shield]-a1[adaptive-armour]"
	data.raw.item["se-adaptive-armour-equipment-2"].subgroup  = "character-equipment"
	data.raw.item["se-adaptive-armour-equipment-2"].order     = "s[energy-shield]-a2[adaptive-armour]"
	data.raw.item["se-adaptive-armour-equipment-3"].subgroup  = "character-equipment"
	data.raw.item["se-adaptive-armour-equipment-3"].order     = "s[energy-shield]-a3[adaptive-armour]"
	data.raw.item["se-adaptive-armour-equipment-4"].subgroup  = "character-equipment"
	data.raw.item["se-adaptive-armour-equipment-4"].order     = "s[energy-shield]-a4[adaptive-armour]"
	data.raw.item["se-adaptive-armour-equipment-5"].subgroup  = "character-equipment"
	data.raw.item["se-adaptive-armour-equipment-5"].order     = "s[energy-shield]-a5[adaptive-armour]"

	-- -- Portable fusion core
	-- Portable RTG
	data.raw.item["se-rtg-equipment"].subgroup  = "equipment"
	data.raw.item["se-rtg-equipment"].order     = "a2[energy-source]-a41[portable-nuclear-core]"
	data.raw["generator-equipment"]["se-rtg-equipment"].power = "800kW"
	
	-- Portable RTG 2
	data.raw.item["se-rtg-equipment-2"].subgroup  = "equipment"
	data.raw.item["se-rtg-equipment-2"].order     = "a2[energy-source]-a42[portable-nuclear-core]"	
	data.raw["generator-equipment"]["se-rtg-equipment-2"].power = "1200kW"

-- -- Technologies
---------------------------------------------------------------------------------------------

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

	-- Removing tecs
	data.raw.technology["se-antimatter-reactor"] = nil
	--krastorio.technologies.convertPrerequisiteFromAllTechnologies("se-antimatter-reactor", "kr-antimatter-reactor", true)
	
	data.raw.technology["se-fuel-refining"] = nil
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("se-fuel-refining", "kr-fuel", true)
	krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-petroleum-gas")
	krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-light-oil")
	krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-heavy-oil")

	-- Final fix for all SE techs
	require("__Krastorio2__/compatibility-scripts/data-final-fixes/space-exploration/technology")
	
	--[[
	local function startsWith(str, start)
	   return str:sub(1, #start) == start
	end
	
	local se_tech_recovery_blacklist =
	{
		["se-electric-boiler"] = true,
		["se-adaptive-armour-1"] = true,
		["se-adaptive-armour-2"] = true,
		["se-core-miner"] = true,
		["se-meteor-point-defence"] = true,
		["se-meteor-defence"] = true,
		["se-medpack"] = true,
		["se-medpack-2"] = true,
		["se-rocket-fuel-from-water"] = true,
		["se-rocket-landing-pad"] = true,
		["se-rocket-launch-pad"] = true,
		["se-rocket-cargo-safety-1"] = true,
		["se-rocket-reusability-1"] = true,
		["se-rocket-survivability-1"] = true,
		["se-rtg-equipment"] = true,
		["se-space-lifesupport-facility"] = true,
		["se-space-platform-scaffold"] = true,
		["se-space-science-lab"] = true,
		["se-thruster-suit"] = true,
		["se-heat-shielding"] = true
	}
	
	for technology_name, _ in pairs(data.raw.technology) do
		if startsWith(technology_name, "se-") and not se_tech_recovery_blacklist[technology_name] then
			-- Addings
			krastorio.technologies.addResearchUnitIngredient(technology_name, "production-science-pack", 1, true)
			krastorio.technologies.addResearchUnitIngredient(technology_name, "utility-science-pack", 1, true)
			krastorio.technologies.addResearchUnitIngredient(technology_name, "matter-tech-card", 1, true)
			krastorio.technologies.addResearchUnitIngredient(technology_name, "space-science-pack", 1, true)		
			-- Removing
			krastorio.technologies.removeResearchUnitIngredient(technology_name, "basic-tech-card")
		end
	end	
	--]]
-- -- Items
---------------------------------------------------------------------------------------------

	if data.raw.item["se-antimatter-canister"] then
		data.raw.item["se-antimatter-canister"].fuel_category = "antimatter-fuel"
	end
	
	if data.raw.recipe["sand-from-stone"] then
		data.raw.recipe["sand-from-stone"] = nil
		data.raw.technology["sand-processing"] = nil
		krastorio.technologies.convertPrerequisiteFromAllTechnologies("sand-processing", "kr-stone-processing")		
		krastorio.technologies.removeUnlockRecipeFromAllTechnologies("sand-from-stone")
		krastorio.modules.removeProductivityLimitation("sand-from-stone")
	end

	if data.raw.recipe["glass-from-sand"] then
		data.raw.recipe["glass-from-sand"] = nil
		data.raw.technology["glass-processing"] = nil
		krastorio.technologies.convertPrerequisiteFromAllTechnologies("glass-processing", "kr-stone-processing")
		krastorio.technologies.removeUnlockRecipeFromAllTechnologies("glass-from-sand")
		krastorio.modules.removeProductivityLimitation("glass-from-sand")
	end
	
-- -- Icons
---------------------------------------------------------------------------------------------	
	if data.raw.recipe["se-rocket-fuel-from-water-copper"] then
		data.raw.recipe["se-rocket-fuel-from-water-copper"].icons = data_util.transition_icons(
			"__base__/graphics/icons/fluid/water.png",
			"__base__/graphics/icons/rocket-fuel.png"
		)
		-- Brutal fix
		-- data.raw.recipe["se-rocket-fuel-from-water-copper"].icon  = kr_icons_path .. "nn-icons/rocket-fuel.png"
		-- data.raw.recipe["se-rocket-fuel-from-water-copper"].icon_size = 64
	end
---------------------------------------------------------------------------------------------

end