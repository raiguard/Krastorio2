-------------------------------------------------------------

if not global.krastorio.gui then
	global.krastorio.gui = {}
end
if not global.krastorio.gui.click_events then
	global.krastorio.gui.click_events = {}
end
if not global.krastorio.gui.select_events then
	global.krastorio.gui.select_events = {}
end

if not krastorio then
	krastorio = {}
end
if not krastorio.gui then
	krastorio.gui = {}
end

-------------------------------------------------------------
-- -- Local functions
-------------------------------------------------------------

function krastorio.gui.getOthersTable(name, caption, tooltip, others)
	if type(name) == "table" then
		others = name
		name = others.name
	elseif type(caption) == "table" then 
		others = caption
		caption = others.caption
	elseif type(tooltip) == "table" then 
		others = tooltip
		tooltip = others.tooltip
	elseif not others then
		others = {}
	end
	return others
end

function krastorio.gui.getElementNameFromEvent(event)
	return event.element.name
end

-------------------------------------------------------------
-- -- Global pointers
-------------------------------------------------------------

function krastorio.gui.inizializePointers(player_index)
	if not global.gui then
		global.gui = {}
		global.gui.pointers = {}
		global.gui.pointers[player_index] = {}
	elseif not global.gui.pointers[player_index] then
		global.gui.pointers[player_index] = {}
	end
end

function krastorio.gui.getElementByName(player_index, name)
	krastorio.gui.inizializePointers(player_index)
	if global.gui.pointers[player_index][name] and global.gui.pointers[player_index][name].valid then
		return global.gui.pointers[player_index][name]
	end
	return nil
end

function krastorio.gui.setElementByName(player_index, element, name)
	krastorio.gui.inizializePointers(player_index)
	if element and element.valid then
		name = name or element.name
		global.gui.pointers[player_index][name] = element
	end
end

-------------------------------------------------------------
-- -- Add/Create elements
-------------------------------------------------------------

-- -- General

