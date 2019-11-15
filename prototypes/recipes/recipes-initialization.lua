krastorio_new_recipes =
{
	-- -- Recipes for buildings and other entities
	require("entities-recipes"),

	-- -- Recipes for items (not associated to buildings)
	require("items-recipes")
}

-- -- Anti recipes override check
-- This will avoid that Krastorio 2 will accidentally override a recipe of vanilla or of other mods
-- If one vanilla recipes will be changes or disabled this will be done in the vanilla-changes mod folder
for _, recipe_section in pairs(krastorio_new_recipes) do
	for _, recipe in pairs(recipe_section) do
		krastorio.recipes.addWithOverrideSafeNewRecipe(recipe)
	end
end