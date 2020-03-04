require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")
require("__core__/lualib/mod-gui")

local w_prefix = "kr-wiki-"
local topics =
{
	{"gui.about-k2"},
	{"gui.shelter"},
	{"gui.new-gun-play"},
	{"gui.new-metals"},
	{"gui.creep"},
	{"gui.fuels"},
	{"gui.radiation"},
	{"gui.air-purifier"},
	{"gui.inserters-hotkey"},
	{"gui.roboports-hotkey"},
	{"gui.fusion-reactor"},
	{"gui.matter-of-matter"},
	{"gui.intergalactic-transceiver"},
	{"gui.faq"},


}

function getDescrptionGUIPane(event)
	local wiki = krastorio.gui.getElementByName(event.player_index, w_prefix.."main-frame")
	if wiki and wiki.valid then
		local wiki_info_pane = krastorio.gui.getElementByName(event.player_index, w_prefix.."info-pane")
		if wiki_info_pane and wiki_info_pane.valid then
			wiki_info_pane.clear()
			return wiki_info_pane
		end
	end
	return nil
end

function addTitleToDescrptionGUIPane(pane, title_name)
	local title_label = krastorio.gui.addLabel(pane, 
	{
		name    = w_prefix.."description-title", 
		caption = {title_name},
		style   = "bold_label"
	})
	krastorio.gui.addLine(pane, 
	{
		name    = w_prefix.."title-line",
		style   = "dark_line"
	})
end

function addTextToDescrptionGUIPane(pane, text_name, index)
	krastorio.gui.addDescription(pane,
	{
		name    = w_prefix.."description-" .. index, 
		caption = {text_name}
	})
end

function addImageToDescrptionGUIPane(pane, image_name, index)
	local image_flow = krastorio.gui.addFlow(pane, 
	{
		name      = w_prefix.."image-flow-" .. index,
		direction = "horizontal",
		style     = "kr-wiki-image-flow"
	})
	krastorio.gui.addSprite(image_flow,
	{
		name   = w_prefix.."preview-" .. index, 
		sprite = image_name
	})
end

function getPlayerDisplayResolution(event)
	local player = game.players[event.player_index]
	if player and player.valid then
		return player.display_resolution
	end
end

function getResolutionMultiplier(display_resolution)
	local multiplier = 1.0
	if display_resolution.width > 2560 then
		multiplier = 1.2
	elseif display_resolution.width > 1920 then
		multiplier = 0.8
	else
		multiplier = 0.6
	end
	return multiplier
end

