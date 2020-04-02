-- -- -- Modifications to vanilla technologies

--------------------------------------------------------------------
-- -- Prerequisites
--------------------------------------------------------------------

-- Addings
krastorio.technologies.addPrerequisite("steel-axe", "kr-iron-pickaxe")
krastorio.technologies.addPrerequisite("automation", "kr-automation-core")
krastorio.technologies.addPrerequisite("automation", "automation-science-pack")
krastorio.technologies.addPrerequisite("logistics", "automation-science-pack")
krastorio.technologies.addPrerequisite("stone-walls", "military")
krastorio.technologies.addPrerequisite("turrets", "automation-science-pack")
krastorio.technologies.addPrerequisite("fast-inserter", "electronics")
krastorio.technologies.addPrerequisite("heavy-armor", "light-armor")
krastorio.technologies.addPrerequisite("optics", "kr-stone-processing")
krastorio.technologies.addPrerequisite("logistics-2", "steel-processing")
krastorio.technologies.addPrerequisite("nuclear-power", "kr-steam-engine")
krastorio.technologies.addPrerequisite("oil-processing", "kr-fluids-chemistry")
krastorio.technologies.addPrerequisite("fluid-handling", "kr-basic-fluid-handling")
krastorio.technologies.addPrerequisite("advanced-electronics", "electronics")
krastorio.technologies.addPrerequisite("advanced-electronics", "kr-silicon-processing")
krastorio.technologies.addPrerequisite("battery-equipment", "modular-armor")
krastorio.technologies.addPrerequisite("fusion-reactor-equipment", "kr-fusion-energy")
krastorio.technologies.addPrerequisite("automobilism", "kr-fuel")
krastorio.technologies.addPrerequisite("tanks", "kr-fuel")
krastorio.technologies.addPrerequisite("fast-inserter", "steel-processing")
krastorio.technologies.addPrerequisite("modular-armor", "military-2")

-- Science
krastorio.technologies.addPrerequisite("military-science-pack", "advanced-electronics")
krastorio.technologies.addPrerequisite("logistic-science-pack", "automation-science-pack")
krastorio.technologies.addPrerequisite("logistic-science-pack", "electronics")
krastorio.technologies.addPrerequisite("production-science-pack", "kr-research-server")
krastorio.technologies.addPrerequisite("production-science-pack", "kr-advanced-lab")
krastorio.technologies.addPrerequisite("production-science-pack", "uranium-processing")
krastorio.technologies.addPrerequisite("utility-science-pack", "kr-research-server")
krastorio.technologies.addPrerequisite("utility-science-pack", "rocket-fuel")
krastorio.technologies.addPrerequisite("space-science-pack", "kr-singularity-lab")

-- Modules 
krastorio.technologies.addPrerequisite("speed-module-3", "advanced-electronics-2")
krastorio.technologies.addPrerequisite("productivity-module-3", "advanced-electronics-2")
krastorio.technologies.addPrerequisite("effectivity-module-3", "advanced-electronics-2")

-- Removing
krastorio.technologies.removePrerequisite("heavy-armor", "military")
krastorio.technologies.removePrerequisite("fluid-handling", "automation-2")
krastorio.technologies.removePrerequisite("engine", "steel-processing")
krastorio.technologies.removePrerequisite("battery-equipment", "solar-panel-equipment")
krastorio.technologies.removePrerequisite("battery-mk2-equipment", "low-density-structure")
krastorio.technologies.removePrerequisite("personal-laser-defense-equipment", "low-density-structure")

-- Modules
krastorio.technologies.removePrerequisite("speed-module-2", "advanced-electronics-2")
krastorio.technologies.removePrerequisite("productivity-module-2", "advanced-electronics-2")
krastorio.technologies.removePrerequisite("effectivity-module-2", "advanced-electronics-2")

--------------------------------------------------------------------
-- -- Research unit ingredients
--------------------------------------------------------------------

