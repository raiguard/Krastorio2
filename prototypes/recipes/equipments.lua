-- Recipe for make equipments (armors included)
return
{
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------CHARACTER EQUIPMENTS-------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	-- -- Exoskeletons

	-- -- Imersite night visor

-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------VEHICLES EQUIPMENTS--------------------------------------------
----------------------------------------------------------------------------------------------------------------- 

-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------UNIVERSAL EQUIPMENTS-------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	-- -- BATTERIES
	-- battery-mk3-equipment
	{
		type = "recipe",
		name = "battery-mk3-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{"battery-mk2-equipment", 2},
			--{"imersite-battery", 2},
			{"processing-unit", 1}
		},
		result = "battery-mk3-equipment"
	},
	-- big-battery-equipment
	{
		type = "recipe",
		name = "big-battery-equipment",
		energy_required = 15,
		enabled = false,
		ingredients =
		{
			{"battery-equipment", 4},
			{"iron-plate", 4},
			{"copper-plate", 1},
		},
		result = "big-battery-equipment"
    },
	-- big-battery-mk2-equipment
	{
		type = "recipe",
		name = "big-battery-mk2-equipment",
		energy_required = 30,
		enabled = false,
		ingredients =
		{
			{"big-battery-equipment", 2},
			{"steel-plate", 4},
			{"advanced-circuit", 1},
		},
		result = "big-battery-mk2-equipment"
    }, 
	-- big-battery-mk3-equipment
	{
		type = "recipe",
		name = "big-battery-mk3-equipment",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"big-battery-mk2-equipment", 2},
			{"rare-metals", 4},
			{"processing-unit", 1}
		},
		result = "big-battery-mk3-equipment"
    },
	-- -- GENERATORS
	-- small-portable-generator-equipment
	{
		type = "recipe",
		name = "small-portable-generator",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"engine-unit", 1},
			{"iron-beam", 2},
		},
		result = "small-portable-generator"
	},
	-- portable-generator
	{
		type = "recipe",
		name = "portable-generator",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"iron-beam", 2},
			{"engine-unit", 2},
			{"small-portable-generator", 2}
		},
		result = "portable-generator"
	},		
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
}