function showAbout_K2Description(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
	
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.about-k2")		
		-- About K2 image
		addImageToDescrptionGUIPane(wiki_info_pane, "about-k2-preview", 1)
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.about-k2-description", 1)
		
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

function showNewGunPlay(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.new-gun-play")			
		-- NewGunPlay icon image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-new-gun-play-preview", 1)	
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.new-gun-play-description-1", 1)
		
	end
end

function showNewMetals(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.new-metals")			
		-- NewMetals icon image
		addImageToDescrptionGUIPane(wiki_info_pane, "new-metals-preview", 1)	
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.rare-metals-description-1", 1)
		-- Description 2
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.rare-metals-description-2", 2)
		
	end
end

function showCreepDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.creep")		
		-- Creep image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-creep-preview-1", 1)
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.creep-description-1", 1)	
		-- Biolab image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-creep-preview-2", 2)
		-- Description 2
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.creep-description-2", 2)

	end
end

function showFuelsDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.fuels")		
		-- Fuels image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-fuels-preview", 1)
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.fuels-description-1", 1)
	
	end
end

function showRadiationDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.radiation")		
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.radiation-description", 1)
	
	end
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

function showMatterOfMatter(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.matter-of-matter")	
		-- Matter icon image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-matter-preview", 1)		
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.matter-of-matter-description-1", 1)
		
	end
end

function showIntergalacticTransceiverDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.intergalactic-transceiver")		
		-- Intergalactic transceiver image
		addImageToDescrptionGUIPane(wiki_info_pane, "kr-intergalactic-transceiver-preview", 1)
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.intergalactic-transceiver-description-1", 1)
		
	end
end

function showFAQDescription(event)
	local wiki_info_pane = getDescrptionGUIPane(event)
	if wiki_info_pane then
		
		-- Title
		addTitleToDescrptionGUIPane(wiki_info_pane, "gui.faq")			
		-- Description 1
		addTextToDescrptionGUIPane(wiki_info_pane, "gui.faq-description-1", 1)
		
	end
end

local topics_gui =
{

	[1]  = showAbout_K2Description,
	[2]  = showShelterDescription,
	[3]  = showNewGunPlay,
	[4]  = showNewMetals,
	[5]  = showCreepDescription,
	[6]  = showFuelsDescription,
	[7]  = showRadiationDescription,
	[8]  = showAirPurifierDescription,
	[9]	 = showInsertersHotkeyDescription,
	[10] = showRoboportsHotkeyDescription,
	[11] = showFusionReactorDescription,
	[12] = showMatterOfMatter,
	[13] = showIntergalacticTransceiverDescription,
	[14] = showFAQDescription,
	
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
	local wiki_frame = krastorio.gui.addFrame(player_gui_center, 
	{
		name      = w_prefix.."main-frame", 
		caption   = {"gui.wiki-name"},
		direction = "vertical", 
		style     = "kr-wiki-window"
	})
	-- Main Window Container 
	local wiki_main_flow = krastorio.gui.addFlow(wiki_frame, 
	{
		name      = w_prefix.."main-flow",
		direction = "horizontal",
		style     = "kr-wiki-window-flow"
	})
	-- Back button section
	local back_button_flow = krastorio.gui.addFlow(wiki_frame, 
	{
		name      = w_prefix.."back-button-flow",
		direction = "horizontal",
		style     = "kr-wiki-back-button-flow"
	})
	local inner_back_button_flow = krastorio.gui.addFlow(back_button_flow, 
	{
		name      = w_prefix.."inner-back-button-flow",
		direction = "horizontal",
		style     = "horizontal_flow"
	})	
	-- Back button
	krastorio.gui.addBackButton(inner_back_button_flow, 
	{
		name    = w_prefix.."close", 
		caption = {"gui.close-wiki"},
		style   = "kr-wiki-back-button"
	})
	--Filler
	krastorio.gui.addElement
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
	local left_flow = krastorio.gui.addFlow(wiki_main_flow, 
	{
		name      = w_prefix.."left-flow",
		direction = "vertical",
		style     = "kr-wiki-left-window-flow"
	})	
	--Title
	local title_label = krastorio.gui.addLabel(left_flow, 
	{
		name    = w_prefix.."list-title", 
		caption = {"gui.topic-list-title"},
		style   = "caption_label"
	})	
	krastorio.gui.addLine(left_flow, 
	{
		name    = w_prefix.."title-line"
	})
	-- Topics list
	local wiki_thread_list = krastorio.gui.addList(left_flow, 
	{
		name    = w_prefix.."topics-list", 
		items   = topics
	})
	
	-- -- RIGHT
	----------------------------------
	-- Area where show topics
	local wiki_info_pane = krastorio.gui.addScrollPane(wiki_main_flow, 
	{
		name                     = w_prefix.."info-pane", 
		horizontal_scroll_policy = "never", 
		vertical_scroll_policy   = "auto-and-reserve-space",
		style                    = "kr-wiki-description-flow"
	})	
	
	local info_label = krastorio.gui.addDescription(wiki_info_pane, {name=w_prefix.."info", caption={"gui.info-description"}})	
	
	-- Add window frame to main player opened wiki
	game.players[event.player_index].opened =	wiki_frame
end

function toggleWiki(event)
	local wiki = krastorio.gui.getElementByName(event.player_index, w_prefix.."main-frame")
	if wiki and wiki.valid then
		wiki.destroy()
	else
		createWiki(event)	
	end
end

function closeWiki(event)
	local wiki = krastorio.gui.getElementByName(event.player_index, w_prefix.."main-frame")
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
	krastorio.gui.addSpriteButton(button_flow, 
	{
		name    = w_prefix.."toggle-wiki",
		tooltip = {"gui.open-wiki-tooltip"},
		sprite  = "kr-open-gui",
		style   = "kr-wiki-icon-button"
	})
	
	-- Callbacks
	krastorio.gui.addClickElementEvent(w_prefix.."toggle-wiki", "toggleWiki")	
	krastorio.gui.addClickElementEvent(w_prefix.."close", "closeWiki")		
	krastorio.gui.addSelectElementEvent(w_prefix.."topics-list", "changeWikiDescription")
end

function addremoveWikiButton(event)
	if event.setting_type == "runtime-per-user" and event.setting == "kr-disable-wiki" then
		local button = krastorio.gui.getElementByName(event.player_index, w_prefix.."toggle-wiki")		
		if game.players[event.player_index].mod_settings["kr-disable-wiki"].value then		
			if button then
				button.parent.destroy()
			end
			local wiki = krastorio.gui.getElementByName(event.player_index, w_prefix.."main-frame")
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
	{ closeWiki, "on_gui_closed" },
	{ addremoveWikiButton, "on_runtime_mod_setting_changed"}
}