-- Conversions 
krastorio.technologies.convertResearchUnitIngredient("stone-walls", "automation-science-pack", "basic-tech-card")
krastorio.technologies.convertResearchUnitIngredient("military", "automation-science-pack", "basic-tech-card")

-- Addings
krastorio.technologies.addResearchUnitIngredient("automation", "basic-tech-card")
krastorio.technologies.addResearchUnitIngredient("character-logistic-trash-slots-1", "basic-tech-card")
krastorio.technologies.addResearchUnitIngredient("auto-character-logistic-trash-slots", "basic-tech-card")

-- Removing
krastorio.technologies.removeResearchUnitIngredient("automation", "automation-science-pack")
krastorio.technologies.removeResearchUnitIngredient("fluid-handling", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("oil-processing", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("engine", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("plastics", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("fusion-reactor-equipment", "military-science-pack")

--------------------------------------------------------------------
-- -- Recipes Unlocking
--------------------------------------------------------------------

-- Addings

-- Adding coke unlocking to steel production technology and steel things
krastorio.technologies.addUnlockRecipe("steel-processing", "coke")
krastorio.technologies.addUnlockRecipe("steel-processing", "steel-gear-wheel")
krastorio.technologies.addUnlockRecipe("steel-processing", "steel-beam")

-- Moving inserters unlocking in early game
krastorio.technologies.addUnlockRecipe("logistics", "inserter")
krastorio.technologies.addUnlockRecipe("logistics", "long-handed-inserter")

-- Electronics I
krastorio.technologies.addUnlockRecipe("electronics", "electronic-circuit")
-- Electronics 2
krastorio.technologies.addUnlockRecipe("advanced-electronics", "electronic-components")

-- -- EQUIPMENTS
krastorio.technologies.addUnlockRecipe("solar-panel-equipment", "big-solar-panel-equipment")

krastorio.technologies.addUnlockRecipe("battery-equipment", "big-battery-equipment")
krastorio.technologies.addUnlockRecipe("battery-equipment", "small-portable-generator")

krastorio.technologies.addUnlockRecipe("battery-mk2-equipment", "big-battery-mk2-equipment")

krastorio.technologies.addUnlockRecipe(krastorio.technologies.getTechnologyThatUnlockRecipe("personal-roboport-equipment").name, "vehicle-roboport")
krastorio.technologies.addUnlockRecipe(krastorio.technologies.getTechnologyThatUnlockRecipe("electric-engine-unit").name, "additional-engine")

krastorio.technologies.addUnlockRecipe("personal-laser-defense-equipment", "personal-submachine-laser-defense-mk1-equipment")

-- Rocket fuel recipes
krastorio.technologies.addUnlockRecipe("rocket-fuel", "rocket-fuel-with-ammonia")
krastorio.technologies.addUnlockRecipe("rocket-fuel", "rocket-fuel-with-hydrogen-chloride")

-- Coal liquefaction
krastorio.technologies.addUnlockRecipe("coal-liquefaction", "coal-filtration")
krastorio.technologies.addUnlockRecipe("coal-liquefaction", "coke-liquefaction")

-- Science
krastorio.technologies.addUnlockRecipe("automation-science-pack", "blank-tech-card")
krastorio.technologies.addUnlockRecipe("military-science-pack", "biters-research-data")
krastorio.technologies.addUnlockRecipe("military-science-pack", "kr-creep-collector")
krastorio.technologies.addUnlockRecipe("space-science-pack", "space-science-pack")

-- Jackhammer
krastorio.technologies.addUnlockRecipe(krastorio.technologies.getTechnologyThatUnlockRecipe("concrete").name, "kr-jackhammer")

-- Removings

-- Moving inserters unlocking in early game
krastorio.technologies.removeUnlockRecipe("automation", "long-handed-inserter")
krastorio.technologies.removeUnlockRecipe("oil-processing", "chemical-plant")


krastorio.technologies.removeUnlockRecipe("kovarex-enrichment-process", "nuclear-fuel")
data.raw.technology["kovarex-enrichment-process"].unit.count = 500

krastorio.technologies.addUnlockRecipe("artillery", "nuclear-artillery-shell")

--------------------------------------------------------------------
-- Loaders
if krastorio.general.getSafeSettingValue("kr-loaders") then
	krastorio.technologies.addUnlockRecipe("logistics", "kr-loader")
	krastorio.technologies.addUnlockRecipe("logistics-2", "kr-fast-loader")
	krastorio.technologies.addUnlockRecipe("logistics-3", "kr-express-loader")
end
--------------------------------------------------------------------

-- -- END CHANGING (this lines must remain at the end of file)

-- Apply basic tech card to all technologies with automation science pack (T1 tier)
krastorio_utils.log.disableLogs()
for technology_name, technology in pairs(data.raw.technology) do
	if krastorio.technologies.hasIngredient(technology_name, "automation-science-pack") then
		krastorio.technologies.addResearchUnitIngredient(technology_name, "basic-tech-card")
	end
end
krastorio_utils.log.enableLogs()

-- Remove basic tech card to all technologies of T2 tier
for technology_name, technology in pairs(data.raw.technology) do
	if 
		krastorio.technologies.hasIngredient(technology_name, "production-science-pack") or
		krastorio.technologies.hasIngredient(technology_name, "utility-science-pack") or
		krastorio.technologies.hasIngredient(technology_name, "space-science-pack") or
		krastorio.technologies.hasIngredient(technology_name, "matter-tech-card")
	then
		krastorio.technologies.removeResearchUnitIngredient(technology_name, "basic-tech-card")
	end
end

--------------------------------------------------------------------
-- --  Stats
--------------
-- rocket

data.raw.technology["space-science-pack"].unit.count = 1000
data.raw.technology["rocket-control-unit"].unit.count = 500
	
--------------
-- science packs
	
data.raw.technology["production-science-pack"].unit.count = 250
data.raw.technology["utility-science-pack"].unit.count = 250
	
--------------
-- military

data.raw.technology["military-4"].unit.count = 350	
data.raw.technology["discharge-defense-equipment"].unit.count = 300
data.raw.technology["uranium-ammo"].unit.count = 300
data.raw.technology["combat-robotics-3"].unit.count = 350
data.raw.technology["artillery"].unit.count = 1000
data.raw.technology["laser"].unit.count = 200

--------------
-- Solar energy
krastorio.technologies.addPrerequisite("solar-energy", "kr-silicon-processing")

-- --

data.raw.technology["physical-projectile-damage-7"].unit.count_formula = "((L-6)^2)*3000"
data.raw.technology["physical-projectile-damage-7"].max_level = 10

data.raw.technology["stronger-explosives-7"].unit.count_formula = "((L-6)^2)*3000"	
data.raw.technology["stronger-explosives-7"].max_level = 10

data.raw.technology["refined-flammables-7"].unit.count_formula = "((L-6)^2)*3000"
data.raw.technology["refined-flammables-7"].max_level = 10

data.raw.technology["energy-weapons-damage-7"].unit.count_formula = "((L-6)^2)*3000"
data.raw.technology["energy-weapons-damage-7"].max_level = 10

data.raw.technology["artillery-shell-range-1"].unit.count_formula = "L^2*3500"
data.raw.technology["artillery-shell-range-1"].max_level = 2

data.raw.technology["artillery-shell-speed-1"].unit.count_formula = "L^2*3500"
data.raw.technology["artillery-shell-speed-1"].max_level = 2

-- --

krastorio.technologies.removePrerequisite("gates", "military-2")
krastorio.technologies.addPrerequisite("gates", "electronics")
krastorio.technologies.removeResearchUnitIngredient("gates", "logistic-science-pack")
--------------
-- miscellaneous

data.raw.technology["logistic-system"].unit.count = 250
data.raw.technology["coal-liquefaction"].unit.count = 150	
data.raw.technology["automation-3"].unit.count = 350		
data.raw.technology["effect-transmission"].unit.count = 500
data.raw.technology["low-density-structure"].unit.count = 500

--------------
-- nuclear

data.raw.technology["uranium-processing"].unit.count = 750
data.raw.technology["nuclear-power"].unit.count = 500
data.raw.technology["nuclear-fuel-reprocessing"].unit.count = 250
krastorio.technologies.removePrerequisite("atomic-bomb", "military-4")
krastorio.technologies.addPrerequisite("atomic-bomb", "kr-military-5")
data.raw.technology["atomic-bomb"].unit.count = 1500

--------------
-- stats

data.raw.technology["fusion-reactor-equipment"].unit.count = 350

data.raw.technology["mining-productivity-3"].unit.count = 500	
data.raw.technology["mining-productivity-4"].unit.count_formula = "(L^2)*200"
data.raw.technology["mining-productivity-4"].max_level = 10


data.raw.technology["follower-robot-count-7"].unit.count_formula = "((L-6)^2)*5000"
data.raw.technology["follower-robot-count-7"].max_level = nil

data.raw.technology["worker-robots-speed-6"].unit.count_formula = "((L-5)^2)*5000"
data.raw.technology["worker-robots-speed-6"].max_level = nil

--------------------------------------------------------------------
-- stats

data:extend(
{

-- -- -- -- -- -- --

	{
		type = "technology",
		name = "mining-productivity-11",
		icon_size = 128,
		icon = "__base__/graphics/technology/mining-productivity.png",
		effects =
		{
			{
				type = "mining-drill-productivity-bonus",
				modifier = 0.1
			}
		},
		prerequisites = {"mining-productivity-4", "kr-advanced-tech-card"},
		unit =
		{
			count_formula = "(L^2)*200",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 60
		},
		max_level = 15,
		upgrade = true,
		order = "c-k-f-w"
	},
	{
		type = "technology",
		name = "mining-productivity-16",
		icon_size = 128,
		icon = "__base__/graphics/technology/mining-productivity.png",
		effects =
		{
			{
				type = "mining-drill-productivity-bonus",
				modifier = 0.1
			}
		},
		prerequisites = {"mining-productivity-11", "kr-singularity-tech-card"},
		unit =
		{
			count_formula = "(L^2)*200",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 60
		},
		max_level = 100,
		upgrade = true,
		order = "c-k-f-z"
	},
	
-- -- -- -- -- -- --
	
	{
		type = "technology",
		name = "worker-robots-speed-7",
		icon_size = 128,
		icon = "__base__/graphics/technology/worker-robots-speed.png",
		effects =
		{
			{
				type = "worker-robot-speed",
				modifier = 0.60
			}
		},
		prerequisites = {"worker-robots-speed-6", "kr-advanced-tech-card"},
		unit =
		{
			count_formula = "((L-6)^2)*5000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 60
		},
		max_level = 8,
		upgrade = true,
		order = "c-k-f-w"
	},
	
	{
		type = "technology",
		name = "worker-robots-speed-9",
		icon_size = 128,
		icon = "__base__/graphics/technology/worker-robots-speed.png",
		effects =
		{
			{
				type = "worker-robot-speed",
				modifier = 0.375
			}
		},
		prerequisites = {"worker-robots-speed-7", "kr-singularity-tech-card"},
		unit =
		{
			count_formula = "((L-8)^2)*5000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 60
		},
		max_level = 10,
		upgrade = true,
		order = "c-k-f-z"
	},
	
-- -- -- -- -- -- --
	
	{
		type = "technology",
		name = "follower-robot-count-8",
		icon_size = 128,
		icon = "__base__/graphics/technology/follower-robots.png",
		effects =
		{
			{
				type = "maximum-following-robots-count",
				modifier = 15
			}
		},
		prerequisites = {"follower-robot-count-7", "kr-advanced-tech-card"},
		unit =
		{
			count_formula = "((L-7)^2)*5000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 60
		},
		upgrade = true,
		order = "c-k-f-w"
	},
	
	{
		type = "technology",
		name = "follower-robot-count-9",
		icon_size = 128,
		icon = "__base__/graphics/technology/follower-robots.png",
		effects =
		{
			{
				type = "maximum-following-robots-count",
				modifier = 15
			}
		},
		prerequisites = {"follower-robot-count-8", "kr-singularity-tech-card"},
		unit =
		{
			count_formula = "((L-8)^2)*5000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 60
		},
		max_level = 10,
		upgrade = true,
		order = "c-k-f-z"
	},
	
-- -- -- -- -- -- --
	
	{
		type = "technology",
		name = "physical-projectile-damage-11",
		icon_size = 128,
		icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "bullet",
				modifier = 0.1
			},
			{
				type = "turret-attack",
				turret_id = "gun-turret",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "shotgun-shell",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "cannon-shell",
				modifier = 0.1
			}
		},
		prerequisites = {"physical-projectile-damage-7", "kr-advanced-tech-card"},
		unit =
		{
			count_formula = "((L-10)^2)*3000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 60
		},
		max_level = 15,
		upgrade = true,
		order = "c-k-f-w"
	},
	{
		type = "technology",
		name = "physical-projectile-damage-16",
		icon_size = 128,
		icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "bullet",
				modifier = 0.1
			},
			{
				type = "turret-attack",
				turret_id = "gun-turret",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "shotgun-shell",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "cannon-shell",
				modifier = 0.1
			}
		},
		prerequisites = {"physical-projectile-damage-11", "kr-singularity-tech-card"},
		unit =
		{
			count_formula = "((L-15)^2)*3000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 60
		},
		max_level = 18,
		upgrade = true,
		order = "c-k-f-z"
	},	
	
-- -- -- -- -- -- --
	
	{
		type = "technology",
		name = "stronger-explosives-11",
		icon_size = 128,
		icon = "__base__/graphics/technology/stronger-explosives-3.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "rocket",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "grenade",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "artillery-shell",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "landmine",
				modifier = 0.1
			}
		},
		prerequisites = {"stronger-explosives-7", "kr-advanced-tech-card"},
		unit =
		{
			count_formula = "((L-10)^2)*3000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 60
		},
		max_level = 15,
		upgrade = true,
		order = "c-k-f-w"
	},
	{
		type = "technology",
		name = "stronger-explosives-16",
		icon_size = 128,
		icon = "__base__/graphics/technology/stronger-explosives-3.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "rocket",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "grenade",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "artillery-shell",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "landmine",
				modifier = 0.1
			}
		},
		prerequisites = {"stronger-explosives-11", "kr-singularity-tech-card"},
		unit =
		{
			count_formula = "((L-15)^2)*3000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 60
		},
		max_level = 18,
		upgrade = true,
		order = "c-k-f-z"
	},	
	
