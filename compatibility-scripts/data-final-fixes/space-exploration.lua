-- Requirements
local color = require(kr_path .. "lib/private/data-stages/colorRGB")
-- Pre-fix for all SE techs
require("__Krastorio2__/compatibility-scripts/data-final-fixes/space-exploration/technology")

if mods["space-exploration"] then
	-- local data_util = require("__space-exploration__/data_util")
	local kr_se_graphic_path = kr_graphic_mod_path .. "compatibility/space-exploration/"

-- -- Technologies
---------------------------------------------------------------------------------------------
	-- -- Removing SE technologies
	
	-- Antimatter reactor
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("se-antimatter-reactor", "kr-antimatter-reactor", true)
	data.raw.technology["se-antimatter-reactor"] = nil
	
	-- Fuels
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("se-fuel-refining", "kr-fuel", true)
	data.raw.technology["se-fuel-refining"] = nil
	krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-petroleum-gas")
	krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-light-oil")
	krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-heavy-oil")
	
	-- Radars
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("radar", "kr-radar", true)
	krastorio.technologies.addUnlockRecipe("kr-radar", "radar")
	data.raw.technology["radar"] = nil

	-- -- Shields
	-- Energy shield mk1
	data.raw.technology["energy-shield-equipment"].prerequisites = {"modular-armor", "military-science-pack"}
	data.raw.technology["energy-shield-equipment"].unit.count = 150
	krastorio.technologies.overrideResearchUnitIngredient("energy-shield-equipment",
	{
		{"basic-tech-card", 1},
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"military-science-pack", 1}
	})
	
	-- Energy shield mk2
	krastorio.technologies.overrideResearchUnitIngredient("energy-shield-mk2-equipment",
	{
		{"basic-tech-card", 1},
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"military-science-pack", 1},
		{"chemical-science-pack", 1}
	})
	krastorio.technologies.removePrerequisite("energy-shield-mk2-equipment", "se-material-science-pack")
	
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("energy-shield-mk3-equipment", "kr-energy-shield-mk3-equipment", true)
	data.raw.technology["energy-shield-mk3-equipment"] = nil
	
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("energy-shield-mk4-equipment", "kr-energy-shield-mk4-equipment", true)
	data.raw.technology["energy-shield-mk4-equipment"] = nil
	krastorio.technologies.removeResearchUnitIngredient("kr-energy-shield-mk4-equipment", "automation-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("kr-energy-shield-mk4-equipment", "logistic-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("kr-energy-shield-mk4-equipment", "chemical-science-pack")

	-------------------------------------------------------------
	-- --  Modules
	-- Return to Krastorio 2/Vanilla modules on the first 3 tiers 
	krastorio.technologies.addPrerequisite("speed-module-3", "advanced-electronics-2")
	krastorio.technologies.addPrerequisite("productivity-module-3", "advanced-electronics-2")
	krastorio.technologies.addPrerequisite("effectivity-module-3", "advanced-electronics-2")
	krastorio.technologies.removePrerequisite("speed-module-2", "advanced-electronics-2")
	krastorio.technologies.removePrerequisite("productivity-module-2", "advanced-electronics-2")
	krastorio.technologies.removePrerequisite("effectivity-module-2", "advanced-electronics-2")
	
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
	-------------------------------------------------------------
	
	-- Others
	
	-- Other research units
	krastorio.technologies.addResearchUnitIngredient("battery-mk2-equipment", "automation-science-pack")
	krastorio.technologies.addResearchUnitIngredient("battery-mk2-equipment", "logistic-science-pack")
	krastorio.technologies.addResearchUnitIngredient("battery-mk2-equipment", "chemical-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("battery-mk2-equipment", "utility-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("battery-mk2-equipment", "space-science-pack")
	
	krastorio.technologies.addResearchUnitIngredient("kr-battery-mk3-equipment", "automation-science-pack")
	krastorio.technologies.addResearchUnitIngredient("kr-battery-mk3-equipment", "logistic-science-pack")
	krastorio.technologies.addResearchUnitIngredient("kr-battery-mk3-equipment", "chemical-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("kr-battery-mk3-equipment", "space-science-pack")

	krastorio.technologies.removeResearchUnitIngredient("personal-roboport-equipment", "utility-science-pack")

	-- -- -- Repeting Krastorio science coerence sanification 
	for technology_name, technology in pairs(data.raw.technology) do
		local ingredients = technology.unit.ingredients
		if ingredients and #ingredients >1 then	
			local is_in = false
			for i = 1, #ingredients do
				local ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])					
				if ingredient_name == "production-science-pack" or ingredient_name == "utility-science-pack" then
					is_in = true
					break
				end	
			end	
			if is_in then
				for i = 1, #ingredients do
					local ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])					
					if ingredient_name == "basic-tech-card" then
						for j, prerequisite_name in pairs(technology.prerequisites) do
							for _, value in pairs(ingredients[i]) do
								if prerequisite_name == value then
									table.remove(technology.prerequisites, j)
									break
								end
							end								
						end
						table.remove(ingredients, i)
						break
					end	
				end	
			end
		end
	end
	
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

