
-- Disabling all vanilla recipes at the game start 
krastorio.recipes.disable("electronic-circuit")
krastorio.recipes.disable("transport-belt")
krastorio.recipes.disable("inserter")
krastorio.recipes.disable("burner-inserter")
krastorio.recipes.disable("steam-engine")
krastorio.recipes.disable("pipe")
krastorio.recipes.disable("pipe-to-ground")
krastorio.recipes.disable("boiler")
krastorio.recipes.disable("electric-mining-drill")
krastorio.recipes.disable("offshore-pump")
krastorio.recipes.disable("radar")
krastorio.recipes.disable("light-armor")

-- Hide barrel crafting from player menu
for fluid_name, _ in pairs(data.raw.fluid) do
	if krastorio.recipes.exist("empty-"..fluid_name.."-barrel") then
		data.raw.recipe["empty-"..fluid_name.."-barrel"].hide_from_player_crafting = true
	end
	if krastorio.recipes.exist("fill-"..fluid_name.."-barrel") then
		data.raw.recipe["fill-"..fluid_name.."-barrel"].hide_from_player_crafting = true
	end
end

--------------------------------------------------------------------
-- -- -- ITEMS
--------------------------------------------------------------------

-- Rocket fuel category
krastorio.recipes.convertIngredientFromAllRecipes("nuclear-fuel", "rocket-fuel")
krastorio.recipes.setCategoryIfExist("rocket-fuel", "fuel-refinery")
krastorio.recipes.addOrReplaceIngredient("rocket-fuel", "light-oil", {type="fluid", name="light-oil", amount=30, catalyst_amount=30})
krastorio.recipes.replaceIngredient("rocket-fuel", "solid-fuel", {"iron-plate", 1})
krastorio.recipes.addIngredient("rocket-fuel", {type="fluid", name="oxygen", amount=50})


-- Apply automation core to the early game items
krastorio.recipes.addIngredient("burner-inserter", {"automation-core", 1})
krastorio.recipes.replaceIngredient("burner-inserter", "iron-plate", {"iron-stick", 2})
krastorio.recipes.overrideIngredients
(
	"inserter", 
	{
		{"burner-inserter", 1},
		{"copper-cable", 2}
	}
)
krastorio.recipes.replaceIngredient("long-handed-inserter", "iron-plate", {"iron-stick", 2})

-- Other inserters
krastorio.recipes.replaceIngredient("fast-inserter", "iron-plate", {"steel-plate", 1})
krastorio.recipes.convertIngredient("stack-inserter", "iron-gear-wheel", "steel-gear-wheel")

-- Chaning steel recipes
krastorio.recipes.overrideIngredients
(
	"steel-plate", 
	{
		{"iron-plate", 1},
		{"coke", 1}
	}
)
krastorio.recipes.setEnergyCost("steel-plate", 3.2)

krastorio.recipes.replaceIngredient("iron-gear-wheel", "iron-plate", {"iron-plate", 1})

-- Engine
krastorio.recipes.convertIngredient("engine-unit", "steel-plate", "iron-plate")

-- Bricks
if krastorio.recipes.exist("stone-brick") then
	data.raw.recipe["stone-brick"].subgroup = "raw-material"
end

-- ROBOT/DRONES
krastorio.recipes.replaceIngredient("flying-robot-frame", "electronic-circuit", {"electronic-components", 10})

-- Circuits
krastorio.recipes.addIngredient("electronic-circuit", {"wood", 2})
krastorio.recipes.replaceIngredient("electronic-circuit", "iron-plate", {"iron-plate", 2})
krastorio.recipes.replaceIngredient("electronic-circuit", "copper-cable", {"copper-cable", 4})
krastorio.recipes.setEnergyCost("electronic-circuit", 2)
krastorio.recipes.replaceProduct("electronic-circuit", "electronic-circuit", {"electronic-circuit", 2})

krastorio.recipes.replaceIngredient("advanced-circuit", "plastic-bar", {"electronic-components", 1})
krastorio.recipes.setEnergyCost("advanced-circuit", 4)

krastorio.recipes.removeIngredient("processing-unit", "electronic-circuit")
krastorio.recipes.replaceIngredient("processing-unit", "advanced-circuit", {"advanced-circuit", 4})
krastorio.recipes.addIngredient("processing-unit", {"rare-metals", 2})
krastorio.recipes.replaceIngredient("processing-unit", "sulfuric-acid", {type="fluid", name="sulfuric-acid", amount=4})

