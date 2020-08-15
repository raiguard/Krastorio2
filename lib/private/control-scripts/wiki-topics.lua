local patreons_list = require("__Krastorio2__/lib/private/control-scripts/control-lib/patreon-names")
local text_patreons_list = ""
local line_counter = 0
for _, supporter_name in pairs(patreons_list.getOverallSupportersList()) do
	line_counter = line_counter +1
	if line_counter == 5 then	
		text_patreons_list = text_patreons_list .. supporter_name .. ",\n"
	else
		text_patreons_list = text_patreons_list .. supporter_name .. ", "
	end
end
text_patreons_list = text_patreons_list:sub(1, -2) .. "."

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
		name  = "gui.about-k2-with-icon",
		topic =
		{
			{type = "image", spritename = "about-k2-preview"},		
			{type = "text",  text = "gui.about-k2-description-1"},
			{type = "text",  text = "gui.about-k2-description-2"},
			{type = "text",  text = "gui.about-k2-description-3"},
			{type = "text",  text = text_patreons_list, localized = false}
		}
	},
	{
		name  = "gui.shelter-with-icon",
		topic =
		{
			{type = "title", title = "gui.shelter"},
			{type = "image", spritename = "kr-shelter-preview"},		
			{type = "text",  text = "gui.shelter-description-1"}
		}
	},
	{
		name  = "gui.new-gun-play-with-icon",
		topic =
		{
			{type = "title", title = "gui.new-gun-play" },
			{type = "image", spritename = "kr-new-gun-play-preview"},		
			{type = "text",  text = "gui.new-gun-play-description-1"}
		}
	},
	{
		name  = "gui.new-metals-with-icon",
		topic =
		{
			{type = "title", title = "gui.new-metals" },
			{type = "image", spritename = "new-metals-preview"},		
			{type = "text",  text = "gui.rare-metals-description-1"},
			{type = "text",  text = "gui.rare-metals-description-2"}
		}
	},
	{
		name  = "gui.creep-with-icon",
		topic =
		{
			{type = "title", title = "gui.creep" },
			{type = "image", spritename = "kr-creep-preview-1"},		
			{type = "text",  text = "gui.creep-description-1"},
			{type = "image", spritename = "kr-creep-preview-2"},
			{type = "text",  text = "gui.creep-description-2"}
		}
	},
	{
		name  = "gui.fuels-with-icon",
		topic =
		{
			{type = "title", title = "gui.fuels" },
			{type = "image", spritename = "kr-fuels-preview"},		
			{type = "text",  text = "gui.fuels-description-1"}
		}
	},
	{
		name  = "gui.air-purifier-with-icon",
		topic =
		{
			{type = "title", title = "gui.air-purifier" },
			{type = "image", spritename = "air-purifier-preview-1"},		
			{type = "text",  text = "gui.air-purifier-description-1"},
			{type = "image", spritename = "air-purifier-preview-2"},		
			{type = "text",  text = "gui.air-purifier-description-2"}
		}
	},
	{
		name  = "gui.inserters-hotkey-with-icon",
		topic =
		{
			{type = "title", title = "gui.inserters-hotkey" },
			{type = "image", spritename = "kr-inserters-hotkey-preview"},		
			{type = "text",  text = "gui.inserters-krastorio-hotkey-description-1"}
		}
	},
	{
		name  = "gui.roboports-hotkey-with-icon",
		topic =
		{
			{type = "title", title = "gui.roboports-hotkey" },
			{type = "image", spritename = "roboports-hotkey-preview"},		
			{type = "text",  text = "gui.roboports-krastorio-hotkey-description-1"}
		}
	},
	{
		name  = "gui.fusion-reactor-with-icon",
		topic =
		{
			{type = "title", title = "gui.fusion-reactor" },
			{type = "image", spritename = "kr-fusion-reactor-preview"},		
			{type = "text",  text = "gui.fusion-reactor-description-1"},
			{type = "image", spritename = "kr-advanced-steam-turbine-preview"},		
			{type = "text",  text = "gui.fusion-reactor-description-2"}
		}
	},
	{
		name  = "gui.matter-of-matter-with-icon",
		topic =
		{
			{type = "title", title = "gui.matter-of-matter" },
			{type = "image", spritename = "kr-matter-preview"},		
			{type = "text",  text = "gui.matter-of-matter-description-1"}
		}
	},
	{
		name  = "gui.intergalactic-transceiver-with-icon",
		topic =
		{
			{type = "title", title = "gui.intergalactic-transceiver" },
			{type = "image", spritename = "kr-intergalactic-transceiver-preview"},		
			{type = "text",  text = "gui.intergalactic-transceiver-description-1"}
		}
	},
	{
		name  = "gui.radiation-with-icon",
		topic =
		{
			{type = "title", title = "gui.radiation" },
			{type = "text",  text = "gui.radiation-description-1"}
		}
	},
	{
		name  = "gui.crusher-with-icon",
		topic =
		{
			{type = "title", title = "gui.crusher" },
			{type = "image", spritename = "kr-crusher-preview"},
			{type = "text",  text = "gui.crusher-description-1"}
		}
	},
	{
		name  = "gui.kr-commands-with-icon",
		topic =
		{
			{type = "title", title = "gui.kr-commands" },
			{type = "text",  text = "gui.kr-commands-description-1"}
		}
	},
	{
		name  = "gui.kr-achievements-with-icon",
		topic =
		{
			{type = "title", title = "gui.kr-achievements" },
			{type = "text",  text = "gui.kr-achievements-description-1"}
		}
	},
	{
		name  = "gui.faq-with-icon",
		topic =
		{
			{type = "title", title = "gui.faq" },
			{type = "text",  text = "gui.faq-description-1"},
			{type = "text",  text = "gui.faq-description-2"},
			{type = "text",  text = "gui.faq-description-3"},
			{type = "text",  text = "gui.faq-description-4"}
		}
	}
}
