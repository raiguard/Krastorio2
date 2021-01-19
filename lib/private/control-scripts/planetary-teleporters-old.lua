require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")
require("__core__/lualib/mod-gui")

local KRASTORIO_PLANETARY_TELEPORTERS_EVENT_FILTER =
{
	-- planetary teleporter entity name
	{
		filter = "name", 
        name   = "kr-planetary-teleporter"
    }
}

local pt_gui_prefix  = "kr-pt-"
local pt_entity_name = "kr-planetary-teleporter"

local function onInitAndConfChange()
	-- Check or inizialize planetary_teleporters
	if not global.planetary_teleporters then
		global.planetary_teleporters = {}
	end
	-- Check or inizialize indexs
	if not global.planetary_teleporter_index then
		global.planetary_teleporter_index = 0
	end
	-- Check or inizialize unused indexes
	if not global.unused_indexes then
		global.unused_indexes = {}
	end
	if not global.last_open_indexes then
		global.last_open_indexes = {}
	end
end

local function teleportTo(player_index, surface, position)
	local fixed_position = surface.find_non_colliding_position({position.x, position.y})
	game.players[player_index].teleport(fixed_position)
end

local function getaFreeIndex()	
	if table_size(global.unused_indexes) > 0 then
		local index, _ = next(global.unused_indexes, nil)
		global.unused_indexes[index] = nil
		return index
	else
		global.planetary_teleporter_index = global.planetary_teleporter_index + 1
		return global.planetary_teleporter_index
	end
end

local function findPlanetaryTeleporter(entity)
	if entity and entity.valid and entity.name == pt_entity_name then
		for index, coordinate in pairs(global.planetary_teleporters) do
			if 
				entity.position.x    == coordinate[2].x and 
				entity.position.y    == coordinate[2].y and
				entity.surface.index == coordinate[1].index
			then
				return index
			end
		end
	end
end

local function getLastOpenIndex(player_index)	
	if not global.last_open_indexes then
		global.last_open_indexes = {}
	end
	if global.last_open_indexes[player_index] then
		return global.last_open_indexes[player_index]
	else
		return -1
	end
end

local function setLastOpenIndex(player_index, index)	
	if not global.last_open_indexes then
		global.last_open_indexes = {}
	end
	global.last_open_indexes[player_index] = index
end

local function onBuiltAnEntity(event)
	local entity = event.created_entity or nil
	if entity and entity.valid and entity.name == pt_entity_name then
		local index = getaFreeIndex()
		global.planetary_teleporters[index] = {entity.surface, entity.position, tostring(index)}
	end
end

local function onRemovingAnEntity(event)
	local entity = event.entity or nil
	
	local index = findPlanetaryTeleporter(entity)
	if index then
		global.planetary_teleporters[index] = nil
		global.unused_indexes[index] = true
	end
end	

