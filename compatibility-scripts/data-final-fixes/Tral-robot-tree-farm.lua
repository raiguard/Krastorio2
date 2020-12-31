if mods["Tral_robot_tree_farm"] then
	-- base recipe to copy properties from
	local base_seed_recipe = table.deepcopy(data.raw["recipe"]["tree-01"])

	-- base recipe to copy properties from
	local base_crushing_recipe = table.deepcopy(data.raw["recipe"]["kr-vc-tree-01"])

	local function create_seed_recipe (seed_name)
		local recipe = table.deepcopy(base_seed_recipe)
		recipe.name = "kr2" .. seed_name
		recipe.result = seed_name
		
		return recipe
	end

	-- get krastorio decoration technology effects
	local technology_unlock = data.raw["technology"]["kr-decorations"].effects

	-- cycle through all effects of the technology
	for i, element in pairs(technology_unlock) do
		-- if it's a tree recipe
		if string.sub(element.recipe, 0, 4) == "tree" then
			-- remove the recipe from the technology
			technology_unlock[i] = nil
			-- remove the recipe from the game
			data.raw["recipe"][element.recipe] = nil
			-- remove the tree item from the game
			data.raw["item"][element.recipe] = nil
			-- remove the crushing recipe from the game
			data.raw["recipe"]["kr-vc-" .. element.recipe] = nil

		end
	end

	-- cycle through all the trees
	for id, tree in pairs(data.raw["tree"]) do		
		local seed_name = "rtf-" .. tree.name .. "-seed"
		local seed = data.raw["item"][seed_name];

		-- if seed exists
		if seed then
			-- create its recipe
			local recipe = create_seed_recipe(seed_name)

			-- change subgroup of seed (they get placed in the place of the krastorio tree)
			seed.subgroup = "kr-decorations-1"
			-- change order of seed (they stay the same but get the krastorio order id)
			seed.order = "a[" .. seed.name .. "]"
			
			-- add recipe to game
			data:extend({ recipe })
			-- add recipe to technology
			table.insert(technology_unlock, { type = "unlock-recipe", recipe = recipe.name})

			-- create the crushing recipe
			local crushing_recipe = table.deepcopy(base_crushing_recipe)
			crushing_recipe.name = "kr-vc-" .. seed.name
			crushing_recipe.ingredients = {{ seed.name, 1 }}
			
			-- add it to the game
			data:extend({ crushing_recipe })
		end
	end
end