-- -- Entities
---------------------------------------------------------------------------------------------

	-- Adding new space loader if krastorio 2 loaders are enabled
	if krastorio.general.getSafeSettingValue("kr-loaders") then
		data:extend(
		{
			kr_loader_item
			{
				name = "kr-se-loader",
				icon = kr_se_graphic_path .. "kr-se-loader.png",
				icon_size = 32,
				order = "z-l[loader]-z[loader]",
				subgroup = "space-logistics"
			},
			createKrastorioLoader
			{				
				name = "kr-se-loader", 
				speed =	data.raw["transport-belt"]["se-space-transport-belt"].speed,
				belt_animation_set = data.raw["transport-belt"]["se-space-transport-belt"].belt_animation_set,
				order = "z-l[loader]-z[loader]", 
				icon = kr_se_graphic_path .. "kr-se-loader.png",
				icon_size = 32,
				tint = color.convert(240, 240, 240, 125),
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
				subgroup = "space-logistics"
			}					
		})
		krastorio.technologies.addUnlockRecipe("se-space-platform-scaffold", "kr-se-loader")
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
		["boiler"] =
		{
			"se-electric-boiler"
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
		["lab"] =
		{
			"biusart-lab"
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

	-- Adding to Krastorio fuel refinery the SE fuel refinery crafting category
	krastorio.entities.addCraftingCategory("assembling-machine", "kr-fuel-refinery", "fuel-refining")

	-- Fix laboratory
	table.insert(data.raw.lab["kr-singularity-lab"].inputs, "space-science-pack")
	
	-- Electric boiler rebalance
	if krastorio.general.getSafeSettingValue("se-electric-boiler") then
		data.raw["boiler"]["se-electric-boiler"].target_temperature = 99
	end
	
-- -- Equipments
---------------------------------------------------------------------------------------------	

	-- Armors grid
	data.raw.armor["se-thruster-suit"].equipment_grid   = "medium-equipment-grid"
	data.raw.armor["se-thruster-suit-2"].equipment_grid = "large-equipment-grid"
	data.raw.armor["se-thruster-suit-3"].equipment_grid = "mk3-armor-grid"
	data.raw.armor["se-thruster-suit-4"].equipment_grid = "mk4-armor-grid"
	
	-- -- Shields
	-- Energy shield mk1	
	krastorio.recipes.overrideIngredients("energy-shield-equipment", 
	{
		{"battery" , 2},
		{"advanced-circuit" , 5},
		{"steel-plate" , 10}
	})
	
	-- Energy shield mk2
	krastorio.recipes.removeIngredientWithPrerequisite("energy-shield-mk2-equipment", "se-subatomic-data")
	krastorio.recipes.removeIngredientWithPrerequisite("energy-shield-mk2-equipment", "se-plasma-thermodynamics-data")
	
	-- Energy shield mk3		
	krastorio.recipes.overrideIngredients("energy-shield-mk3-equipment",
	{
		{"energy-shield-mk2-equipment", 10},
		{"electronic-components", 40},
		{"lithium-sulfur-battery", 10}
	})

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
	
	-- Armor requirments
	krastorio.technologies.removeResearchUnitIngredient("power-armor", "utility-science-pack")

	-- -- Portable fusion core
	-- Portable RTG
	data.raw.item["se-rtg-equipment"].subgroup  = "equipment"
	data.raw.item["se-rtg-equipment"].order     = "a2[energy-source]-a41[portable-nuclear-core]"
	data.raw["generator-equipment"]["se-rtg-equipment"].power = "800kW"
	
	-- Portable RTG 2
	data.raw.item["se-rtg-equipment-2"].subgroup  = "equipment"
	data.raw.item["se-rtg-equipment-2"].order     = "a2[energy-source]-a42[portable-nuclear-core]"	
	data.raw["generator-equipment"]["se-rtg-equipment-2"].power = "1200kW"
	
	-- Portable fusion reactor
	krastorio.technologies.removePrerequisite("fusion-reactor-equipment", "se-deep-space-science-pack")

-- -- Items
---------------------------------------------------------------------------------------------

	-- Rocket fuel
	krastorio.recipes.addIngredient("se-rocket-fuel-from-water-copper", {type="fluid", name="oxygen", amount=50, catalyst_amount=50})
	krastorio.recipes.setEnergyCost("se-rocket-fuel-from-water-copper", 1000)
	
	data.raw.fluid["se-liquid-rocket-fuel"].fuel_value = "1000KJ"
	data.raw.fluid["se-liquid-rocket-fuel"].fuel_category = "burnable-fluid-fuel"
	data.raw.fluid["se-liquid-rocket-fuel"].fuel_emissions_multiplier = 1.5
	data.raw.fluid["se-liquid-rocket-fuel"].default_temperature = 25
	data.raw.fluid["se-liquid-rocket-fuel"].max_temperature = 100
	data.raw.fluid["se-liquid-rocket-fuel"].auto_barrel = true

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
	
	-- MODULES
	-- Speed modules

	-- Speed module 1
	krastorio.recipes.setEnergyCost("speed-module", 15)
	krastorio.recipes.overrideIngredients
	(	
		"speed-module", 
		{
			{"electronic-circuit", 5},
			{"electronic-components", 10}
		}
	)

	-- Speed module 2
	krastorio.recipes.setEnergyCost("speed-module-2", 15)
	krastorio.recipes.overrideIngredients
	(	
		"speed-module-2", 
		{
			{"advanced-circuit", 5},
			{"electronic-circuit", 5},
			{"speed-module", 5}
		}
	)

	-- Speed module 3
	krastorio.recipes.setEnergyCost("speed-module-3", 15)
	krastorio.recipes.overrideIngredients
	(	
		"speed-module-3", 
		{
			{"processing-unit", 5},
			{"advanced-circuit", 5},
			{"speed-module-2", 5}
		}
	)

	------------------------------------------------
	-- -- Productivity modules

	-- Productivity module 1	
	krastorio.recipes.setEnergyCost("productivity-module", 15)
	krastorio.recipes.overrideIngredients
	(	
		"productivity-module", 
		{
			{"electronic-circuit", 5},
			{"electronic-components", 10}
		}
	)

	-- Productivity module 2	
	krastorio.recipes.setEnergyCost("productivity-module-2", 15)
	krastorio.recipes.overrideIngredients
	(	
		"productivity-module-2", 
		{
			{"advanced-circuit", 5},
			{"electronic-circuit", 5},
			{"productivity-module", 5}
		}
	)	
		
	-- Productivity module 3	
	krastorio.recipes.setEnergyCost("productivity-module-3", 15)
	krastorio.recipes.overrideIngredients
	(	
		"productivity-module-3", 
		{
			{"processing-unit", 5},
			{"advanced-circuit", 5},
			{"productivity-module-2", 5}
		}
	)
		
	------------------------------------------------
	-- -- Effectivity modules

	-- Effectivity module 1
	krastorio.recipes.setEnergyCost("effectivity-module", 15)
	krastorio.recipes.overrideIngredients
	(	
		"effectivity-module", 
		{
			{"electronic-circuit", 5},
			{"electronic-components", 10}
		}
	)
		
	-- Effectivity module 2
	krastorio.recipes.setEnergyCost("effectivity-module-2", 15)
	krastorio.recipes.overrideIngredients
	(	
		"effectivity-module-2", 
		{
			{"advanced-circuit", 5},
			{"electronic-circuit", 5},
			{"effectivity-module", 5}
		}
	)

	-- Effectivity module 3
	krastorio.recipes.setEnergyCost("effectivity-module-3", 15)
	krastorio.recipes.overrideIngredients
	(	
		"effectivity-module-3", 
		{
			{"processing-unit", 5},
			{"advanced-circuit", 5},
			{"effectivity-module-2", 5}
		}
	)
	
	krastorio.recipes.setCategoryIfExist("rocket-fuel", "fuel-refinery")
	
		-- Space science packs
	data:extend(
	{
		-- this is much more efficient that rocket returns
		{			
			type = "recipe",
			name = "space-science-pack",
			category = "t3-tech-cards",
			enabled = false,
			energy_required = 20,
			ingredients = 
			{
				{ "se-heat-shielding", 2 },
				{ "low-density-structure", 2 },
				{ "battery", 7 },
				{ "processing-unit", 2 },
				{ "rocket-fuel", 3 }
			},
			results = {{"space-science-pack", 5}},
			main_product = "space-science-pack",
			requester_paste_multiplier = 1,
			always_show_made_in = true,
		},
		{
			type = "recipe",
			name = "space-science-pack-2",
			localised_name = {"other.krastorio-recipe-variation", {"item-name.optimization-tech-card"}},
			icons =
			{
				{
					icon = kr_cards_icons_path .. "optimization-tech-card.png",
					icon_size = 64,
					icon_mipmaps = 4
				},
				{
					icon = kr_cards_icons_path .. "space-research-data.png",
					icon_size = 64,
					scale = 0.26,
					shift = {8, -8}
				}
			},
			icon_size = 64,
			category = "t3-tech-cards",
			energy_required = 20,
			enabled = false,
			ingredients =
			{
				{"blank-tech-card", 10},
				{"space-research-data", 5}
			},
			result = "space-science-pack",
			result_count = 5
		}
	})
	krastorio.technologies.addUnlockRecipe("space-science-pack", "space-science-pack-2")
	
	-- Satellite
	data.raw.item["satellite"].rocket_launch_product = {"space-research-data", 1000}
	
	-- Core fragments
	local function scaleCoreFragmentRecipe(_recipe_name, _item_name, _multiplier)
		local cf_recipe_name = "se-core-fragment-" .. _recipe_name
		local amount = krastorio.recipes.countProduct("se-core-fragment-omni", _item_name)
		local _item_type = krastorio.items.getItemType(_item_name)
		krastorio.recipes.replaceProduct("se-core-fragment-omni", _item_name, {type=_item_type, name=_item_name, amount=amount*_multiplier})		
		krastorio.recipes.replaceProduct(cf_recipe_name, _item_name, {type=_item_type, name=_item_name, amount=amount*_multiplier})
	end
	
	local core_fragment_to_change =
	{
		["imersite"] = {"raw-imersite", 0.2},
		["rare-metals"] = {"raw-rare-metals", 0.2},
		["mineral-water"] = {"mineral-water", 0.25},
		["crude-oil"] = {"crude-oil", 0.5}
	}
	
	for item_name, multiplier in pairs(core_fragment_to_change) do
		scaleCoreFragmentRecipe(item_name, multiplier[1], multiplier[2])
	end
	
-- -- Icons
---------------------------------------------------------------------------------------------
	-- Science packs
	data.raw.tool["se-astronomic-science-pack"].localised_name={"item-name.se-astronomic-tech-card"}
	data.raw.technology["se-astronomic-science-pack"].localised_name={"item-name.se-astronomic-tech-card"}
	krastorio.icons.setItemIcon("se-astronomic-science-pack", kr_se_graphic_path .. "se-astronomic-science-pack.png")
	krastorio.icons.setTechnologyIcon("se-astronomic-science-pack", kr_se_graphic_path .. "se-astronomic-science-pack-tech.png")
	
	data.raw.tool["se-biological-science-pack"].localised_name={"item-name.se-biological-tech-card"}
	data.raw.technology["se-biological-science-pack"].localised_name={"item-name.se-biological-tech-card"}
	krastorio.icons.setItemIcon("se-biological-science-pack", kr_se_graphic_path .. "se-biological-science-pack.png")
	krastorio.icons.setTechnologyIcon("se-biological-science-pack", kr_se_graphic_path .. "se-biological-science-pack-tech.png")
	
	data.raw.tool["se-deep-space-science-pack"].localised_name={"item-name.se-deep-space-tech-card"}
	data.raw.technology["se-deep-space-science-pack"].localised_name={"item-name.se-deep-space-tech-card"}
	krastorio.icons.setItemIcon("se-deep-space-science-pack", kr_se_graphic_path .. "se-deep-space-science-pack.png")
	data.raw.recipe["se-deep-space-science-pack"].main_product = "se-deep-space-science-pack"
	krastorio.icons.setRecipeIcon("se-deep-space-science-pack", kr_se_graphic_path .. "se-deep-space-science-pack.png")
	krastorio.icons.setTechnologyIcon("se-deep-space-science-pack", kr_se_graphic_path .. "se-deep-space-science-pack-tech.png")
	
	data.raw.tool["se-energy-science-pack"].localised_name={"item-name.se-energy-tech-card"}
	data.raw.technology["se-energy-science-pack"].localised_name={"item-name.se-energy-tech-card"}
	krastorio.icons.setItemIcon("se-energy-science-pack", kr_se_graphic_path .. "se-energy-science-pack.png")
	krastorio.icons.setTechnologyIcon("se-energy-science-pack", kr_se_graphic_path .. "se-energy-science-pack-tech.png")
	
	data.raw.tool["se-material-science-pack"].localised_name={"item-name.se-material-tech-card"}
	data.raw.technology["se-material-science-pack"].localised_name={"item-name.se-material-tech-card"}
	krastorio.icons.setItemIcon("se-material-science-pack", kr_se_graphic_path .. "se-material-science-pack.png")
	krastorio.icons.setTechnologyIcon("se-material-science-pack", kr_se_graphic_path .. "se-material-science-pack-tech.png")
---------------------------------------------------------------------------------------------

end