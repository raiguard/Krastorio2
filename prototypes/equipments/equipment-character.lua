-- -- POWER ARMORS

--in order:
	-- grid
	-- item
	-- equip
	-- recipe
	
data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	-- -- Armors
	-- MK3
	-- grid
	{
		type = "equipment-grid",
		name = "mk3-armor-grid",
		width = 10,
		height = 10,
		--equipment_categories = {"armor", "universal-equipment"}
		equipment_categories = {"armor"}
	},
	-- item
	{
		type = "armor",
		name = "power-armor-mk3",
		icon = kr_character_equipments_icons_path .. "power-armor-mk3.png",	
		icon_size = 64,
		resistances =
		{
			{
				type = "physical",
				decrease = 20,
				percent = 50
			},
			{
				type = "acid",
				decrease = 30,
				percent = 70
			},
			{
				type = "explosion",
				decrease = 40,
				percent = 70
			},
			{
				type = "fire",
				decrease = 20,
				percent = 80
			}
		},
		subgroup = "armor",
		--order = "f[power-armor-mk3]",
		stack_size = 1,
		infinite = true,
		equipment_grid = "large-equipment-grid",
		inventory_size_bonus = 40	
	},	
	-- recipe
--	{
--		type = "recipe",
--		name = "power-armor-mk3",
--		enabled = false,
--		energy_required = 40,
--		ingredients = 
--		{
--			{"power-armor-mk2", 1},
--			{"effectivity-module-3", 15},
--			{"speed-module-3", 15},
--			{"k-tantalum-plate", 20}
--		},
--		result = "power-armor-mk3",
--		requester_paste_multiplier = 1
--	},
----------------------------------------------------------------------------------------------------------------- 
	-- MK4
	-- grid
	{
		type = "equipment-grid",
		name = "mk4-armor-grid",
		width = 12,
		height = 12,
		--equipment_categories = {"armor", "universal-equipment"}
		equipment_categories = {"armor"}
	},
	-- item
	{
		type = "armor",
		name = "power-armor-mk4",
		icon = kr_character_equipments_icons_path .. "power-armor-mk4.png",	
		icon_size = 64,
		resistances =
		{
			{
				type = "physical",
				decrease = 30,
				percent = 60
			},
			{
				type = "acid",
				decrease = 30,
				percent = 80
			},
			{
				type = "explosion",
				decrease = 50,
				percent = 80
			},
			{
				type = "fire",
				decrease = 30,
				percent = 90
			}
		},
		subgroup = "armor",
		--order = "g[power-armor-mk4]",
		stack_size = 1,
		infinite = true,
		equipment_grid = "large-equipment-grid",
		inventory_size_bonus = 50	
	},
	-- recipe
--	{
--		type = "recipe",
--		name = "power-armor-mk4",
--		enabled = false,
--		energy_required = 40,
--		ingredients = 
--		{
--			{"power-armor-mk3", 1},
--			{"effectivity-module-3", 20},
--			{"speed-module-3", 20},
--			{"k-tantalum-plate", 50}
--		},
--		result = "power-armor-mk4",
--		requester_paste_multiplier = 1
--	}
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
})
