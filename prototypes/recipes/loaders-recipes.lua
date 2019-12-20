if krastorio.general.getSafeSettingValue("kr-loaders") then

	-- Variable utils
	local loader_names = 
	{
		[1] = "kr-loader",
		[2] = "kr-fast-loader",
		[3] = "kr-express-loader",
		[4] = "kr-superior-loader"
	}

	-- RECIPES

	function kr_loader_recipe(data)
		local name = data.name
		local category = data.category or "logistics"
		local ingredients = data.ingredients
		return
		{
			type = "recipe",
			name = name,
			ingredients = ingredients,
			enabled = false,
			energy_required = 10,
			result = name
		}
	end

	local recipes = 
	{
		kr_loader_recipe
		{
			name = loader_names[1],
			ingredients = 
			{
				{"transport-belt", 10},
				{"inserter", 3}
			}
		},
		kr_loader_recipe
		{
			name = loader_names[2],
			ingredients = 
			{
				{"wood", 1}
			}
		},
		kr_loader_recipe
		{
			name = loader_names[3],
			ingredients = 
			{
				{"wood", 1}
			}
		},
		--[[
		kr_loader_recipe
		{
			name = loader_names[4],
			ingredients = 
			{
				{"wood", 1}
			}
		}
		--]]
	}
	data:extend(recipes)
	
end
