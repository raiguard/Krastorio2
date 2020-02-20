require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")
require("__core__/lualib/mod-gui")

local w_prefix = "kr-wiki-"
local topics =
{
	{"gui.air-purifier"},
	{"gui.creep"},
	{"gui.fuels"},
	{"gui.fusion-reactor"},
	{"gui.inserters-hotkey"},
	{"gui.intergalactic-transceiver"},
	{"gui.radiation"},
	{"gui.roboports-hotkey"},
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

function addTitleToDescrptionGUIPane(pane, title_name)
	local title_label = global.krastorio.gui.addLabel(pane, 
	{
		name    = w_prefix.."description-title", 
		caption = {title_name},
		style   = "bold_label"
	})
	global.krastorio.gui.addLine(pane, 
	{
		name    = w_prefix.."title-line",
		style   = "dark_line"
	})
end

function addTextToDescrptionGUIPane(pane, text_name, index)
	global.krastorio.gui.addDescription(pane,
	{
		name    = w_prefix.."description-" .. index, 
		caption = {text_name}
	})
end

function addImageToDescrptionGUIPane(pane, image_name, index)
	local image_flow = global.krastorio.gui.addFlow(pane, 
	{
		name      = w_prefix.."image-flow-" .. index,
		direction = "horizontal",
		style     = "kr-wiki-image-flow"
	})
	global.krastorio.gui.addSprite(image_flow,
	{
		name   = w_prefix.."preview-" .. index, 
		sprite = image_name
	})
end

function showAirPurifierDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
	
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.air-purifier")		
		-- Air purifier image
		addImageToDescrptionGUIPane(wiki_info_pane, "air-purifier-preview-1", 1)
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.air-purifier-description-1", 1)
		-- Filter restoration image
		addImageToDescrptionGUIPane(wiki_info_pane, "air-purifier-preview-2", 2)
		-- Description 2
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.air-purifier-description-2", 2)
		
	end
end

function showCreepDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.creep")		
		-- Creep image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-creep-preview", 1)

	end
end

function showFuelsDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.fuels")		
		-- Fuels image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-fuels-preview", 1)
		
	end
end

function showFusionReactorDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.fusion-reactor")		
		-- Fusion reactor image	
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-fusion-reactor-preview", 1)
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.fusion-reactor-description-1", 1)
		-- Advanced Turbine image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-advanced-steam-turbine-preview", 2)
		-- Description 2
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.fusion-reactor-description-2", 2)
		
	end
end

function showInsertersHotkeyDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.inserters-hotkey")
		-- Change inserter drop position image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-inserters-hotkey-preview", 1)
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.inserters-krastorio-hotkey-description-1", 1)
		
	end
end

function showIntergalacticTransceiverDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.intergalactic-transceiver")		
		-- Intergalactic transceiver image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-intergalactic-transceiver-preview", 1)
		
	end
end

function showRadiationDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.radiation")			
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.radiation-description-1", 1)
		
	end
end

function showRoboportsHotkeyDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.roboports-hotkey")
		-- Change roboport mode image
		addImageToDescrptionGUIPane(wiki_info_pane, "roboports-hotkey-preview", 1)
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.roboports-krastorio-hotkey-description-1", 1)
		
	end
end

function showShelterDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.shelter")		
		-- Shelter image	
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-shelter-preview", 1)
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.shelter-description-1", 1)
		
	end
end

local topics_gui =
{
	[1] = showAirPurifierDescription,
	[2] = showCreepDescription,
	[3] = showFuelsDescription,
	[4] = showFusionReactorDescription,
	[5]	= showInsertersHotkeyDescription,
	[6] = showIntergalacticTransceiverDescription,
	[7] = showRadiationDescription,
	[8]	= showRoboportsHotkeyDescription,
	[9] = showShelterDescription
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
