-- -- KRASTORIO SETTINGS
-- Setting order "[a-z]NUMBER"
data:extend(
{
	-- Mod config (Setting order "aNUMBER")
	{
		type = "int-setting",
		name = "kr-stack-size",
		setting_type = "startup",
		default_value = 200,
        allowed_values = {50, 100, 200, 400},
		order = "a1"
	},
	{
		type = "int-setting",
		name = "kr-long-hands",
		setting_type = "startup",
		default_value = 1,
        allowed_values = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
		order = "a2"
	},
	{
		type = "int-setting",
		name = "kr-bonus-inventory",
		setting_type = "startup",
		default_value = 0,
        allowed_values = {0, 10, 20, 30, 40},
		order = "a3"
	},
	{
		type = "bool-setting",
		name = "kr-bonus-items",
		setting_type = "startup",
		default_value = false,
		order = "a4"
	},
	{
		type = "bool-setting",
		name = "kr-disable-wiki",
		setting_type = "runtime-per-user",
		default_value = false,
		order = "a5"
	},
	{
		type = "bool-setting",
		name = "kr-loaders",
		setting_type = "startup",
		default_value = true,
		order = "a6"
	},
	-- S - Science (Setting order "sNUMBER")
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
    },
	-- Skin content (Setting order "uNUMBER")
	{
        type = "string-setting",
        name = "kr-shelter-tint",
        setting_type = "startup",
        default_value = "White",
        allowed_values = {"White", "Gray", "Yellow", "Pink", "Olive", "Red", "Blue", "Green", "Сyan", "Purple"},
		order = "u01"
	},
	{
        type = "string-setting",
        name = "kr-main-menu-background",
        setting_type = "startup",
        default_value = "Krastorio 2",
        allowed_values = {"Factorio", "Krastorio Legacy", "Krastorio 2", "Krastorio CyberSkull", "Krastorio Chan", "Krastorio Explorer", "Factorio Alternative 1", "Factorio Alternative 2", "Factorio Alternative 3", "Factorio Alternative 4"},
		order = "u02"
    },
	{
		type = "bool-setting",
		name = "kr-main-menu-song",
		setting_type = "startup",
		default_value = true,
		order = "u03"
	},
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
		name = "kr-more-realistic-weapon",
		setting_type = "startup",
		default_value = true,
		order = "b07"
	},
 	{
 		type = "bool-setting",
		name = "kr-more-realistic-weapon-auto-aim",
		setting_type = "startup",
		default_value = false,
		order = "b08"
	},
	{
		type = "bool-setting",
		name = "kr-peaceful-mode",
		setting_type = "startup",
		default_value = false,
		order = "b09"
	},
	{
		type = "bool-setting",
		name = "kr-vehicles-minable-changes",
		setting_type = "startup",
		default_value = false,
		order = "b10"
	},
	{
		type = "bool-setting",
		name = "kr-infinite-technology",
		setting_type = "startup",
		default_value = true,
		order = "b11"
	},
	{
		type = "bool-setting",
		name = "kr-kl-stuff",
		setting_type = "startup",
		default_value = false,
		order = "b12"
	},
})