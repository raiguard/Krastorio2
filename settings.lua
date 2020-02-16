-- -- KRASTORIO SETTINGS
-- Setting order "[as]NUMBER"
data:extend(
{
	-- A - Config
	{
		type = "bool-setting",
		name = "kr-long-hands",
		setting_type = "startup",
		default_value = false,
		order = "a1"
	},
	{
		type = "bool-setting",
		name = "kr-bonus-inventory",
		setting_type = "startup",
		default_value = false,
		order = "a2"
	},
	{
		type = "bool-setting",
		name = "kr-disable-wiki",
		setting_type = "runtime-per-user",
		default_value = false,
		order = "a3"
	},
	{
		type = "bool-setting",
		name = "kr-loaders",
		setting_type = "startup",
		default_value = true,
		order = "a4"
	},
	-- S - Science
	{
        type = "string-setting",
        name = "kr-automation-science-pack-recipe",
        setting_type = "startup",
        default_value = "Krastorio 2",
        allowed_values = {"Factorio", "Krastorio 2"},
		order = "s1"
    },
	{
        type = "string-setting",
        name = "kr-logistic-science-pack-recipe",
        setting_type = "startup",
        default_value = "Krastorio 2",
        allowed_values = {"Factorio", "Krastorio 2"},
		order = "s2"
    },
	{
        type = "string-setting",
        name = "kr-military-science-pack-recipe",
        setting_type = "startup",
        default_value = "Krastorio 2",
        allowed_values = {"Factorio", "Krastorio 2"},
		order = "s3"
    },
	{
        type = "string-setting",
        name = "kr-chemical-science-pack-recipe",
        setting_type = "startup",
        default_value = "Krastorio 2",
        allowed_values = {"Factorio", "Krastorio 2"},
		order = "s4"
    },
	{
        type = "string-setting",
        name = "kr-production-science-pack-recipe",
        setting_type = "startup",
        default_value = "Krastorio 2",
        allowed_values = {"Factorio", "Krastorio 2"},
		order = "s5"
    },
	{
        type = "string-setting",
        name = "kr-utility-science-pack-recipe",
        setting_type = "startup",
        default_value = "Krastorio 2",
        allowed_values = {"Factorio", "Krastorio 2"},
		order = "s6"
    }
})

-- -- VANILLA CHANGES SETTINGS
-- Setting order "bNUMBER"
data:extend(
{
	-- B - Config
	{
		type = "bool-setting",
		name = "kr-rebalance-vehicles&fuels",
		setting_type = "startup",
		default_value = true,
		order = "b01"
	},
	{
		type = "bool-setting",
		name = "kr-rebalance-radar",
		setting_type = "startup",
		default_value = true,
		order = "b02"
	},
	{
		type = "bool-setting",
		name = "kr-rebalance-fuels",
		setting_type = "startup",
		default_value = true,
		order = "b03"
	},
	{
		type = "bool-setting",
		name = "kr-electric-poles-changes",
		setting_type = "startup",
		default_value = true,
		order = "b04"
	},
	{
		type = "bool-setting",
		name = "kr-stack-size",
		setting_type = "startup",
		default_value = true,
		order = "b05"
	},
	{
		type = "bool-setting",
		name = "kr-damage-and-ammo",
		setting_type = "startup",
		default_value = true,
		order = "b05"
	},
	{
		type = "bool-setting",
		name = "kr-pipes-and-belts-changes",
		setting_type = "startup",
		default_value = true,
		order = "b06"
	},
	{
		type = "bool-setting",
		name = "kr-vehicles-minable-changes",
		setting_type = "startup",
		default_value = false,
		order = "b90"
	},
	{
		type = "bool-setting",
		name = "kr-keep-infinite-technology",
		setting_type = "startup",
		default_value = false,
		order = "b91"
	},
})
