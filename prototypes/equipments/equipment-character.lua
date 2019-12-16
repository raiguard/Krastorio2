-- -- -- CHARACTER EQUIPMENTS

-- -- NEW ARMORS GRID

data:extend(
{
	-- Used in MK3 armor
	{
		type = "equipment-grid",
		name = "mk3-armor-grid",
		width = 10,
		height = 10,
		equipment_categories = {"armor", "universal-equipment"}
	},
	{
		type = "equipment-grid",
		name = "mk4-armor-grid",
		width = 12,
		height = 12,
		equipment_categories = {"armor", "universal-equipment"}
	}
})

-- -- NEW POWER ARMORS (Tier MK3 and MK4)

data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	-- -- Armors
	-- MK3 (item/equipment)
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
----------------------------------------------------------------------------------------------------------------- 
	-- MK4 (item/equipment)
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
	}
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
})