function krastorio.gui.addElement(parent, e_type, name, caption, tooltip, others)
	if parent and parent.valid then	
	
		-- construct the element
		local element = {}
		element.type    = others.type or e_type
		element.name    = others.name or name
		element.caption = others.caption or caption
		element.tooltip = others.tooltip or tooltip
		element.enabled = others.enabled
		element.ignored_by_interaction = others.ignored_by_interaction
		element.style = others.style
		
		-- Button
		if element.type == "button" then
			element.mouse_button_filter = others.mouse_button_filter 
		end
		
		-- Sprite button
		if element.type == "sprite-button" then
			element.sprite = others.sprite
			element.hovered_sprite = others.hovered_sprite
			element.clicked_sprite = others.clicked_sprite
			element.number = others.number
			element.show_percent_for_small_numbers = others.show_percent_for_small_numbers
			element.mouse_button_filter = others.mouse_button_filter
		end
		
		-- Flow
		if element.type == "flow" then
			element.direction  = others.direction 
		end
		
		-- Frame
		if element.type == "frame" then
			element.direction = others.direction 
		end
		
		-- Table
		if element.type == "table" then
			element.column_count = others.column_count 
			element.draw_vertical_lines = others.draw_vertical_lines
			element.draw_horizontal_lines = others.draw_horizontal_lines
			element.draw_horizontal_line_after_headers = others.draw_horizontal_line_after_headers
			element.vertical_centering = others.vertical_centering
		end
		
		-- Textfield
		if element.type == "textfield" then
			element.text = others.text 
			element.numeric = others.numeric 
			element.allow_decimal = others.allow_decimal 
			element.allow_negative = others.allow_negative 
			element.is_password = others.is_password 
			element.lose_focus_on_confirm = others.lose_focus_on_confirm 
			element.clear_and_focus_on_right_click = others.clear_and_focus_on_right_click
		end
		
		-- Progressbar
		if element.type == "progressbar" then
			element.value = others.value or 0
		end
		
		-- Checkbox
		if element.type == "checkbox" then
			element.state = others.state or false
		end
		
		-- Radiobutton
		if element.type == "radiobutton" then
			element.value = others.value
		end
		
		-- Sprite
		if element.type == "sprite" then
			element.sprite = others.sprite
		end
		
		-- Scroll pane
		if element.type == "scroll-pane" then
			element.horizontal_scroll_policy = others.horizontal_scroll_policy
			element.vertical_scroll_policy = others.vertical_scroll_policy
		end
		
		-- Drop down
		if element.type == "drop-down" then
			element.items = others.items
			element.selected_index = others.selected_index
		end
		
		-- Line
		if element.type == "line" then
			element.direction = others.direction
		end
		
		-- List box
		if element.type == "list-box" then
			element.items = others.items
			element.selected_index = others.selected_index
		end
		
		-- Camera
		if element.type == "camera" then
			element.position = others.position
			element.surface_index = others.surface_index
			element.zoom = others.zoom
		end
		
		-- Choose elem button
		if element.type == "choose-elem-button" then
			element.elem_type = others.elem_type
			element.item = others.item
			element.tile = others.tile
			element.entity = others.entity
			element.signal = others.signal
			element.fluid = others.fluid
			element.recipe = others.recipe
			element.decorative = others.decorative
			element["item-group"] = others["item-group"]
			element.achievement = others.achievement
			element.equipment = others.equipment
			element.technology = others.technology
		end
		
		-- Text box
		if element.type == "text-box" then
			element.text = others.text
			element.clear_and_focus_on_right_click = others.clear_and_focus_on_right_click
		end
		
		-- Slider
		if element.type == "slider" then
			element.minimum_value = others.minimum_value
			element.maximum_value = others.maximum_value
			element.value = others.value
			element.value_step = others.value_step
			element.discrete_slider = others.discrete_slider
			element.discrete_values = others.discrete_values
		end
		
		-- Minimap
		if element.type == "minimap" then
			element.position = others.position
			element.surface_index = others.surface_index
			element.chart_player_index = others.chart_player_index
			element.force = others.force
			element.zoom = others.zoom
		end
		
		-- Tab
		if element.type == "tab" then
			element.badge_text = others.badge_text
		end
		
		-- Switch
		if element.type == "switch" then
			element.switch_state = others.switch_state
			element.allow_none_state = others.allow_none_state
			element.left_label_caption = others.left_label_caption
			element.left_label_tooltip = others.left_label_tooltip
			element.right_label_caption = others.right_label_caption
			element.right_label_tooltip = others.right_label_tooltip
		end		
		
		-- add the element		
		element = parent.add(element)
		krastorio.gui.setElementByName(element.player_index, element)
		
		return element
		
	end
	return nil
end

-- -- Sections/Elements-Containers

function krastorio.gui.addMenu(parent, name, caption, others)
	others = krastorio.gui.getOthersTable(name, caption, nil, others)
	others.style = others.style or "menu_frame"
	return krastorio.gui.addElement(parent, "frame", name, caption, nil, others)
end

function krastorio.gui.addFrame(parent, name, caption, others)
	others = krastorio.gui.getOthersTable(name, caption, nil, others)
	others.style = others.style or nil
	return krastorio.gui.addElement(parent, "frame", name, caption, nil, others)
end

function krastorio.gui.addFlow(parent, name, caption, others)
	others = krastorio.gui.getOthersTable(name, caption, nil, others)
	others.style = others.style or "flow"
	return krastorio.gui.addElement(parent, "flow", name, caption, nil, others)
end

function krastorio.gui.addPane(parent, name, caption, others)
	others = krastorio.gui.getOthersTable(name, caption, nil, others)
	others.style = others.style or "tabbed_pane"
	return krastorio.gui.addElement(parent, "tabbed-pane", name, caption, nil, others)
end

function krastorio.gui.addScrollPane(parent, name, caption, others)
	others = krastorio.gui.getOthersTable(name, caption, nil, others)
	others.style = others.style or "changelog_scroll_pane"
	return krastorio.gui.addElement(parent, "scroll-pane", name, caption, nil, others)
end

function krastorio.gui.addTab(parent, name, caption, others)
	others = krastorio.gui.getOthersTable(name, caption, nil, others)
	others.style = others.style or "tab"
	return krastorio.gui.addElement(parent, "tab", name, caption, nil, others)
end

function krastorio.gui.addTable(parent, name, caption, column_count, others)
	others = krastorio.gui.getOthersTable(name, caption, nil, others)
	others.style = others.style or "removed_content_table"
	others.column_count = column_count or others.column_count or 1
	return krastorio.gui.addElement(parent, "table", name, caption, nil, others)