-- -- -- -- -- -- --
	
	{
		type = "technology",
		name = "refined-flammables-11",
		icon_size = 128,
		icon = "__base__/graphics/technology/refined-flammables.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "flamethrower",
				modifier = 0.1
			},
			{
				type = "turret-attack",
				turret_id = "flamethrower-turret",
				modifier = 0.1
			}
		},
		prerequisites = {"refined-flammables-7", "kr-advanced-tech-card"},
		unit =
		{
			count_formula = "((L-10)^2)*3000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 60
		},
		max_level = 15,
		upgrade = true,
		order = "c-k-f-w"
	},
	{
		type = "technology",
		name = "refined-flammables-16",
		icon_size = 128,
		icon = "__base__/graphics/technology/refined-flammables.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "flamethrower",
				modifier = 0.1
			},
			{
				type = "turret-attack",
				turret_id = "flamethrower-turret",
				modifier = 0.1
			}
		},
		prerequisites = {"refined-flammables-11", "kr-singularity-tech-card"},
		unit =
		{
			count_formula = "((L-15)^2)*3000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 60
		},
		max_level = 18,
		upgrade = true,
		order = "c-k-f-z"
	},		
	
-- -- -- -- -- -- --
	
	{
		type = "technology",
		name = "energy-weapons-damage-11",
		icon_size = 128,
		icon = "__base__/graphics/technology/energy-weapons-damage-3.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "laser-turret",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "combat-robot-laser",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "combat-robot-beam",
				modifier = 0.1
			}
		},
		prerequisites = {"energy-weapons-damage-7", "kr-advanced-tech-card"},
		unit =
		{
			count_formula = "((L-10)^2)*3000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 60
		},
		max_level = 15,
		upgrade = true,
		order = "c-k-f-w"
	},
	{
		type = "technology",
		name = "energy-weapons-damage-16",
		icon_size = 128,
		icon = "__base__/graphics/technology/energy-weapons-damage-3.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "laser-turret",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "combat-robot-laser",
				modifier = 0.1
			},
			{
				type = "ammo-damage",
				ammo_category = "combat-robot-beam",
				modifier = 0.1
			}
		},
		prerequisites = {"energy-weapons-damage-11", "kr-singularity-tech-card"},
		unit =
		{
			count_formula = "((L-15)^2)*3000",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 60
		},
		max_level = 18,
		upgrade = true,
		order = "c-k-f-z"
	},
	
