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
		local name            = data.name or "loader-test"
		local category        = data.category or nil
		local ingredients     = data.ingredients or { {"wood", 1} }
		local enabled         = data.enabled or false
		local energy_required = data.energy_required or 10
		return
		{
			["type"]            = "recipe",
			["name"]            = name,
			["category"]        = category,
			["ingredients"]     = ingredients,
			["enabled"]         = enabled,
			["energy_required"] = energy_required,
			["result"]          = name
		}
	end

	local recipes = 
	{
		kr_loader_recipe
		{
			name = loader_names[1],
			ingredients = 
			{
				{"transport-belt", 1},
				{"inserter", 4}
			}
		},
		kr_loader_recipe
		{
			name = loader_names[2],
			ingredients = 
			{
				{"fast-transport-belt", 1},
				{"kr-loader", 2}				
			}
		},
		kr_loader_recipe
		{
			name = loader_names[3],
			category = "crafting-with-fluid",
			ingredients = 
			{
				{"express-transport-belt", 1},
				{"kr-fast-loader", 2},
				{type = "fluid", name = "lubricant", amount = 40}
			}
		},
		--[[
		kr_loader_recipe
		{
			name = loader_names[4],
			ingredients = 
			{
				{"superior-transport-belt", 1},
				{"kr-express-loader", 2}
			}
		}
		--]]
	}
	data:extend(recipes)
	
end