krastorio.recipes.replaceIngredient("repair-pack", "iron-gear-wheel", {"iron-plate", 2})
krastorio.recipes.replaceIngredient("repair-pack", "electronic-circuit", {"copper-plate", 2})
krastorio.recipes.addIngredient("repair-pack", {"stone", 2})

-- EQUIPMENTS
krastorio.recipes.replaceIngredient("personal-laser-defense-equipment", "processing-unit", {"electronic-components", 50})

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

-- Ammos
krastorio.recipes.convertIngredient("flamethrower-ammo", "steel-plate", "iron-plate")

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

--------------------------------------------------------------------
-- -- -- BUILDINGS
--------------------------------------------------------------------

-- Convert all electronic-circuit of early game in automation-core
local function hasEarlyGameIngredients(ingredients)
	local basic, automation = false, false
	local ingredient_name = nil
	for i = 1, #ingredients do
		ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
		if ingredient_name == "basic-tech-card" then
			if #ingredients == 1 then
				return true
			else
				basic = true
			end
		end
		if ingredient_name == "automation-science-pack" then
			if #ingredients == 1 then
				return true
			else
				automation = true
			end
		end
	end
	if #ingredients == 2 and basic and automation then
		return true
	else
		return false
	end
end
for name, technology in pairs(data.raw.technology) do
	local count = nil
	if (technology.enabled == true or technology.enabled == nil) and technology.effects then
		if technology.unit and technology.unit.ingredients and hasEarlyGameIngredients(technology.unit.ingredients) then
			for _, effect in pairs(technology.effects) do
				if effect.type == "unlock-recipe" then
					count = krastorio.recipes.countIngredient(effect.recipe, "electronic-circuit")
					if count > 0 then
						krastorio.recipes.replaceIngredient(effect.recipe, "electronic-circuit", {"automation-core", math.ceil(count/2)})
					end
				end
			end
		end
	end
end	

-- Lamp (glass)
krastorio.recipes.convertIngredient("small-lamp", "automation-core", "glass")
krastorio.recipes.addOrReplaceIngredient("small-lamp", {name = "glass", amount = 1})
-- Solar panel (glass)
krastorio.recipes.addOrReplaceIngredient("solar-panel", {name = "glass", amount = 5})

-- Assembling machine tier 1
krastorio.recipes.replaceIngredient("assembling-machine-1", "iron-plate", {"iron-beam", 4})

-- Electric mining drill 1
krastorio.recipes.replaceIngredient("electric-mining-drill", "iron-plate", {"iron-beam", 2})

-- Gun turret
krastorio.recipes.replaceIngredient("gun-turret", "iron-plate", {"iron-beam", 10})

-- Underground belt (Yellow tier 1)
krastorio.recipes.replaceIngredient("underground-belt", "iron-plate", {"iron-beam", 5})

-- Splitter (Yellow tier 1)
krastorio.recipes.replaceIngredient("splitter", "iron-plate", {"iron-gear-wheel", 5})
krastorio.recipes.replaceIngredient("splitter", "automation-core", {"automation-core", 1})

-- Fast belt (Red tier 2)
-- krastorio.recipes.convertIngredient("fast-transport-belt", "iron-gear-wheel", "steel-gear-wheel")

-- Fast underground belt (Red tier 2)
-- krastorio.recipes.convertIngredient("fast-underground-belt", "iron-gear-wheel", "steel-gear-wheel")

-- Fast splitter (Red tier 2)
-- krastorio.recipes.convertIngredient("fast-splitter", "iron-gear-wheel", "steel-gear-wheel")

-- Express belt (Red tier 3)
krastorio.recipes.convertIngredient("express-transport-belt", "iron-gear-wheel", "steel-gear-wheel")

-- Express underground belt (Red tier 3)
krastorio.recipes.convertIngredient("express-underground-belt", "iron-gear-wheel", "steel-gear-wheel")

-- Express splitter (Red tier 3)
krastorio.recipes.convertIngredient("express-splitter", "iron-gear-wheel", "steel-gear-wheel")

