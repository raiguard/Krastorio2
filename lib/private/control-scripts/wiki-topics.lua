-- Topic format
-- (localized_string_name is only the text name, not the complelty string, so if localized_string is {"iron"}, the name is "iron")
--[[
{
	name  = localized_string,
	topic =
	{
		{type = "title", title = localized_string_name },
		{type = "image", spritename = image_name},
		{type = "text", text = localized_string_name}	
	}
}
]]

return
{
	{
		name  = "gui.about-k2",
		topic =
		{
			{type = "title", title = "gui.about-k2" },
			{type = "image", spritename = "about-k2-preview"},		
			{type = "text", text = "gui.about-k2-description"}
		}
	},
	{
		name  = "gui.shelter",
		topic =
		{
			{type = "title", title = "gui.shelter" },
			{type = "image", spritename = "kr-shelter-preview"},		
			{type = "text", text = "gui.shelter-description-1"}
		}
	},
	{
		name  = "gui.new-gun-play",
		topic =
		{
			{type = "title", title = "gui.new-gun-play" },
			{type = "image", spritename = "kr-new-gun-play-preview"},		
			{type = "text", text = "gui.new-gun-play-description-1"}
		}
	},
	{
		name  = "gui.new-metals",
		topic =
		{
			{type = "title", title = "gui.new-metals" },
			{type = "image", spritename = "new-metals-preview"},		
			{type = "text", text = "gui.rare-metals-description-1"},
			{type = "text", text = "gui.rare-metals-description-2"}
		}
	},
	{
		name  = "gui.creep",
		topic =
		{
			{type = "title", title = "gui.creep" },
			{type = "image", spritename = "kr-creep-preview-1"},		
			{type = "text", text = "gui.creep-description-1"},
			{type = "image", spritename = "kr-creep-preview-2"},
			{type = "text", text = "gui.creep-description-2"}
		}
	},
	{
		name  = "gui.fuels",
		topic =
		{
			{type = "title", title = "gui.fuels" },
			{type = "image", spritename = "kr-fuels-preview"},		
			{type = "text", text = "gui.fuels-description-1"}
		}
	},
	{
		name  = "gui.air-purifier",
		topic =
		{
			{type = "title", title = "gui.air-purifier" },
			{type = "image", spritename = "air-purifier-preview-1"},		
			{type = "text", text = "gui.air-purifier-description-1"},
			{type = "image", spritename = "air-purifier-preview-2"},		
			{type = "text", text = "gui.air-purifier-description-2"}
		}
	},
	{
		name  = "gui.inserters-hotkey",
		topic =
		{
			{type = "title", title = "gui.inserters-hotkey" },
			{type = "image", spritename = "kr-inserters-hotkey-preview"},		
			{type = "text", text = "gui.inserters-krastorio-hotkey-description-1"}
		}
	},
	{
		name  = "gui.roboports-hotkey",
		topic =
		{
			{type = "title", title = "gui.roboports-hotkey" },
			{type = "image", spritename = "roboports-hotkey-preview"},		
			{type = "text", text = "gui.roboports-krastorio-hotkey-description-1"}
		}
	},
	{
		name  = "gui.fusion-reactor",
		topic =
		{
			{type = "title", title = "gui.fusion-reactor" },
			{type = "image", spritename = "kr-fusion-reactor-preview"},		
			{type = "text", text = "gui.fusion-reactor-description-1"},
			{type = "image", spritename = "kr-advanced-steam-turbine-preview"},		
			{type = "text", text = "gui.fusion-reactor-description-2"}
		}
	},
	{
		name  = "gui.matter-of-matter",
		topic =
		{
			{type = "title", title = "gui.matter-of-matter" },
			{type = "image", spritename = "kr-matter-preview"},		
			{type = "text", text = "gui.matter-of-matter-description-1"}
		}
	},
	{
		name  = "gui.intergalactic-transceiver",
		topic =
		{
			{type = "title", title = "gui.intergalactic-transceiver" },
			{type = "image", spritename = "kr-intergalactic-transceiver-preview"},		
			{type = "text", text = "gui.intergalactic-transceiver-description-1"}
		}
	},
	{
		name  = "gui.faq",
		topic =
		{
			{type = "title", title = "gui.faq" },
			{type = "text", text = "gui.faq-description-1"}
		}
	}
}
