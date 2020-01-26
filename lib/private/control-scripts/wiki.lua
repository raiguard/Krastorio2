require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

local w_prefix = "kr-wiki-"
local topics =
{
	--{"gui.fuel"},
	"Spoiler",
	{"gui.fusion-reactor"},
	"Spoiler",
	"Spoiler",
	"Spoiler",
	"Spoiler",
	"Spoiler"	
}

function showFusionReactorDescription(event)
	local wiki = krastorio.gui.getElementByName(event.player_index, w_prefix.."main-frame")
	if wiki and wiki.valid then
		local wiki_info_pane = krastorio.gui.getElementByName(event.player_index, w_prefix.."info-pane")
		if wiki_info_pane and wiki_info_pane.valid then
			wiki_info_pane.clear()
		
			local description_flow = krastorio.gui.addFlow(wiki_info_pane, 
			{
				name = w_prefix.."description-flow", 
				direction = "vertical",
				style = "kr-wiki-right-window-flow"
			})
			
			-- Title
			local title_label = krastorio.gui.addLabel(description_flow, 
			{
				name    = w_prefix.."description-title", 
				caption = {"gui.fusion-reactor"},
				style   = "bold_label"
			})
			krastorio.gui.addLine(description_flow, 
			{
				name    = w_prefix.."title-line",
				style   = "dark_line"
			})
			
			-- Fusion reactor image
			krastorio.gui.addSprite(description_flow,
			{
				name   = w_prefix.."preview-1", 
				sprite = "kr-fusion-reactor-preview"
			})			
			-- Description 1
			krastorio.gui.addDescription(description_flow,
			{
				name    = w_prefix.."description-1", 
				caption = {"gui.fusion-reactor-description-1"}
			})
			-- Advanced Turbine image
			krastorio.gui.addSprite(description_flow,
			{
				name   = w_prefix.."preview-2", 
				sprite = "kr-advanced-steam-turbine-preview"
			})
			-- Description 2
			krastorio.gui.addDescription(description_flow,
			{
				name    = w_prefix.."description-2", 
				caption = {"gui.fusion-reactor-description-2"}
			})
		end		
	end
end

local topics_gui =
{
	[1] = nil,
	[2] = showFusionReactorDescription
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
	-- Back button
	krastorio.gui.addBackButton(back_button_flow, 
	{
		name    = w_prefix.."close", 
		caption = {"gui.close-wiki"},
		style   = "kr-wiki-back-button"
	})
	
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
	-- main open button
	local player_gui_top = game.players[event.player_index].gui.top
	krastorio.gui.addSpriteButton(player_gui_top, 
	{
		name    = w_prefix.."toggle-wiki",
		tooltip = {"gui.open-wiki-tooltip"},
		sprite  = "kr-open-gui",
		style   = "kr-wiki-icon-button"
	})
	
	-- Callbacks
	krastorio.gui.addClickElementEvent(w_prefix.."toggle-wiki", toggleWiki)	
	krastorio.gui.addClickElementEvent(w_prefix.."close", closeWiki)		
	krastorio.gui.addSelectElementEvent(w_prefix.."topics-list", changeWikiDescription)
end

return
{ 
	-- -- Bootstrap
	{ initializeWiki, "on_player_created" }
}
