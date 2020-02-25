data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------   

	{
		type = "item",
		name = "biters-research-data",
		icon =  kr_cards_icons_path  .. "biters-research-data.png",
		icon_size = 64,
		subgroup = "science-pack",
		order = "a01[biters-research-data]",
		stack_size = 200
	},
	{
		type = "item",
		name = "matter-research-data",
		icon =  kr_cards_icons_path  .. "matter-research-data.png",
		icon_size = 64,
		subgroup = "science-pack",
		order = "a02[matter-research-data]",
		stack_size = 200
	},
	{
		type = "item",
		name = "space-research-data",
		icon =  kr_cards_icons_path  .. "space-research-data.png",
		icon_size = 64,
		subgroup = "science-pack",
		order = "a03[space-research-data]",
		stack_size = 200
	},
	{
		type = "item",
		name = "singularity-research-data",
		icon =  kr_cards_icons_path  .. "singularity-research-data.png",
		icon_size = 64,
		subgroup = "science-pack",
		order = "a04[singularity-research-data]",
		stack_size = 200
	},
	{
		type = "item",
		name = "tech-card-base-plate",
		icon =  kr_cards_icons_path  .. "base-1.png",
		icon_size = 64,
		icon_mipmaps = 1,
		pictures =
		{
			{ size = 64, filename = kr_cards_icons_path .. "base-1.png",   scale = 0.25, mipmap_count = 1 },
			{ size = 64, filename = kr_cards_icons_path .. "base-2.png", scale = 0.25, mipmap_count = 1 },
			{ size = 64, filename = kr_cards_icons_path .. "base-3.png", scale = 0.25, mipmap_count = 1 }
		},
		subgroup = "science-pack",
		order = "a00[tech-card-base-plate]",
		stack_size = 200
	},

-----------------------------------------------------------------------------------------------------------------
	
	{
		type = "tool",
		name = "basic-tech-card",
		icon =  kr_cards_icons_path  .. "basic-tech-card.png",
		stack_size = 200,
		icon_size = 64,
		subgroup = "science-pack",
		order = "b01[basic-tech-card]",
		durability = 1,
		durability_description_key = "description.science-pack-remaining-amount-key",
		durability_description_value = "description.science-pack-remaining-amount-value"
	},	
	{
		type = "tool",
		name = "matter-tech-card",
		icon =  kr_cards_icons_path  .. "matter-tech-card.png",
		stack_size = 200,
		icon_size = 64,
		subgroup = "science-pack",
		order = "b08[matter-tech-card]",
		durability = 1,
		durability_description_key = "description.science-pack-remaining-amount-key",
		durability_description_value = "description.science-pack-remaining-amount-value"
	},
	{
		type = "tool",
		name = "advanced-tech-card",
		icon =  kr_cards_icons_path  .. "advanced-tech-card.png",
		stack_size = 200,
		icon_size = 64,
		subgroup = "science-pack",
		order = "b10[advanced-tech-card]",
		durability = 1,
		durability_description_key = "description.science-pack-remaining-amount-key",
		durability_description_value = "description.science-pack-remaining-amount-value"
	},	
	{
		type = "tool",
		name = "singularity-tech-card",
		icon =  kr_cards_icons_path  .. "singularity-tech-card.png",
		stack_size = 200,
		icon_size = 64,
		subgroup = "science-pack",
		order = "b11[singularity-tech-card]",
		durability = 1,
		durability_description_key = "description.science-pack-remaining-amount-key",
		durability_description_value = "description.science-pack-remaining-amount-value"
	}	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
