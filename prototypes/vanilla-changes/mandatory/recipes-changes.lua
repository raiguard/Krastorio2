
-- Disabling all vanilla recipes at the game start 
krastorio.recipes.disable("electronic-circuit")
krastorio.recipes.disable("automation-science-pack")
krastorio.recipes.disable("transport-belt")
krastorio.recipes.disable("inserter")
krastorio.recipes.disable("burner-inserter")
krastorio.recipes.disable("small-electric-pole")
krastorio.recipes.disable("steam-engine")
krastorio.recipes.disable("steam-engine")
krastorio.recipes.disable("pipe")
krastorio.recipes.disable("pipe-to-ground")
krastorio.recipes.disable("boiler")
krastorio.recipes.disable("electric-mining-drill")
krastorio.recipes.disable("offshore-pump")
krastorio.recipes.disable("radar")
krastorio.recipes.disable("light-armor")

-- Chaning steel recipes
krastorio.recipes.overrideIngredients
(
	"steel-plate", 
	{
		{"iron-plate", 1},
		{"coke", 1}
	}
)

