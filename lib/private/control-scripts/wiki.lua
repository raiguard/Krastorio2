require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")
require("__core__/lualib/mod-gui")

local w_prefix = "kr-wiki-"
local topics =
{
	{"gui.creep"},
	{"gui.fuels"},
	{"gui.fusion-reactor"},
	{"gui.shelter"}
}

function getDescrptionGUIPane(event)
	local wiki = global.krastorio.gui.getElementByName(event.player_index, w_prefix.."main-frame")
	if wiki and wiki.valid then
		local wiki_info_pane = global.krastorio.gui.getElementByName(event.player_index, w_prefix.."info-pane")
		if wiki_info_pane and wiki_info_pane.valid then
			wiki_info_pane.clear()
			return wiki_info_pane
		end
	end
	return nil
end

function showCreepDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		local title_label = global.krastorio.gui.addLabel(wiki_info_pane, 
		{
			name    = w_prefix.."description-title", 
			caption = {"gui.creep"},
			style   = "bold_label"
		})
		global.krastorio.gui.addLine(wiki_info_pane, 
		{
			name    = w_prefix.."title-line",
			style   = "dark_line"
		})
		
		-- Creep image
		global.krastorio.gui.addSprite(wiki_info_pane,
		{
			name   = w_prefix.."preview-1", 
			sprite = "kr-creep-preview"
		})	
		
	end
end

function showFuelsDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		local title_label = global.krastorio.gui.addLabel(wiki_info_pane, 
		{
			name    = w_prefix.."description-title", 
			caption = {"gui.fuels"},
			style   = "bold_label"
		})
		global.krastorio.gui.addLine(wiki_info_pane, 
		{
			name    = w_prefix.."title-line",
			style   = "dark_line"
		})
		
		-- Fuels image
		global.krastorio.gui.addSprite(wiki_info_pane,
		{
			name   = w_prefix.."preview-1", 
			sprite = "kr-fuels-preview"
		})
		
	end
end

function showFusionReactorDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		local title_label = global.krastorio.gui.addLabel(wiki_info_pane, 
		{
			name    = w_prefix.."description-title", 
			caption = {"gui.fusion-reactor"},
			style   = "bold_label"
		})
		global.krastorio.gui.addLine(wiki_info_pane, 
		{
			name    = w_prefix.."title-line",
			style   = "dark_line"
		})
		
		-- Fusion reactor image
		global.krastorio.gui.addSprite(wiki_info_pane,
		{
			name   = w_prefix.."preview-1", 
			sprite = "kr-fusion-reactor-preview"
		})			
		-- Description 1
		global.krastorio.gui.addDescription(wiki_info_pane,
		{
			name    = w_prefix.."description-1", 
			caption = {"gui.fusion-reactor-description-1"}
		})
		-- Advanced Turbine image
		global.krastorio.gui.addSprite(wiki_info_pane,
		{
			name   = w_prefix.."preview-2", 
			sprite = "kr-advanced-steam-turbine-preview"
		})
		-- Description 2
		global.krastorio.gui.addDescription(wiki_info_pane,
		{
			name    = w_prefix.."description-2", 
			caption = {"gui.fusion-reactor-description-2"}
		})
		
	end
end

function showShelterDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		local title_label = global.krastorio.gui.addLabel(wiki_info_pane, 
		{
			name    = w_prefix.."description-title", 
			caption = {"gui.shelter"},
			style   = "bold_label"
		})
		global.krastorio.gui.addLine(wiki_info_pane, 
		{
			name    = w_prefix.."title-line",
			style   = "dark_line"
		})
		
		-- Shelter image
		global.krastorio.gui.addSprite(wiki_info_pane,
		{
			name   = w_prefix.."preview-1", 
			sprite = "kr-shelter-preview"
		})			
		-- Description 1
		global.krastorio.gui.addDescription(wiki_info_pane,
		{
			name    = w_prefix.."description-1", 
			caption = {"gui.shelter-description-1"}
		})
		
	end
end

local topics_gui =
{
	[1] = showCreepDescription,
	[2] = showFuelsDescription,
	[3] = showFusionReactorDescription,
	[4] = showShelterDescription
}

function changeWikiDescription(event)
	local list = event.element
	if list and list.valid then
		if topics_gui[list.selected_index] then
			topics_gui[list.selected_index](event)
		end
	end
end

