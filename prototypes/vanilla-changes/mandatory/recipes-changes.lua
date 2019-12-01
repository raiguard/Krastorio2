
-- Disabling all vanilla recipes at the game start 
krastorio.recipes.disable("electronic-circuit") -- ReAdded
krastorio.recipes.disable("automation-science-pack") -- ReAdded
krastorio.recipes.disable("transport-belt") -- ReAdded
krastorio.recipes.disable("inserter") -- ReAdded
krastorio.recipes.disable("burner-inserter") -- ReAdded
krastorio.recipes.disable("steam-engine") -- ReAdded
krastorio.recipes.disable("pipe") -- ReAdded
krastorio.recipes.disable("pipe-to-ground") -- ReAdded
krastorio.recipes.disable("boiler") -- ReAdded
krastorio.recipes.disable("electric-mining-drill")
krastorio.recipes.disable("offshore-pump") -- ReAdded
krastorio.recipes.disable("radar")
krastorio.recipes.disable("light-armor") -- ReAdded

--------------------------------------------------------------------
-- -- -- ITEMS
--------------------------------------------------------------------

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

-- other inserter
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

-- Lamp
krastorio.recipes.convertIngredient("small-lamp", "electronic-circuit", "glass")

-- Bricks
if krastorio.recipes.exist("stone-brick") then
	data.raw.recipe["stone-brick"].subgroup = "raw-material"
end

--------------------------------------------------------------------
-- -- -- BUILDINGS
--------------------------------------------------------------------

-- Assembling machine tier 1
krastorio.recipes.convertIngredient("assembling-machine-1", "electronic-circuit", "automation-core")
krastorio.recipes.replaceIngredient("assembling-machine-1", "iron-plate", {"iron-beam", 5})

-- Gun turret
krastorio.recipes.replaceIngredient("gun-turret", "iron-plate", {"iron-beam", 10})

-- Underground belt (Yellow tier 1)
krastorio.recipes.replaceIngredient("underground-belt", "iron-plate", {"iron-beam", 5})

-- Splitter (Yellow tier 1)
krastorio.recipes.replaceIngredient("splitter", "iron-plate", {"iron-gear-wheel", 5})
krastorio.recipes.replaceIngredient("splitter", "electronic-circuit", {"automation-core", 1})

-- Fast belt (Red tier 2)
krastorio.recipes.convertIngredient("fast-transport-belt", "iron-gear-wheel", "steel-gear-wheel")

-- Fast underground belt (Red tier 2)
krastorio.recipes.convertIngredient("fast-underground-belt", "iron-gear-wheel", "steel-gear-wheel")

-- Fast splitter (Red tier 2)
krastorio.recipes.convertIngredient("fast-splitter", "iron-gear-wheel", "steel-gear-wheel")

-- Storage tank
krastorio.recipes.replaceIngredient("storage-tank", "iron-plate", {"iron-plate", 10})
krastorio.recipes.convertIngredient("storage-tank", "steel-plate", "steel-beam")

-- Poles
krastorio.recipes.replaceIngredient("medium-electric-pole", "copper-plate", {"copper-cable", 4})
krastorio.recipes.replaceIngredient("medium-electric-pole", "steel-plate", {"iron-beam", 2})

krastorio.recipes.replaceIngredient("big-electric-pole", "copper-plate", {"copper-cable", 8})
krastorio.recipes.replaceIngredient("big-electric-pole", "steel-plate", {"steel-beam", 4})

krastorio.recipes.replaceIngredient("substation", "copper-plate", {"copper-cable", 16})
krastorio.recipes.replaceIngredient("substation", "steel-plate", {"steel-beam", 8})

krastorio.recipes.replaceIngredient("roboport", "steel-plate", {"steel-beam", 20})

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