local function openSelectionBox(event, entity)	
	local player_gui_screen = game.players[event.player_index].gui.screen
	player_gui_screen.clear()
	
	local pt_index = findPlanetaryTeleporter(entity)
	setLastOpenIndex(event.player_index, pt_index)	
	
	-- Window frame
	local pt_gui_frame = krastorio.gui.addFrame(player_gui_screen, 
	{
		name      = pt_gui_prefix.."main-frame", 
		direction = "vertical",
		style     = "kr-pt-window"
	})	
	-- Title table
	local pt_title_table = krastorio.gui.addTable(pt_gui_frame, 
	{
		name                  = pt_gui_prefix.."title-table",
		direction             = "horizontal",
		column_count          = 9,
		draw_horizontal_lines = false,
		style                 = "kr-title-table"
	})
	-- Frame title
	krastorio.gui.addLabel(pt_title_table, 
	{
		name    = pt_gui_prefix.."title-label", 
		caption = {"gui.kr-planetary-teleporter-title", global.planetary_teleporters[pt_index][3]},
		style   = "kr-title-label"
	})	
	-- Draggable separatator
	krastorio.gui.addEmptyWidget(pt_title_table, 
	{
		name        = pt_gui_prefix.."title-draggable-space", 
		drag_target = pt_gui_frame,
		style       = "kr-title-draggable-space"
	})	
	-- Edit name label
	krastorio.gui.addTextField(pt_title_table, 
	{
		name    = pt_gui_prefix.."edit-textbox", 
		caption = global.planetary_teleporters[pt_index][3],
		visible = false,
		style   = "kr-title-edit-textbox"
	})	
	-- Search name label
	krastorio.gui.addTextField(pt_title_table, 
	{
		name    = pt_gui_prefix.."search-textbox", 
		caption = "",
		visible = false,
		style   = "kr-title-edit-textbox"
	})	
	-- Confirm button
	krastorio.gui.addSpriteButton(pt_title_table,
	{
		name    = pt_gui_prefix.."confirm-button",
		sprite  = "utility/check_mark_white",
		visible = false,
		tooltip = {"gui.kr-planetary-teleporter-confirm-button-tooltip"},
		style   = "kr-top-right-confirm-button"
	})
	-- Reset button
	krastorio.gui.addSpriteButton(pt_title_table,
	{
		name    = pt_gui_prefix.."reset-button",
		sprite  = "utility/reset_white",
		visible = false,
		tooltip = {"gui.kr-planetary-teleporter-reset-button-tooltip"},
		style   = "kr-top-right-button"
	})
	-- Rename button
	krastorio.gui.addSpriteButton(pt_title_table,
	{
		name   = pt_gui_prefix.."rename-button",
		sprite = "utility/rename_icon_small_white",
		tooltip = {"gui.kr-planetary-teleporter-rename-button-tooltip"},
		style  = "kr-top-right-rename-button"
	})
	-- Search button
	krastorio.gui.addSpriteButton(pt_title_table,
	{
		name   = pt_gui_prefix.."search-button",
		sprite = "utility/search_white",
		tooltip = {"gui.kr-planetary-teleporter-search-button-tooltip"},
		style  = "kr-top-right-search-button"
	})
	-- Close button
	krastorio.gui.addSpriteButton(pt_title_table,
	{
		name   = pt_gui_prefix.."close-button",
		sprite = "utility/close_white",
		tooltip = {"gui.kr-planetary-teleporter-close-button-tooltip"},
		style  = "kr-top-right-close-button"
	})	
	
	-- List of teleporters
	local pt_teleporters_table_pane = krastorio.gui.addScrollPane(pt_gui_frame, 
	{
		name                     = pt_gui_prefix.."sp-ts-table", 
		horizontal_scroll_policy = "never", 
		vertical_scroll_policy   = "auto-and-reserve-space",
		style                    = "kr-pt-tps-scroll-pane"
	})	
	local pt_teleporters_table = krastorio.gui.addTable(pt_teleporters_table_pane, 
	{
		name                  = pt_gui_prefix.."ts-table",
		direction             = "horizontal",
		draw_vertical_lines   = false,
		draw_horizontal_lines = false,
		vertical_centering    = true,
		column_count          = 3,
		style                 = "kr-pt-tps-table"
	})
	
	-- Adding teleporters
	for index, coordinate in pairs(global.planetary_teleporters) do
		if index ~= pt_index and (entity.surface.index == coordinate[1].index) then
			local tp_button = krastorio.gui.addTextButton(pt_teleporters_table, 
			{
				name      = pt_gui_prefix.."tp-button-"..index,
				style     = "kr-pt-tp-button"
			})
			local tp_flow = krastorio.gui.addFlow(tp_button, 
			{
				name                   = pt_gui_prefix.."tp-flow-"..index,
				direction              = "vertical",
				ignored_by_interaction = true,
				style                  = "kr-pt-tp-flow"
			})
			krastorio.gui.addLabel(tp_flow, 
			{
				name                   = pt_gui_prefix.."tp-flow-label-"..index, 
				caption                = {"gui.kr-planetary-teleporter-selection-label", coordinate[3]},
				ignored_by_interaction = true,
				style                  = "kr-pt-tp-label"
			})
			krastorio.gui.addCamera(tp_flow, 
			{
				name                   = pt_gui_prefix.."tp-flow-camera-"..index,
				position               = coordinate[2],
				surface_index          = coordinate[1].index,
				zoom                   = 0.5,
				ignored_by_interaction = true,
				style                  = "kr-pt-tp-camera"
			})
			krastorio.gui.addClickElementEvent(pt_gui_prefix.."tp-button-"..index, "teleportToPT")
		end
	end
		
	-- TODO
	-- set entity.energy = 0.0 if teleporter teleport a character or vehicle
	-- choise the position from the available
	-- call teleportTo(player_index, entity.surface, position) and choosen the destination teleport
	
	-- Add window frame to main player opened wiki
	game.players[event.player_index].opened = pt_gui_frame
	-- Call to center the frame when the size will not change anymore (at the end of the function)
	pt_gui_frame.force_auto_center()
	
	-- GUI Callbacks	
	
	-- Buttons
	krastorio.gui.addClickElementEvent(pt_gui_prefix.."rename-button", "modeChangeNamePTGUI")
	krastorio.gui.addClickElementEvent(pt_gui_prefix.."confirm-button", "onChangeNamePTGUI")
	krastorio.gui.addClickElementEvent(pt_gui_prefix.."search-button", "modeSearchTpPTGUI")
	krastorio.gui.addClickElementEvent(pt_gui_prefix.."reset-button", "modeRestoreTitlePTGUI")
	krastorio.gui.addClickElementEvent(pt_gui_prefix.."close-button", "closePTGUI")	
	
	-- Textboxs
	krastorio.gui.addTextElementEvent(pt_gui_prefix.."search-textbox", "onSearchTpPTGUI")
