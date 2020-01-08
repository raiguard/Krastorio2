data:extend(
{
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------CHARACTER EQUIPMENTS-------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	-- -- Exoskeletons
	{	
		type = "item",
		name = "advanced-exoskeleton-equipment",
		icon = kr_character_equipments_icons_path .. "advanced-exoskeleton-equipment.png",
		icon_size = 32,
		placed_as_equipment_result = "advanced-exoskeleton-equipment",		
		subgroup = "character-equipment",
		order = "e[exoskeleton]-a2[advanced-exoskeleton-equipment]",
		stack_size = 20,
		default_request_amount = 1
    },
	{	
		type = "item",
		name = "superior-exoskeleton-equipment",
		icon = kr_character_equipments_icons_path .. "superior-exoskeleton-equipment.png",
		icon_size = 32,
		placed_as_equipment_result = "superior-exoskeleton-equipment",		
		subgroup = "character-equipment",
		order = "e[exoskeleton]-a3[superior-exoskeleton-equipment]",
		stack_size = 20,
		default_request_amount = 1
    },
	-- -- Night visor
	{
		type = "item",
		name = "imersite-night-vision-equipment",
		icon = kr_character_equipments_icons_path .. "imersite-night-vision-equipment.png",	
		icon_size = 32,
		placed_as_equipment_result = "imersite-night-vision-equipment",
		subgroup = "character-equipment",
		order = "f[night-vision]-b[imersite-night-vision-equipment]",
		stack_size = 10,
		default_request_amount = 1
	},
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------VEHICLES EQUIPMENTS--------------------------------------------
----------------------------------------------------------------------------------------------------------------- 

-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------UNIVERSAL EQUIPMENTS-------------------------------------------
----------------------------------------------------------------------------------------------------------------- 

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
})