-- -- -- -- -- -- --
	
	{
		type = "technology",
		name = "artillery-shell-range-3",
		icon_size = 128,
		icon = "__base__/graphics/technology/artillery-range.png",
		effects =
		{
			{
			type = "artillery-range",
			modifier = 0.3
			}
		},
		prerequisites = {"artillery-shell-range-1", "kr-advanced-tech-card"},
		unit =
		{
			count_formula = "((L-2)^2)*3500",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 60
		},
		max_level = 4,
		upgrade = true,
		order = "c-k-f-w"
	},
	{
		type = "technology",
		name = "artillery-shell-range-5",
		icon_size = 128,
		icon = "__base__/graphics/technology/artillery-range.png",
		effects =
		{
			{
			type = "artillery-range",
			modifier = 0.2
			}
		},
		prerequisites = {"artillery-shell-range-3", "kr-singularity-tech-card"},
		unit =
		{
			count_formula = "((L-4)^2)*3500",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 60
		},
		max_level = 7,
		upgrade = true,
		order = "c-k-f-z"
	},
	
-- -- -- -- -- -- --
	
	{
		type = "technology",
		name = "artillery-shell-speed-3",
		icon_size = 128,
		icon = "__base__/graphics/technology/artillery-speed.png",
		effects =
		{
			{
				type = "gun-speed",
				ammo_category = "artillery-shell",
				modifier = 0.1
			}
		},
		prerequisites = {"artillery-shell-speed-1", "kr-advanced-tech-card"},
		unit =
		{
			count_formula = "((L-2)^2)*3500",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 60
		},
		max_level = 4,
		upgrade = true,
		order = "c-k-f-w"
	},
	{
		type = "technology",
		name = "artillery-shell-speed-5",
		icon_size = 128,
		icon = "__base__/graphics/technology/artillery-speed.png",
		effects =
		{
			{
				type = "gun-speed",
				ammo_category = "artillery-shell",
				modifier = 0.1
			}
		},
		prerequisites = {"artillery-shell-speed-3", "kr-singularity-tech-card"},
		unit =
		{
			count_formula = "((L-4)^2)*3500",
			ingredients =
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 60
		},
		max_level = 7,
		upgrade = true,
		order = "c-k-f-z"
	}
	
}
)