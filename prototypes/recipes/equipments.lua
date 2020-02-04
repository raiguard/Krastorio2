-- Recipe for make equipments (armors included)
return
{
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------CHARACTER EQUIPMENTS-------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	-- -- Exoskeletons
	{
		type = "recipe",
		name = "advanced-exoskeleton-equipment",
		enabled = false,
		energy_required = 10,
		ingredients = 
		{
			{"exoskeleton-equipment", 1},
			{"low-density-structure", 10},
			{"advanced-circuit", 10},			
			{"speed-module-2", 10}
		},		
		result = "advanced-exoskeleton-equipment"		
	},
	{
		type = "recipe",
		name = "superior-exoskeleton-equipment",
		enabled = false,
		energy_required = 10,
		ingredients = 
		{
			{"advanced-exoskeleton-equipment", 1},
			{"ai-core", 10},
			{"imersium-plate", 25},
			{"speed-module-3", 10}
		},		
		result = "superior-exoskeleton-equipment"		
	},
	-- -- Imersite night visor
	{
		type = "recipe",
		name = "imersite-night-vision-equipment",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{"night-vision-equipment", 1},
			{"low-density-structure", 10},
			{"advanced-circuit", 10},
			{"imersite-crystal", 5}
		},
		result = "imersite-night-vision-equipment"
	},
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------VEHICLES EQUIPMENTS--------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	{
		type = "recipe",
		name = "additional-engine",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"electric-engine-unit", 2},
			{"electronic-circuit", 5},
			{"steel-plate", 5}
		},
		result = "additional-engine"
    },
	{
		type = "recipe",
		name = "advanced-additional-engine",
		energy_required = 30,
		enabled = false,
		ingredients =
		{
			{"additional-engine", 2},
			{"steel-plate", 5},
			{"processing-unit", 1}			
		},
		result = "advanced-additional-engine"
    },
	{
		type = "recipe",
		name = "vehicle-roboport",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{"personal-roboport-equipment", 2},
			{"steel-plate", 4},
			{"advanced-circuit", 1}
		},
		result = "vehicle-roboport"
	},
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
			{"lithium-sulfur-battery", 2},
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
	-- nuclear-reactor-equipment
	{
		type = "recipe",
		name = "nuclear-reactor-equipment",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"copper-plate", 50},
			{"steel-plate", 50},
			{"advanced-circuit", 50}
		},
		result = "nuclear-reactor-equipment"
	},
	-- antimatter-reactor-equipment
	{
		type = "recipe",
		name = "antimatter-reactor-equipment",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"low-density-structure", 50},
			{"imersium-plate", 100},
			{"ai-core", 25}
		},
		result = "antimatter-reactor-equipment"
	},
	-- -- SOLAR PANELS (GENERATORS)
	{
		type = "recipe",
		name = "big-solar-panel-equipment",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"solar-panel-equipment", 4},
			{"steel-plate", 10}
		},
		result = "big-solar-panel-equipment"
	}
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
}