function createWiki(event)	
	local player_gui_center = game.players[event.player_index].gui.center
	
	-- Window
	local wiki_frame = global.krastorio.gui.addFrame(player_gui_center, 
	{
		name      = w_prefix.."main-frame", 
		caption   = {"gui.wiki-name"},
		direction = "vertical", 
		style     = "kr-wiki-window"
	})
	-- Main Window Container 
	local wiki_main_flow = global.krastorio.gui.addFlow(wiki_frame, 
	{
		name      = w_prefix.."main-flow",
		direction = "horizontal",
		style     = "kr-wiki-window-flow"
	})
	-- Back button section
	local back_button_flow = global.krastorio.gui.addFlow(wiki_frame, 
	{
		name      = w_prefix.."back-button-flow",
		direction = "horizontal",
		style     = "kr-wiki-back-button-flow"
	})
	local inner_back_button_flow = global.krastorio.gui.addFlow(back_button_flow, 
	{
		name      = w_prefix.."inner-back-button-flow",
		direction = "horizontal",
		style     = "horizontal_flow"
	})	
	-- Back button
	global.krastorio.gui.addBackButton(inner_back_button_flow, 
	{
		name    = w_prefix.."close", 
		caption = {"gui.close-wiki"},
		style   = "kr-wiki-back-button"
	})
	--Filler
	global.krastorio.gui.addElement
	(
		back_button_flow,
		"empty-widget",
		w_prefix.."bottom-filler",
		nil,
		nil,
		{ style = "draggable_space_with_no_right_margin" }
	)	
	
	-- -- LEFT
	----------------------------------
	-- Left container
	local left_flow = global.krastorio.gui.addFlow(wiki_main_flow, 
	{
		name      = w_prefix.."left-flow",
		direction = "vertical",
		style     = "kr-wiki-left-window-flow"
	})	
	--Title
	local title_label = global.krastorio.gui.addLabel(left_flow, 
	{
		name    = w_prefix.."list-title", 
		caption = {"gui.topic-list-title"},
		style   = "caption_label"
	})	
	global.krastorio.gui.addLine(left_flow, 
	{
		name    = w_prefix.."title-line"
	})
	-- Topics list
	local wiki_thread_list = global.krastorio.gui.addList(left_flow, 
	{
		name    = w_prefix.."topics-list", 
		items   = topics
	})
	
	-- -- RIGHT
	----------------------------------
	-- Area where show topics
	local wiki_info_pane = global.krastorio.gui.addScrollPane(wiki_main_flow, 
	{
		name                     = w_prefix.."info-pane", 
		horizontal_scroll_policy = "never", 
		vertical_scroll_policy   = "auto-and-reserve-space",
		style                    = "kr-wiki-description-flow"
	})	
	
	local info_label = global.krastorio.gui.addDescription(wiki_info_pane, {name=w_prefix.."info", caption={"gui.info-description"}})	
end

function toggleWiki(event)
	local wiki = global.krastorio.gui.getElementByName(event.player_index, w_prefix.."main-frame")
	if wiki and wiki.valid then
		wiki.destroy()
	else
		createWiki(event)	
	end
end

function closeWiki(event)
	local wiki = global.krastorio.gui.getElementByName(event.player_index, w_prefix.."main-frame")
	if wiki and wiki.valid then
		wiki.destroy()	
	end
end

function initializeWiki(event)
	local settings = game.players[event.player_index].mod_settings
	if settings["kr-disable-wiki"] and settings["kr-disable-wiki"].value then
		return nil
	end
	
	-- main open button
	local button_flow = mod_gui.get_button_flow(game.players[event.player_index])
	global.krastorio.gui.addSpriteButton(button_flow, 
	{
		name    = w_prefix.."toggle-wiki",
		tooltip = {"gui.open-wiki-tooltip"},
		sprite  = "kr-open-gui",
		style   = "kr-wiki-icon-button"
	})
	
	-- Callbacks
	global.krastorio.gui.addClickElementEvent(w_prefix.."toggle-wiki", "toggleWiki")	
	global.krastorio.gui.addClickElementEvent(w_prefix.."close", "closeWiki")		
	global.krastorio.gui.addSelectElementEvent(w_prefix.."topics-list", "changeWikiDescription")
end

function addremoveWikiButton(event)
	if event.setting_type == "runtime-per-user" and event.setting == "kr-disable-wiki" then
		local button = global.krastorio.gui.getElementByName(event.player_index, w_prefix.."toggle-wiki")		
		if game.players[event.player_index].mod_settings["kr-disable-wiki"].value then		
			if button then
				button.parent.destroy()
			end
			local wiki = global.krastorio.gui.getElementByName(event.player_index, w_prefix.."main-frame")
			if wiki then
				wiki.destroy()
			end
		else
			if not button then
				initializeWiki(event)
			end
		end
	end
end

return
{ 
	-- -- Bootstrap
	{ initializeWiki, "on_player_created" },
	{ addremoveWikiButton, "on_runtime_mod_setting_changed"}
}