end

local function onGuiOpened(event)
	local entity = event.entity or nil
	if entity and entity.valid and entity.name == "kr-planetary-teleporter" then
		game.print("Intercept gui - kr-planetary-teleporter")
		game.get_player(event.player_index).opened = nil
		
		if entity.energy == entity.prototype.electric_energy_source_prototype.buffer_capacity then 
			openSelectionBox(event, entity)
			game.print("Player open the teleport")
		else
			-- stampato in console solo per i test, poi avrà un fly text
			krastorio.flying_texts.showOnSurfaceText
			{
				entity = entity,
				text   = {"other.kr-planetary-teleporter-charge-error"},
				color  = {1, 0, 0}
			}
		end
	end
end

function closePTGUI(event)
	local pt_gui = krastorio.gui.getElementByName(event.player_index, pt_gui_prefix.."main-frame")
	if pt_gui and pt_gui.valid then
		pt_gui.destroy()	
	end
end

function modeRestoreTitlePTGUI(event)
	local pt_gui_title = krastorio.gui.getElementByName(event.player_index, pt_gui_prefix.."title-table")
	if pt_gui_title and pt_gui_title.valid then
		if pt_gui_title[pt_gui_prefix.."search-textbox"].visible == true then
			modeSearchTpPTGUI(event)
		elseif pt_gui_title[pt_gui_prefix.."edit-textbox"].visible == true then
			modeChangeNamePTGUI(event)
		end
	end
end