-- Storage tank
krastorio.recipes.replaceIngredient("storage-tank", "iron-plate", {"iron-plate", 10})
krastorio.recipes.convertIngredient("storage-tank", "steel-plate", "iron-beam")

-- Pump
krastorio.recipes.convertIngredient("storage-tank", "steel-plate", "iron-beam")

-- Pumpjack
krastorio.recipes.convertIngredient("pumpjack", "iron-gear-wheel", "steel-gear-wheel")
krastorio.recipes.replaceIngredient("pumpjack", "steel-plate", {"steel-beam", 4})
krastorio.recipes.replaceIngredient("pumpjack", "iron-plate", {"steel-beam", 4})

-- Oil refinery
krastorio.recipes.replaceIngredient("oil-refinery", "steel-plate", {"steel-beam", 4})
krastorio.recipes.convertIngredient("oil-refinery", "iron-gear-wheel", "steel-gear-wheel")

-- Chemical plant
krastorio.recipes.replaceIngredient("chemical-plant", "steel-plate", {"steel-beam", 4})
krastorio.recipes.convertIngredient("chemical-plant", "iron-gear-wheel", "steel-gear-wheel")

-- Poles
krastorio.recipes.replaceIngredient("medium-electric-pole", "copper-plate", {"copper-cable", 4})
krastorio.recipes.replaceIngredient("medium-electric-pole", "steel-plate", {"iron-beam", 2})

krastorio.recipes.replaceIngredient("big-electric-pole", "copper-plate", {"copper-cable", 8})
krastorio.recipes.replaceIngredient("big-electric-pole", "steel-plate", {"steel-beam", 4})

krastorio.recipes.replaceIngredient("substation", "copper-plate", {"copper-cable", 16})
krastorio.recipes.replaceIngredient("substation", "steel-plate", {"steel-beam", 8})

krastorio.recipes.replaceIngredient("roboport", "steel-plate", {"steel-beam", 20})

-- Vanilla Lab
krastorio.recipes.replaceIngredient("lab", "electronic-circuit", {"iron-beam", 10})
krastorio.recipes.replaceIngredient("lab", "iron-gear-wheel", {"copper-plate", 10})
krastorio.recipes.replaceIngredient("lab", "transport-belt", {"copper-cable", 10})

-- Nuclear reactor
data.raw.recipe["nuclear-reactor"].energy_required = 600
data.raw.recipe["nuclear-reactor"].category = "crafting-with-fluid"
krastorio.recipes.replaceIngredient("nuclear-reactor", "concrete", {"concrete", 500}) --it's not a mistake. it's for future rebalance
krastorio.recipes.replaceIngredient("nuclear-reactor", "steel-plate", {"steel-plate", 500}) --it's not a mistake. it's for future rebalance
krastorio.recipes.replaceIngredient("nuclear-reactor", "advanced-circuit", {"advanced-circuit", 250}) --it's not a mistake. it's for future rebalance
krastorio.recipes.replaceIngredient("nuclear-reactor", "copper-plate", {"copper-plate", 250})
krastorio.recipes.addIngredient("nuclear-reactor", {"rare-metals", 250})
krastorio.recipes.addIngredient("nuclear-reactor", {type="fluid", name="heavy-water", amount=500})


-- -- Turbines
----------------------------

-- Steam engine
krastorio.recipes.setEnergyCost("steam-engine", 5)

-- Steam turbine
krastorio.recipes.setEnergyCost("steam-turbine", 10)
krastorio.recipes.addIngredient("steam-turbine", {"steam-engine", 2})
krastorio.recipes.replaceIngredient("steam-turbine", "iron-gear-wheel", {"iron-gear-wheel", 14})
krastorio.recipes.replaceIngredient("steam-turbine", "pipe", {"pipe", 10})
----------------------------

--------------------------------------------------------------------
-- -- -- VEHICLES
--------------------------------------------------------------------

krastorio.recipes.replaceIngredient("cargo-wagon", "steel-plate", {"steel-beam", 10})

--------------------------------------------------------------------
-- -- -- SPECIAL
--------------------------------------------------------------------

-- Cable of circuit network
krastorio.recipes.removeIngredient("red-wire", "electronic-circuit")
krastorio.recipes.removeIngredient("green-wire", "electronic-circuit")

--------------------------------------------------------------------
