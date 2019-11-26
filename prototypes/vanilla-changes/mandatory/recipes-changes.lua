
-- Disabling all vanilla recipes at the game start 
krastorio.recipes.disable("electronic-circuit") -- ReAdded
krastorio.recipes.disable("automation-science-pack") -- ReAdded
krastorio.recipes.disable("transport-belt") -- ReAdded
krastorio.recipes.disable("inserter") -- ReAdded
krastorio.recipes.disable("burner-inserter") -- ReAdded
krastorio.recipes.disable("small-electric-pole")
krastorio.recipes.disable("steam-engine")
krastorio.recipes.disable("pipe")
krastorio.recipes.disable("pipe-to-ground")
krastorio.recipes.disable("boiler")
krastorio.recipes.disable("electric-mining-drill")
krastorio.recipes.disable("offshore-pump")
krastorio.recipes.disable("radar")
krastorio.recipes.disable("light-armor")

-- -- -- ITEMS

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

-- -- -- BUILDINGS

krastorio.recipes.convertIngredient("assembling-machine-1", "electronic-circuit", "automation-core")
krastorio.recipes.convertIngredient("assembling-machine-1", "iron-plate", "iron-beam")

-- -- -- SPECIAL

-- Cable of circuit network
krastorio.recipes.removeIngredient("red-wire", "electronic-circuit")
krastorio.recipes.removeIngredient("green-wire", "electronic-circuit")