function modeChangeNamePTGUI(event)
	local pt_gui_title = krastorio.gui.getElementByName(event.player_index, pt_gui_prefix.."title-table")
	if pt_gui_title and pt_gui_title.valid then
		if pt_gui_title[pt_gui_prefix.."edit-textbox"].visible == false then
			pt_gui_title[pt_gui_prefix.."title-label"].caption    = {"gui.kr-planetary-teleporter-choise-label"}
			pt_gui_title[pt_gui_prefix.."edit-textbox"].visible   = true	
			pt_gui_title[pt_gui_prefix.."search-textbox"].visible = false
			pt_gui_title[pt_gui_prefix.."confirm-button"].visible = true
			pt_gui_title[pt_gui_prefix.."reset-button"].visible   = true
			pt_gui_title[pt_gui_prefix.."rename-button"].visible  = false
			pt_gui_title[pt_gui_prefix.."search-button"].visible  = false
		else
			local pt_index = getLastOpenIndex(event.player_index)
			if pt_index == -1 then
				closePTGUI(event)
			else
				pt_gui_title[pt_gui_prefix.."title-label"].caption = {"gui.kr-planetary-teleporter-title", global.planetary_teleporters[pt_index][3]}
				pt_gui_title[pt_gui_prefix.."edit-textbox"].visible   = false	
				pt_gui_title[pt_gui_prefix.."search-textbox"].visible = false
				pt_gui_title[pt_gui_prefix.."confirm-button"].visible = false
				pt_gui_title[pt_gui_prefix.."reset-button"].visible   = false
				pt_gui_title[pt_gui_prefix.."rename-button"].visible  = true
				pt_gui_title[pt_gui_prefix.."search-button"].visible  = true
			end
		end
	end
end

function onChangeNamePTGUI(event)
	local pt_gui_title = krastorio.gui.getElementByName(event.player_index, pt_gui_prefix.."title-table")
	local pt_gui_edit_textbox = krastorio.gui.getElementByName(event.player_index, pt_gui_prefix.."edit-textbox")
	if pt_gui_title and pt_gui_title.valid and pt_gui_edit_textbox and pt_gui_edit_textbox.valid then
		local pt_index = getLastOpenIndex(event.player_index)
		if pt_index == -1 then
			closePTGUI(event)
		else
			global.planetary_teleporters[pt_index][3] = pt_gui_edit_textbox.text
			-- Update the title
			pt_gui_title[pt_gui_prefix.."title-label"].caption = {"gui.kr-planetary-teleporter-title", pt_gui_edit_textbox.text}
			
			-- Change title mode
			pt_gui_title[pt_gui_prefix.."edit-textbox"].visible   = false	
			pt_gui_title[pt_gui_prefix.."search-textbox"].visible = false
			pt_gui_title[pt_gui_prefix.."confirm-button"].visible = false
			pt_gui_title[pt_gui_prefix.."reset-button"].visible   = false
			pt_gui_title[pt_gui_prefix.."rename-button"].visible  = true
			pt_gui_title[pt_gui_prefix.."search-button"].visible  = true
		end
	end
end

function modeSearchTpPTGUI(event)
	local pt_gui_title = krastorio.gui.getElementByName(event.player_index, pt_gui_prefix.."title-table")
	if pt_gui_title and pt_gui_title.valid then
		if pt_gui_title[pt_gui_prefix.."search-textbox"].visible == false then
			-- Show
			pt_gui_title[pt_gui_prefix.."edit-textbox"].visible   = false	
			pt_gui_title[pt_gui_prefix.."search-textbox"].visible = true
			pt_gui_title[pt_gui_prefix.."confirm-button"].visible = false
			pt_gui_title[pt_gui_prefix.."reset-button"].visible   = true
			pt_gui_title[pt_gui_prefix.."rename-button"].visible  = false
			pt_gui_title[pt_gui_prefix.."search-button"].visible  = false
		else
			-- Hide
			pt_gui_title[pt_gui_prefix.."edit-textbox"].visible   = false	
			pt_gui_title[pt_gui_prefix.."search-textbox"].visible = false
			pt_gui_title[pt_gui_prefix.."confirm-button"].visible = false
			pt_gui_title[pt_gui_prefix.."reset-button"].visible   = false
			pt_gui_title[pt_gui_prefix.."rename-button"].visible  = true
			pt_gui_title[pt_gui_prefix.."search-button"].visible  = true
			
			local pt_gui_tps_table = krastorio.gui.getElementByName(event.player_index, pt_gui_prefix.."ts-table")
			
			if pt_gui_tps_table and pt_gui_tps_table.valid then
				for _, child in pairs(pt_gui_tps_table.children) do
					index = tonumber(string.sub(child.name, 17))
					if global.planetary_teleporters[index] then
						child.visible = true
					else
						child.visible = false
					end
				end
			end
		end
	end
