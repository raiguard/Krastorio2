data:extend(
{
	{
		type = "tips-and-tricks-item-category",
		name = "kr-about-k2",
		order = "a"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-about-k2",
		category = "kr-about-k2",
		order = "a",
		starting_status = "unlocked",
		is_title = true,
		image = kr_graphic_mod_path .. "gui/previews/about-k2-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-shelter",
		order = "a",
		trigger =
		{
			type = "or",
			triggers =
			{
				{
					type   = "build-entity",
					entity = "kr-shelter",
					count  = 1
				},
				{
					type   = "build-entity",
					entity = "kr-shelter-plus",
					count  = 1
				}
			}
		},
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/shelter-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-new-gun-play",
		order = "b",
		trigger =
		{
			type = "or",
			triggers =
			{
				{
					type = "group-attack"
				},
				{
					type = "time-elapsed",
					ticks = 60 * 60 * 135 -- 135 minutes
				}
			}
		},
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/new-gun-play-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-new-metals",
		order = "c",
		starting_status = "unlocked",
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/new-metals-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-creep",
		order = "d",
		trigger = 
		{
			type = "research",
			technology = "military-science-pack"
		},
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/creep-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-fuels",
		order = "e",
		trigger = 
		{
			type = "research",
			technology = "kr-fuel"
		},
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/fuels-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-air-purifier",
		order = "f",
		trigger = 
		{
			type = "research",
			technology = "kr-air-purification"
		},
		category = "kr-about-k2",
		indent = 1
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-inserters-krastorio-hotkey",
		order = "g",
		trigger = 
		{
			type = "or",
			triggers =
			{
				{
					type = "build-entity",
					entity = "burner-inserter",
					count = 1
				},
				{
					type = "build-entity",
					entity = "inserter",
					count = 1
				}
			}
		},
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/inserters-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-roboports-hotkey",
		order = "h",
		trigger = 
		{
			type = "or",
			triggers =
			{
				{
					type = "build-entity",
					entity = "roboport",
					count = 1
				},
				{
					type = "build-entity",
					entity = "kr-small-roboport",
					count = 1
				},
				{
					type = "build-entity",
					entity = "kr-large-roboport",
					count = 1
				}
			}
		},
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/roboports-hotkey-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-fusion-reactor",
		order = "i",
		trigger = 
		{
			type = "research",
			technology = "kr-fusion-energy"
		},
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/fusion-reactor-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-matter-of-matter",
		order = "j",
		trigger = 
		{
			type = "research",
			technology = "kr-matter-processing"
		},
		category = "kr-about-k2",
		indent = 1,
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-intergalactic-transceiver",
		order = "k",
		trigger = 
		{
			type = "research",
			technology = "kr-intergalactic-transceiver"
		},
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/intergalactic-transceiver-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-radiation",
		order = "l",
		starting_status = "unlocked",
		category = "kr-about-k2",
		indent = 1
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-crusher",
		order = "m",
		trigger = 
		{
			type = "research",
			technology = "kr-crusher"
		},
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/crusher-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-wireless-charger",
		order = "n",
		trigger = 
		{
			type = "research",
			technology = "kr-tesla-coil"
		},
		category = "kr-about-k2",
		indent = 1,
		image = kr_graphic_mod_path .. "gui/previews/tesla-coil-preview.png"
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-commands",
		order = "o",
		starting_status = "unlocked",
		category = "kr-about-k2",
		indent = 1
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-achievements",
		order = "p",
		starting_status = "unlocked",
		category = "kr-about-k2",
		indent = 1
	},
	{
		type = "tips-and-tricks-item",
		name = "kr-faq",
		order = "q",
		starting_status = "unlocked",
		category = "kr-about-k2",
		indent = 1
	}
})
