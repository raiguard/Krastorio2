if mods["deadlock-beltboxes-loaders"] then	

	local function krCreateStacks(_stackable_krastorio_items)
		for i, items in pairs(_stackable_krastorio_items) do
			for _, item_name in pairs(items) do
				deadlock.add_stack
				(	
					item_name,
					nil,
					"deadlock-stacking-" .. i
				)
			end
		end
	end

	--Adding new 4 tier
	local loader_tier_3 = krastorio.items.getItem("express-transport-belt-loader") or krastorio.items.getItem("kr-express-loader")
	deadlock.add_tier(
	{
		transport_belt      = "kr-advanced-transport-belt",
		colour              = {r=76, g=232, b=48, a=250},
		underground_belt    = "kr-advanced-underground-belt",
		splitter            = "kr-advanced-splitter",
		technology          = "kr-logistic-4",
		order               = "d",
		loader_ingredients  = 
		{
			{loader_tier_3.name, 1},
			{"steel-gear-wheel", 20},
			{"rare-metals", 5},			
			{type = "fluid", name = "sulfuric-acid", amount = 50, catalyst_amount = 50}	
		},
		beltbox_ingredients = 
		{
			{"express-transport-belt-beltbox", 1},
			{"steel-gear-wheel", 20},
			{"rare-metals", 5},			
			{type = "fluid", name = "sulfuric-acid", amount = 50, catalyst_amount = 50}	
		},
		beltbox_technology = "deadlock-stacking-4"
	})
	krastorio.technologies.addPrerequisite("deadlock-stacking-4", "deadlock-stacking-3")	
	
	--Adding new 5 tier
	local loader_tier_4 = krastorio.items.getItem("kr-advanced-transport-belt-loader") or krastorio.items.getItem("kr-advanced-loader")
	deadlock.add_tier(
	{
		transport_belt      = "kr-superior-transport-belt",
		colour              = {r=151, g=34, b=191, a=250},
		underground_belt    = "kr-superior-underground-belt",
		splitter            = "kr-superior-splitter",
		technology          = "kr-logistic-5",
		order               = "e",
		loader_ingredients  = 
		{
			{loader_tier_4.name, 1},
			{"imersium-gear-wheel", 20},			
			{type = "fluid", name = "nitric-acid", amount = 25, catalyst_amount = 50}
		},
		beltbox_ingredients = 
		{
			{"kr-advanced-transport-belt-beltbox", 1},
			{"imersium-gear-wheel", 10},			
			{type = "fluid", name = "nitric-acid", amount = 25, catalyst_amount = 50}
		},
		beltbox_technology = "deadlock-stacking-5"
	})
	krastorio.technologies.addPrerequisite("deadlock-stacking-5", "deadlock-stacking-4")	
		
	local stackable_krastorio_items = 
	{
		[1] = 
		{   -- Tier 1
			"blank-tech-card",
			"automation-core",
			"coke"
		},
		[2] = 
		{	-- Tier 2
			"biomass",
			"quartz",
			"silicon",			
			"raw-rare-metals",
			"rare-metals",
			"lithium-sulfur-battery",
			"enriched-copper",
			"enriched-iron",
			"fuel",
			"bio-fuel",
			"fertilizer",
			"pollution-filter",
			"used-pollution-filter",
			"first-aid-kit",
			"electronic-components"
		},
		[3] = 
		{	-- Tier 3
			"tritium",
			"deuterium-oxide",
			"dt-fuel",
			"raw-imersite",
			"imersite-powder",
			"imersite-crystal",
			"imersite-glass",
			"black-reinforced-plate",
			"white-reinforced-plate"
		}, 
		[5] = 
		{	-- Tier 5
			"ai-core",
			"imersium-plate",
			"imersium-beam",
			"imersium-gear-wheel",
			"charged-matter-stabilizer",
			"matter-stabilizer",
			"energy-control-unit",
			"advanced-fuel",
			"empty-antimatter-fuel-cell",
			"charged-antimatter-fuel-cell"
		}
	}
	
	krCreateStacks(stackable_krastorio_items)
	
	-- -- Inter/Cross compatibility with deadlock beltboxes loaders with IndustrialRevolution
	if not mods["IndustrialRevolution"] then	
	
		stackable_krastorio_items = 
		{
			[1] = 
			{   -- Tier 1
				"sand",
				"glass"
			},
			[2] = 
			{	-- Tier 2
				"steel-beam",
				"steel-gear-wheel"			
			}
		}
		
		krCreateStacks(stackable_krastorio_items)
	
	end
	
end