end

function onSearchTpPTGUI(event)
	local pt_gui_tps_table = krastorio.gui.getElementByName(event.player_index, pt_gui_prefix.."ts-table")
	local pt_gui_search_textbox = krastorio.gui.getElementByName(event.player_index, pt_gui_prefix.."search-textbox")
	
	if pt_gui_search_textbox and pt_gui_search_textbox.valid and pt_gui_tps_table and pt_gui_tps_table.valid then
		local index, name = nil, nil
		if pt_gui_search_textbox.text == "" then
			for _, child in pairs(pt_gui_tps_table.children) do
				index = tonumber(string.sub(child.name, 17))
				if global.planetary_teleporters[index] then
					child.visible = true
				else
					child.visible = false
				end
			end
		else			
			for _, child in pairs(pt_gui_tps_table.children) do
				index = tonumber(string.sub(child.name, 17))
				if global.planetary_teleporters[index] then
					if string.find(string.lower(global.planetary_teleporters[index][3]), string.lower(pt_gui_search_textbox.text), 1, true) then
						child.visible = true
					else
						child.visible = false
					end
				else
					child.visible = false
				end
			end
		end
	end
end

function teleportToPT(event)
	local pt_gui = krastorio.gui.getElementByName(event.player_index, pt_gui_prefix.."main-frame")
	local pressed_button = event.element
	if pt_gui and pt_gui.valid and pressed_button and string.find(pressed_button.name, pt_gui_prefix.."tp-button-", 1, true) then
		local pt_index_from = getLastOpenIndex(event.player_index)
		local pt_index_to = tonumber(string.sub(pressed_button.name, 17))
		-- Close gui
		pt_gui.destroy()	
		--Discharge entity		
		local pt_surface = global.planetary_teleporters[pt_index_from][1]
		local pt_entity = pt_surface.find_entity(pt_entity_name, global.planetary_teleporters[pt_index_from][2])
		if pt_entity then
			pt_entity.energy = 0
			-- Teleport player		
			local destination_position = 
			{
				x = global.planetary_teleporters[pt_index_to][2].x,
				y = global.planetary_teleporters[pt_index_to][2].y + 2
			}
			game.players[event.player_index].teleport
			(
				pt_surface.find_non_colliding_position("character", destination_position, 30, 1),
				pt_surface				
			)
			pt_surface.play_sound
			{
				path            = "kr-planetary-teleporter-effect-sound",
				position        = global.planetary_teleporters[pt_index_from][2],
				volume_modifier = 0.8
			}	
			pt_surface.play_sound
			{
				path            = "kr-planetary-teleporter-effect-sound",
				position        = global.planetary_teleporters[pt_index_to][2],
				volume_modifier = 1.0
			}				
		end
	end
end

return
{ 
	-- -- Bootstrap
	-- For setup variables
	{ onInitAndConfChange, "on_init" },
	{ onInitAndConfChange, "on_configuration_changed" },
	-- -- Actions	
	{ onBuiltAnEntity, "on_built_entity",       KRASTORIO_PLANETARY_TELEPORTERS_EVENT_FILTER },
	{ onBuiltAnEntity, "on_robot_built_entity", KRASTORIO_PLANETARY_TELEPORTERS_EVENT_FILTER },
	{ onBuiltAnEntity, "script_raised_built"  },
	{ onBuiltAnEntity, "script_raised_revive" },

	{ onRemovingAnEntity, "on_player_mined_entity", KRASTORIO_PLANETARY_TELEPORTERS_EVENT_FILTER },
	{ onRemovingAnEntity, "on_robot_mined_entity",  KRASTORIO_PLANETARY_TELEPORTERS_EVENT_FILTER },
	{ onRemovingAnEntity, "on_entity_died",         KRASTORIO_PLANETARY_TELEPORTERS_EVENT_FILTER },

	{ onGuiOpened, "on_gui_opened" },
	{ closePTGUI,  "on_gui_closed" }
}