end

function krastorio.gui.addDropDown(parent, name, caption, others)
	others = krastorio.gui.getOthersTable(name, caption, nil, others)
	others.style = others.style or "dropdown"
	return krastorio.gui.addElement(parent, "drop-down", name, caption, nil, others)
end

function krastorio.gui.addList(parent, name, caption, others)
	others = krastorio.gui.getOthersTable(name, caption, nil, others)
	others.style = others.style or "list_box"
	return krastorio.gui.addElement(parent, "list-box", name, caption, nil, others)
end

-- -- Texts

function krastorio.gui.addLabel(parent, name, caption, tooltip, others)
	others = krastorio.gui.getOthersTable(name, caption, tooltip, others)
	others.style = others.style or "label"
	return krastorio.gui.addElement(parent, "label", name, caption, tooltip, others)
end

function krastorio.gui.addDescription(parent, name, caption, tooltip, others)
	others = krastorio.gui.getOthersTable(name, caption, tooltip, others)
	others.style = others.style or "kr-wiki-description-label"
	return krastorio.gui.addElement(parent, "label", name, caption, tooltip, others)
end

-- -- Buttons

function krastorio.gui.addTextButton(parent, name, caption, tooltip, others)
	others = krastorio.gui.getOthersTable(name, caption, tooltip, others)
	others.style = others.style or "button"
	return krastorio.gui.addElement(parent, "button", name, caption, tooltip, others)
end

function krastorio.gui.addConfirmButton(parent, name, caption, tooltip, others)
	others = krastorio.gui.getOthersTable(name, caption, tooltip, others)
	others.style = others.style or "confirm_button"
	return krastorio.gui.addElement(parent, "button", name, caption, tooltip, others)
end

function krastorio.gui.addBackButton(parent, name, caption, tooltip, others)
	others = krastorio.gui.getOthersTable(name, caption, tooltip, others)
	others.style = others.style or "red_back_button"
	return krastorio.gui.addElement(parent, "button", name, caption, tooltip, others)
end

function krastorio.gui.addSpriteButton(parent, name, sprite, tooltip, others)
	others = krastorio.gui.getOthersTable(name, nil, tooltip, others)
	others.sprite = others.sprite or sprite
	others.style  = others.style or "button"
	return krastorio.gui.addElement(parent, "sprite-button", name, nil, tooltip, others)
end

-- -- Lines
function krastorio.gui.addLine(parent, name, direction, others)
	others = krastorio.gui.getOthersTable(name, nil, nil, others)
	others.direction = direction or others.direction or "horizontal"
	others.style = others.style or "line"
	return krastorio.gui.addElement(parent, "line", name, nil, tooltip, others)
end

-- Sprite
function krastorio.gui.addSprite(parent, name, sprite, others)
	others = krastorio.gui.getOthersTable(name, nil, nil, others)
	others.sprite = others.sprite or sprite
	others.style = others.style or nil
	return krastorio.gui.addElement(parent, "sprite", name, nil, nil, others)
end

-------------------------------------------------------------
-- -- Events
-------------------------------------------------------------

function krastorio.gui.addClickElementEvent(element_name, callback_name)
	if type(callback_name) == "string" then 
		if type(element_name) == "table" then
			element_name = element_name.name
		end 
		global.krastorio.gui.click_events[element_name] = callback_name
	end
end

function krastorio.gui.getCollectiveClickEventsCallback()
	return 
	function(...)
		local called_element_name = krastorio.gui.getElementNameFromEvent(...)
		for element_name, callback in pairs(global.krastorio.gui.click_events) do
			if called_element_name == element_name then 
				_ENV[callback](...)
			end
		end
	end
end

function krastorio.gui.addSelectElementEvent(element_name, callback_name)
	if type(callback_name) == "string" then
		if type(element_name) == "table" then
			element_name = element_name.name
		end 
		global.krastorio.gui.select_events[element_name] = callback_name
	end
end

function krastorio.gui.getCollectiveSelectEventsCallback()
	return 
	function(...)
		local called_element_name = krastorio.gui.getElementNameFromEvent(...)
		for element_name, callback in pairs(global.krastorio.gui.select_events) do
			if called_element_name == element_name then 
				_ENV[callback](...)
			end
		end
	end
end

-------------------------------------------------------------