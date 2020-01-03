if mods["IndustrialRevolution"] then
	-- Removing "flare-stack"
	krastorio.technologies.removeUnlockRecipe("oil-processing", "flare-stack")
	
	-- Improving krastorio crusher
	for _, category in pairs({"grinding","grinding-1","grinding-2"}) do
		table.insert(data.raw["furnace"]["kr-crusher"].crafting_categories, category)
	end
	data.raw["furnace"]["kr-crusher"].crafting_speed = 2
	
	-- -- Storage big chest warehouse and DIR Storage (STATS)
	--------------------------------------------------------------------------------------
	data.raw.item["bronze-storage-depot"].order = "a[items]-d1[bronze-storage-depot]"
	data.raw.recipe["bronze-storage-depot"].order = "a[items]-d1[bronze-storage-depot]"
	data.raw.item["steel-storage-depot"].order = "a[items]-d2[steel-storage-depot]"
	data.raw.recipe["steel-storage-depot"].order = "a[items]-d2[steel-storage-depot]"

	data:extend(
	{	
		{
			type = "item-subgroup",
			name = "k-logistics2-b",
			group = "logistics",
			order = "a2-b"
		}
	})

	data.raw.recipe["logistics-depot-active"].subgroup = "k-logistics2-b"
	data.raw.recipe["logistics-depot-passive"].subgroup = "k-logistics2-b"
	data.raw.recipe["logistics-depot-storage"].subgroup = "k-logistics2-b"
	data.raw.recipe["logistics-depot-buffer"].subgroup = "k-logistics2-b"
	data.raw.recipe["logistics-depot-requester"].subgroup = "k-logistics2-b"

	-- This is the formula for balacing all added chest
	-- we start from the fact that a tier 1 is 80 from a steel chest, tier 2 container will be doulbe
	-- so tier 2 will be 160, and we will double all superior tier, the result is:
	chest_tier_2_inventory_size = 160 -- 2x2
	chest_tier_3_inventory_size = 320 -- 3x3
	chest_tier_4_inventory_size = 640 -- 6x6

	-- Tier 2

	-- Krastorio medium storehouse
	data.raw["container"]["kr-medium-container"].inventory_size = chest_tier_2_inventory_size

	-- Krastorio logistic medium storehouses
	data.raw["logistic-container"]["kr-medium-active-provider-container"].inventory_size = chest_tier_2_inventory_size
	data.raw["logistic-container"]["kr-medium-buffer-container"].inventory_size = chest_tier_2_inventory_size
	data.raw["logistic-container"]["kr-medium-passive-provider-container"].inventory_size = chest_tier_2_inventory_size
	data.raw["logistic-container"]["kr-medium-storage-container"].inventory_size = chest_tier_2_inventory_size
	data.raw["logistic-container"]["kr-medium-requester-container"].inventory_size = chest_tier_2_inventory_size

	-- Tier 3

	-- DIR depot	
	data.raw["container"]["bronze-storage-depot"].inventory_size = chest_tier_2_inventory_size -- Special case, need a nerf compared with steel tier but without become useless
	data.raw["container"]["steel-storage-depot"].inventory_size = chest_tier_3_inventory_size

	-- DIR logistics depot	
	data.raw["logistic-container"]["logistics-depot-active"].inventory_size = chest_tier_3_inventory_size
	data.raw["logistic-container"]["logistics-depot-passive"].inventory_size = chest_tier_3_inventory_size
	data.raw["logistic-container"]["logistics-depot-storage"].inventory_size = chest_tier_3_inventory_size
	data.raw["logistic-container"]["logistics-depot-buffer"].inventory_size = chest_tier_3_inventory_size
	data.raw["logistic-container"]["logistics-depot-requester"].inventory_size = chest_tier_3_inventory_size

	-- Tier 4

	-- Krastorio big warehouse	
	data.raw["container"]["kr-big-container"].inventory_size = chest_tier_4_inventory_size

	-- Krastorio logistic big warehouses
	data.raw["logistic-container"]["kr-big-active-provider-container"].inventory_size = chest_tier_4_inventory_size
	data.raw["logistic-container"]["kr-big-buffer-container"].inventory_size = chest_tier_4_inventory_size
	data.raw["logistic-container"]["kr-big-passive-provider-container"].inventory_size = chest_tier_4_inventory_size
	data.raw["logistic-container"]["kr-big-storage-container"].inventory_size = chest_tier_4_inventory_size
	data.raw["logistic-container"]["kr-big-requester-container"].inventory_size = chest_tier_4_inventory_size
	--------------------------------------------------------------------------------------
	-- -- Storage technology merge (TECHNOLOGIES)
	--------------------------------------------------------------------------------------
	data.raw.technology["deadlock-storage-2"].icon = "__Krastorio2__/graphics/compatibility/IndustrialRevolution/dir-as.png"
	krastorio.technologies.addEffects
	( 
		"deadlock-storage-2",
		{
			{
				type = "unlock-recipe",
				recipe = "kr-medium-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-big-container"
			}
		}
	)
	-- remove Krastorio one
	data.raw.technology["kr-containers"] = nil

	data.raw.technology["deadlock-storage-3"].icons = nil
	data.raw.technology["deadlock-storage-3"].icon  = "__Krastorio2__/graphics/compatibility/IndustrialRevolution/dir-als.png"
	data.raw.technology["deadlock-storage-3"].icon_size = 128
	krastorio.technologies.addEffects
	(	
		"deadlock-storage-3",
		{
			{
				type = "unlock-recipe",
				recipe = "kr-medium-storage-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-medium-passive-provider-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-big-storage-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-big-passive-provider-container"
			}
		}
	)

	data.raw.technology["deadlock-storage-4"].icons = nil
	data.raw.technology["deadlock-storage-4"].icon  = "__Krastorio2__/graphics/compatibility/IndustrialRevolution/dir-als.png"
	data.raw.technology["deadlock-storage-4"].icon_size = 128
	krastorio.technologies.addEffects
	(	
		"deadlock-storage-4",
		{
			{
				type = "unlock-recipe",
				recipe = "kr-medium-active-provider-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-medium-buffer-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-medium-requester-container"
			},	
			{
				type = "unlock-recipe",
				recipe = "kr-big-active-provider-container"
			},		
			{
				type = "unlock-recipe",
				recipe = "kr-big-buffer-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-big-requester-container"
			}			
		}
	)
	-- remove Krastorio one
	data.raw.technology["kr-logistic-containers-1"] = nil
	data.raw.technology["kr-logistic-containers-2"] = nil
	--------------------------------------------------------------------------------------
	
end
