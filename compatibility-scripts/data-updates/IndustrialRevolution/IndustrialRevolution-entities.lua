if mods["IndustrialRevolution"] then
	-- Removing "flare-stack"
	krastorio.technologies.removeUnlockRecipe("oil-processing", "flare-stack")
	
	-- Improving krastorio crusher
	for _, category in pairs({"grinding","grinding-1","grinding-2"}) do
		table.insert(data.raw["furnace"]["kr-crusher"].crafting_categories, category)
	end
	
end
