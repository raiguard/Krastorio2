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
	-- -- BATTERIES
	-- battery-mk3-equipment
	{
		type = "item",
		name = "battery-mk3-equipment",
		icon = kr_universal_equipments_icons_path .. "battery-mk3-equipment.png",	
		icon_size = 32,
		placed_as_equipment_result = "battery-mk3-equipment",
		subgroup = "equipment",
		order = "b3[battery]-b5[battery-equipment]",
		stack_size = 20,
		default_request_amount = 5
	},
	-- big-battery-equipment
	{
		type = "item",
		name = "big-battery-equipment",
		icon = kr_universal_equipments_icons_path .. "big-battery-equipment.png",
		icon_size = 32,
		placed_as_equipment_result = "big-battery-equipment",
		subgroup = "equipment",
		order = "b1[battery]-b2[battery-equipment]",
		stack_size = 20
	},
	-- big-battery-mk2-equipment
	{
		type = "item",
		name = "big-battery-mk2-equipment",
		icon = kr_universal_equipments_icons_path .. "big-battery-mk2-equipment.png",
		icon_size = 32,
		placed_as_equipment_result = "big-battery-mk2-equipment",
		subgroup = "equipment",
		order = "b2[battery]-b4[battery-equipment]",
		stack_size = 20
	},
	-- big-battery-mk3-equipment
	{
		type = "item",
		name = "big-battery-mk3-equipment",
		icon = kr_universal_equipments_icons_path .. "big-battery-mk3-equipment.png",
		icon_size = 32,
		placed_as_equipment_result = "big-battery-mk3-equipment",
		subgroup = "equipment",
		order = "b3[battery]-b6[battery-equipment]",
		stack_size = 20
	},
	-- -- GENERATORS
	-- small-portable-generator-equipment
	{
		type = "item",
		name = "small-portable-generator",
		icon = kr_universal_equipments_icons_path .. "small-portable-generator.png",
		icon_size = 32,
		placed_as_equipment_result = "small-portable-generator",
		subgroup = "equipment",
		order = "a2[energy-source]-a2[small-portable-generator]",
		stack_size = 10
	},
	-- portable-generator
	{
		type = "item",
		name = "portable-generator",
		icon = kr_universal_equipments_icons_path .. "portable-generator.png",
		icon_size = 32,
		placed_as_equipment_result = "portable-generator",
		subgroup = "equipment",
		order = "a2[energy-source]-a3[k-generator]",
		stack_size = 10
	},
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
})