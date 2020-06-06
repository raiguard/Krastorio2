if mods["angelsrefining"] then
	-- -- Re-Chaning intermediate products icons

	-- Chaning iron plate
	krastorio.icons.setItemIcon("iron-plate", kr_items_icons_path .. "iron-plate.png", 64, 4)

	-- Changing copper plate
	krastorio.icons.setItemIcon("copper-plate", kr_items_icons_path .. "copper-plate.png", 64, 4)

	-- Chaning steel icon
	krastorio.icons.setItemIcon("steel-plate", kr_items_icons_path .. "steel-plate.png", 64, 4)

	-- Changing iron gear wheel
	krastorio.icons.setItemIcon("iron-gear-wheel", kr_items_icons_path .. "iron-gear-wheel.png", 64, 4)
	
	-- Other smelting icon recipes
	-- Irons
	local iron_recipes =
	{
		"angelsore1-crushed-smelting",
		"angels-iron-pebbles-smelting",
		"angels-iron-nugget-smelting",
		"iron-plate",
		"angels-plate-iron",
		"angels-roll-iron-converting"
	}
	
	for _, recipe_name in pairs(iron_recipes) do
		data.raw.recipe[recipe_name].icons[1].icon = kr_items_icons_path .. "iron-plate.png"
		data.raw.recipe[recipe_name].icons[2].icon_size = 32
		data.raw.recipe[recipe_name].icon_size = 64
	end
	
	data.raw.recipe["enriched-iron-plate"].icons =
	{
		{icon = kr_items_icons_path .. "iron-plate.png", icon_size = 64},
		{icon = kr_items_with_variations_icons_path .. "enriched-iron/enriched-iron.png", icon_size = 64, scale = 0.2, shift = {-10, -10}}
	}
	
	-- Coppers
	local iron_recipes =
	{
		"angelsore3-crushed-smelting",
		"angels-copper-pebbles-smelting",
		"angels-copper-nugget-smelting",
		"copper-plate",
		"angels-plate-copper",
		"angels-roll-copper-converting"
	}
	
	for _, recipe_name in pairs(iron_recipes) do
		data.raw.recipe[recipe_name].icons[1].icon = kr_items_icons_path .. "copper-plate.png"
		data.raw.recipe[recipe_name].icons[2].icon_size = 32
		data.raw.recipe[recipe_name].icon_size = 64
	end
	
	data.raw.recipe["enriched-copper-plate"].icons =
	{
		{icon = kr_items_icons_path .. "copper-plate.png", icon_size = 64},
		{icon = kr_items_with_variations_icons_path .. "enriched-copper/enriched-copper.png", icon_size = 64, scale = 0.2, shift = {-10, -10}}
	}
	
	local iron_recipes =
	{
		"steel-plate",
		"angels-plate-steel",
		"angels-roll-steel-converting"
	}
	
	for _, recipe_name in pairs(iron_recipes) do
		data.raw.recipe[recipe_name].icons[1].icon = kr_items_icons_path .. "steel-plate.png"
		data.raw.recipe[recipe_name].icons[2].icon_size = 32
		data.raw.recipe[recipe_name].icon_size = 64
	end
	
end