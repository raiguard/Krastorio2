-- For each item load that can't be produced by crushers
-- will create a recipe that give 0 void item consuming the input

-- calculate all product that can be processed in "crushing" category
local crushing_products = {}
for recipe_name, recipe in pairs(data.raw.recipe) do	
	if recipe.category and recipe.category == "crushing" then 
		crushing_products[recipe_name] = true
		for _, ingredient in pairs(krastorio.recipes.getIngredients(recipe_name)) do			
			crushing_products[krastorio.recipes.getIngredientName(ingredient)] = true
		end
		for _, ingredient in pairs(krastorio.recipes.getExpensiveIngredients(recipe_name)) do			
			crushing_products[krastorio.recipes.getIngredientName(ingredient)] = true
		end
	end
end

-- this prefix is exclusive of void crushing recipes
local void_crushing_recipes_prefix = "kr-vc-"

-- creating void crushing recipes
for _, type_name in pairs(krastorio.items.item_types) do
	if type_name ~= "fluid" then
		for item_name, _ in pairs(data.raw[type_name]) do		
			if not crushing_products[item_name] then
				data:extend(
				{
					{
						type = "recipe",
						name = void_crushing_recipes_prefix .. item_name,
						category = "crushing",
						hidden = true,
						energy_required = 5,
						ingredients = { { item_name, 1 } },
						results = { { "kr-void", 0 } }
					}
				})
			end
		end
	end
end
