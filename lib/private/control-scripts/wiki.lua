require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")
require("__core__/lualib/mod-gui")

-- Global prefix
local w_prefix = "kr-wiki-"
-- Get topics
local topics = require("__Krastorio2__/lib/private/control-scripts/wiki-topics")
--
local topics_names  = {}
local topics_indexs = {}
for i, topic_def in pairs(topics) do
	topics_names[i]  = {topic_def.name}
	topics_indexs[i] = topic_def.topic
end

function getFormattedCaption(text, localized)
	local caption = nil
	if type(text) == "table" and next(text) then
		_, caption = next(text)
	else
		caption = text
	end
	if localized == true then
		return {caption}
	else
		return caption
	end	
end

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

function addTitleToDescrptionGUIPane(pane, title_name, localized)
	if pane then
		if title_name == nil then
			title_name = ""
		end
		if localized == nil then
			localized = true
		end
		-- Title flow
		local title_flow = krastorio.gui.addFlow(pane, 
		{
			name      = w_prefix.."title-flow",
			direction = "horizontal",
			style     = "kr-title-flow"
		})
		-- Title
		krastorio.gui.addLabel(title_flow, 
		{
			name    = w_prefix.."description-title", 
			caption = getFormattedCaption(title_name, localized),
			style   = "bold_label"
		})
		-- Separator line
		krastorio.gui.addLine(pane, 
		{
			name    = w_prefix.."title-line",
			style   = "dark_line"
		})
	end
end

function addTextToDescrptionGUIPane(pane, text_name, localized, index)
	if pane then
		if text_name == nil then
			text_name = ""
		end
		if localized == nil then
			localized = true
		end
		krastorio.gui.addDescription(pane,
		{
			name    = w_prefix.."description-" .. index, 
			caption = getFormattedCaption(text_name, localized)
		})
	end
end

function addImageToDescrptionGUIPane(pane, image_name, index)
	if pane and image_name then
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

function changeWikiDescription(event)
	local list = event.element
	if list and list.valid then	
		local topic = topics_indexs[list.selected_index]
		local wiki_info_pane = getDescrptionGUIPane(event)
		if topic and wiki_info_pane then -- if topic exist and wiki window
			local image_count, texts_count = 0, 0
			local element_type = nil
			local element_localized = nil
			local tilet_added = false
			for _, element in pairs(topic) do
				element_type = element.type or element[1]
				
				if element_type == "title" and not tilet_added then
					-- Add title
					element_localized = true
					if element.localized ~= nil then
						element_localized = element.localized
					elseif element[3] ~= nil then
						element_localized = element[3]
					end
					addTitleToDescrptionGUIPane(wiki_info_pane, element.title or element[2], element_localized)
					tilet_added = true
				elseif element_type == "image" then
					-- Add image
					image_count = image_count + 1
					addImageToDescrptionGUIPane(wiki_info_pane, element.spritename or element[2], image_count)
				elseif element_type == "text" then
					-- Add text
					texts_count = texts_count + 1
					element_localized = true
					if element.localized ~= nil then
						element_localized = element.localized
					elseif element[3] ~= nil then
						element_localized = element[3]
					end
					addTextToDescrptionGUIPane(wiki_info_pane, element.text or element[2], element_localized, texts_count)
				end
			end
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
		items   = topics_names
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

-- Callbacks
krastorio.gui.addClickElementEvent(w_prefix.."toggle-wiki", "toggleWiki")	
krastorio.gui.addClickElementEvent(w_prefix.."close", "closeWiki")		
krastorio.gui.addSelectElementEvent(w_prefix.."topics-list", "changeWikiDescription")

if script.active_mods["Booktorio"] then
	krastorio_thread =
	{
		name = "gui.wiki-name",
		topics = topics
	}
	local function migrateToBooktorio()
		local button = nil
		for _, player in pairs(game.players) do
			button = krastorio.gui.getElementByName(player.index, w_prefix.."toggle-wiki")	
			if button then
				button.parent.destroy()
			end
		end
		remote.call("Booktorio", "add_thread", krastorio_thread) 
	end

	return
	{
		{ migrateToBooktorio, "on_init" }
	}
else
	return
	{ 
		-- -- Bootstrap
		{ initializeWiki, "on_player_created" },
		{ closeWiki, "on_gui_closed" },
		{ addremoveWikiButton, "on_runtime_mod_setting_changed"}
	}
end