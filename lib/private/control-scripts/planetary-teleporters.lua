require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

local gui = require("__Krastorio2__/lib/private/control-scripts/control-lib/flib/gui-beta")

local pt_built_entity_filters = {{filter = "name", name = "kr-planetary-teleporter"}}
local pt_entity_name = "kr-planetary-teleporter"

local function teleport_player(player, from, to)
	-- discharge source entity
	from.energy = 0
	-- teleport player
	local position = to.position
	position.y = position.y + 2
	player.teleport(to.surface.find_non_colliding_position("character", position, 30, 1), to.surface)
	-- play sounds
	from.surface.play_sound{
		path = "kr-planetary-teleporter-effect-sound",
		position = from.position,
		volume_modifier = 0.8
	}
	to.surface.play_sound{
		path = "kr-planetary-teleporter-effect-sound",
		position = to.position,
		volume_modifier = 1
	}
end

-- GUI

local status_labels = {}
for label, i in pairs(defines.entity_status) do
	status_labels[i] = string.gsub(label, "_", "-")
end

local status_images = {
	[defines.entity_status.charging] = "status_yellow",
	[defines.entity_status.disabled_by_script] = "status_not_working",
	[defines.entity_status.discharging] = "status_not_working",
	[defines.entity_status.low_power] = "status_not_working",
	[defines.entity_status.no_power] = "status_not_working"
}

local function update_fully_charged(refs, state)
	local fully_charged = state.fully_charged
	for _, destination_frame in ipairs(refs.destinations_table.children) do
		destination_frame.children[1].ignored_by_interaction = not fully_charged
	end
	if fully_charged then
		refs.name_label.style = "subheader_caption_label"
		refs.toolbar.style = "subheader_frame"
		refs.toolbar.low_power_label.visible = false
	else
		refs.name_label.style = "kr_subheader_bold_label"
		refs.toolbar.style = "negative_subheader_frame"
		refs.toolbar.low_power_label.visible = true
	end
end

local function update_gui_statuses()
	for _, gui_data in pairs(global.planetary_teleporter_guis) do
		local refs = gui_data.refs
		local state = gui_data.state
		local entity = state.entity
		local status = entity.status
		if status == defines.entity_status.charging or status == defines.entity_status.discharging then
			local percent_full = (entity.energy / entity.prototype.electric_energy_source_prototype.buffer_capacity) * 100
			refs.status_label.caption = {"", {"entity-status."..status_labels[status]}, " - "..math.floor(percent_full).."%"}
		else
			refs.status_label.caption = {"entity-status."..status_labels[status]}
		end
		refs.status_image.sprite = "utility/"..(status_images[status] or "status_working")

		if
			(status == defines.entity_status.fully_charged and not state.fully_charged)
			or (status ~= defines.entity_status.fully_charged and state.fully_charged)
		then
			state.fully_charged = not state.fully_charged
			update_fully_charged(refs, state)
		end
	end
end

local function get_distance(pos1, pos2)
	return math.sqrt((pos1.x - pos2.x) ^ 2 + (pos1.y - pos2.y) ^ 2)
end

local function update_destinations_table(refs, state)
	local destinations_table = refs.destinations_table
	local children = destinations_table.children
	local query = state.search_query

	local force = state.player.force
	local force_name = force.name
	local unit_number = state.entity.unit_number
	local player_index = state.player.index
	local position = state.entity.position
	local surface = state.entity.surface
	local unnamed_str = global.planetary_teleporter_unnamed_translations[player_index]

	local i = 0
	for destination_number, data in pairs(global.planetary_teleporters) do
		local name = data.name or unnamed_str
		if
			destination_number ~= unit_number
			and data.force == force
			and data.surface == surface
			and (query == "" or string.find(string.lower(name), query, 1, true))
		then
			i = i + 1
			local destination_frame = children[i]
			if not destination_frame then
				local destination_refs = gui.build(destinations_table, {
					{type = "frame", style = "train_with_minimap_frame", direction = "vertical", ref = {"frame"}, children = {
						{type = "frame", style = "deep_frame_in_shallow_frame", children = {
							{
								type = "minimap",
								style = "kr_planetary_teleporter_destination_minimap",
								chart_player_index = player_index,
								force = force_name,
								zoom = 1.5,
								children = {
									{
										type = "button",
										style = "kr_planetary_teleporter_destination_minimap_button",
										tooltip = {"gui.kr-planetary-teleporter-teleport-tooltip"},
										actions = {
											on_click = {gui = "planetary_teleporter", action = "teleport"}
										}
									}
								}
							}
						}},
						{type = "frame", style = "deep_frame_in_shallow_frame", children = {
							{
								type = "button",
								style = "kr_planetary_teleporter_destination_name_button",
								tooltip = {"gui.kr-planetary-teleporter-teleport"},
								enabled = false
							}
						}}
					}}
				})
				destination_frame = destination_refs.frame
			end

			local distance = math.ceil(get_distance(position, data.position))
			local name_and_distance = {"gui.kr-planetary-teleporter-name-and-distance", data.name or unnamed_str, distance}

			gui.update(
				destination_frame,
				{children = {
					{children = {
						{
							elem_mods = {
								position = data.position
							},
							children = {
								{cb = function(elem)
									gui.update_tags(elem, {number = destination_number})
								end},
							}
						}
					}},
					{children = {
						{elem_mods = {
							caption = name_and_distance,
							tooltip = name_and_distance
						}}
					}}
				}}
			)
		end
	end

	for j = i + 1, #children do
		children[j].destroy()
	end

	if i > 0 then
		refs.no_destinations_frame.visible = false
	else
		refs.no_destinations_frame.visible = true
	end
end

local function handle_gui_action(msg, e)
	local player = game.get_player(e.player_index)
	local gui_data = global.planetary_teleporter_guis[e.player_index]
	local refs = gui_data.refs
	local state = gui_data.state

	if msg.action == "close" then
		if player.opened == refs.window then
			player.opened = nil
		end
		refs.window.destroy()
		global.planetary_teleporter_guis[e.player_index] = nil
		player.play_sound{
			path = "entity-close/kr-planetary-teleporter"
		}
	elseif msg.action == "toggle_search" then
		local textfield = refs.search_textfield
		local search_button = refs.search_button
		if textfield.visible then
			search_button.style = "frame_action_button"
			search_button.sprite = "utility/search_white"
			textfield.visible = false
			textfield.text = ""
			state.search_query = ""
			update_destinations_table(refs, state)
		else
			search_button.style = "kr_selected_frame_action_button"
			search_button.sprite = "utility/search_black"
			textfield.visible = true
			textfield.focus()
		end
	elseif msg.action == "update_search_query" then
		state.search_query = e.text
		update_destinations_table(refs, state)
	elseif msg.action == "toggle_rename" then
		local textfield = refs.name_textfield
		local label = refs.name_label
		if textfield.visible then
			textfield.visible = false
			label.caption = state.entity_data.name or global.planetary_teleporter_unnamed_translations[e.player_index]
			label.visible = true
		else
			textfield.text = state.entity_data.name or ""
			textfield.visible = true
			textfield.focus()
			label.visible = false
		end
	elseif msg.action == "update_name" then
		state.entity_data.name = e.text ~= "" and e.text or nil
	elseif msg.action == "teleport" then
		-- get info
		local destination_number = gui.get_tags(e.element).number
		local destination_info = global.planetary_teleporters[destination_number]
		if destination_info then
			local destination_entity = global.planetary_teleporters[destination_number].entity
			local source_entity = state.entity
			-- close GUI
			refs.window.destroy()
			global.planetary_teleporter_guis[e.player_index] = nil
			-- teleport player
			teleport_player(player, source_entity, destination_entity)
		else
			player.create_local_flying_text{
				text = {"gui.kr-planetary-teleporter-invalid"},
				create_at_cursor = true
			}
			player.play_sound{
				path = "utility/cannot_build"
			}
			update_destinations_table(refs, state)
		end
	end
end

local function create_gui(player, entity)
	local entity_data = global.planetary_teleporters[entity.unit_number]
	local refs = gui.build(player.gui.screen, {
		{
			type = "frame",
			direction = "vertical",
			ref = {"window"},
			actions = {
				on_closed = {gui = "planetary_teleporter", action = "close"}
			},
			children = {
				-- titlebar
				{type = "flow", ref = {"titlebar_flow"}, children = {
					{
						type = "label",
						style = "frame_title",
						caption = {"entity-name.kr-planetary-teleporter"},
						ignored_by_interaction = true
					},
					{type = "empty-widget", style = "kr-title-draggable-space", ignored_by_interaction = true},
					{
						type = "textfield",
						style_mods = {top_margin = -3, right_margin = 4},
						visible = false,
						ref = {"search_textfield"},
						actions = {
							on_text_changed = {gui = "planetary_teleporter", action = "update_search_query"}
						}
					},
					{
						type = "sprite-button",
						style = "frame_action_button",
						sprite = "utility/search_white",
						hovered_sprite = "utility/search_black",
						clicked_sprite = "utility/search_black",
						tooltip = {"gui.kr-planetary-teleporter-search-tooltip"},
						ref = {"search_button"},
						actions = {
							on_click = {gui = "planetary_teleporter", action = "toggle_search"}
						}
					},
					{
						type = "sprite-button",
						style = "frame_action_button",
						style_mods = {left_margin = 4},
						sprite = "utility/close_white",
						hovered_sprite = "utility/close_black",
						clicked_sprite = "utility/close_black",
						actions = {
							on_click = {gui = "planetary_teleporter", action = "close"}
						}
					}
				}},
				-- content frame
				{type = "frame", style = "inside_shallow_frame", direction = "vertical", children = {
					-- toolbar
					{type = "frame", style = "subheader_frame", ref = {"toolbar"}, children = {
						{
							type = "label",
							style = "subheader_caption_label",
							caption = entity_data.name or global.planetary_teleporter_unnamed_translations[player.index],
							ref = {"name_label"}
						},
						{
							type = "textfield",
							visible = false,
							ref = {"name_textfield"},
							actions = {
								on_confirmed = {gui = "planetary_teleporter", action = "toggle_rename"},
								on_text_changed = {gui = "planetary_teleporter", action = "update_name"}
							}
						},
						{
							type = "sprite-button",
							style = "mini_button_aligned_to_text_vertically_when_centered",
							sprite = "utility/rename_icon_small_black",
							tooltip = {"gui.kr-planetary-teleporter-rename-tooltip"},
							actions = {
								on_click = {gui = "planetary_teleporter", action = "toggle_rename"}
							}
						},
						{type = "empty-widget", style_mods = {horizontally_stretchable = true}},
						{
							type = "label",
							name = "low_power_label",
							style = "bold_label",
							style_mods = {right_padding = 8},
							visible = false,
							caption = {"", "[img=utility/warning_white] ", {"gui.kr-planetary-teleporter-low-power"}}
						}
					}},
					{type = "flow", style_mods = {padding = 12, vertical_spacing = 8}, direction = "vertical", children = {
						-- entity status line
						{type = "flow", style = "status_flow", style_mods = {vertical_align = "center"}, children = {
							{type = "sprite", style = "status_image", ref = {"status_image"}},
							{type = "label", ref = {"status_label"}}
						}},
						-- entity preview
						{type = "frame", style = "deep_frame_in_shallow_frame", children = {
							{type = "entity-preview", style = "wide_entity_button", elem_mods = {entity = entity}}
						}},
					}},
					-- destinations table
					{type = "scroll-pane", style = "kr_planetary_teleporter_destinations_scroll_pane", children = {
						{type = "frame", style = "kr_planetary_teleporter_destinations_frame", direction = "vertical", children = {
							-- warning frame
							{type = "frame", style = "negative_subheader_frame", ref = {"no_destinations_frame"}, children = {
								{type = "empty-widget", style_mods = {horizontally_stretchable = true}},
								{
									type = "label",
									style = "bold_label",
									caption = {"", "[img=utility/warning_white] ", {"gui.kr-planetary-teleporter-no-destinations-found"}}
								},
								{type = "empty-widget", style_mods = {horizontally_stretchable = true}},
							}},
							-- destinations
							{type = "table", style = "slot_table", column_count = 3, ref = {"destinations_table"}}
						}}
					}}
				}}
			}
		}
	})

	refs.titlebar_flow.drag_target = refs.window
	refs.window.force_auto_center()

	player.opened = refs.window

	local gui_data = {
		refs = refs,
		state = {
			entity = entity,
			entity_data = entity_data,
			fully_charged = entity.status == defines.entity_status.fully_charged,
			player = player,
			search_query = ""
		}
	}

	global.planetary_teleporter_guis[player.index] = gui_data

	update_destinations_table(gui_data.refs, gui_data.state)
	update_fully_charged(gui_data.refs, gui_data.state)
end

-- EVENT HANDLERS

local function init_global_data()
	if not global.planetary_teleporters then
		global.planetary_teleporters = {}
	end
	if not global.planetary_teleporter_guis then
		global.planetary_teleporter_guis = {}
	end
	if not global.planetary_teleporter_unnamed_translations then
		global.planetary_teleporter_unnamed_translations = {}
	end
	for _, player in pairs(game.players) do
		player.request_translation{"gui.kr-planetary-teleporter-unnamed"}
	end
end

local function on_entity_built(e)
	local entity = e.created_entity
	if entity and entity.valid and entity.name == pt_entity_name then
		-- if revived from a blueprint and it has a name, get it from the tags
		local name = e.tags and e.tags.kr_planetary_teleporter_name or nil
		global.planetary_teleporters[entity.unit_number] = {
			entity = entity,
			force = entity.force,
			name = name,
			position = entity.position,
			surface = entity.surface
		}
	end
end

local function on_entity_destroyed(e)
	local entity = e.entity
	if entity and entity.valid then
		-- remove from list
		global.planetary_teleporters[entity.unit_number] = nil
		-- close any open GUIs
		for _, gui_data in pairs(global.planetary_teleporter_guis) do
			if gui_data.state.entity.unit_number == entity.unit_number then
				handle_gui_action({action = "close"}, {player_index = gui_data.state.player.index})
			end
		end
	end
end

local function on_gui_opened(e)
	local entity = e.entity
	if entity and entity.valid and entity.name == pt_entity_name then
		local player = game.get_player(e.player_index)
		create_gui(player, entity)
	end
end

local function on_gui_event(e)
	local msg = gui.read_action(e)
	if msg and msg.gui == "planetary_teleporter" then
		handle_gui_action(msg, e)
	end
end

local function on_focus_search(e)
	local gui_data = global.planetary_teleporter_guis[e.player_index]
	if gui_data then
		handle_gui_action({action = "toggle_search"}, e)
	end
end

local function on_player_created(e)
	game.get_player(e.player_index).request_translation{"gui.kr-planetary-teleporter-unnamed"}
end

local function on_player_removed(e)
	global.planetary_teleporter_unnamed_translations[e.player_index] = nil
	global.planetary_teleporter_guis[e.player_index] = nil
end

local function on_string_translated(e)
	local localised_string = e.localised_string
	if type(localised_string) == "table" and localised_string[1] == "gui.kr-planetary-teleporter-unnamed" then
		-- sometimes the translation might fail - in that case, use the english
		global.planetary_teleporter_unnamed_translations[e.player_index] = e.translated and e.result or "<Unnamed>"
	end
end

local function on_player_setup_blueprint(e)
	local player = game.get_player(e.player_index)

	-- get blueprint
	local bp = player.blueprint_to_setup
	if not bp or not bp.valid_for_read then
		bp = player.cursor_stack
	end

	-- get blueprint entities and mapping
	local entities = bp.get_blueprint_entities()
	if not entities then return end
	local mapping = e.mapping.get()

	-- find any planetary teleporters in this blueprint
	for i, bp_entity in ipairs(entities) do
		if bp_entity.name == pt_entity_name then
			local entity = mapping[i]
			if entity and entity.valid then
				local name = global.planetary_teleporters[entity.unit_number].name
				if name then
					bp.set_blueprint_entity_tag(i, "kr_planetary_teleporter_name", name)
				end
			end
		end
	end
end

return {
	-- bootstrap
	{init_global_data, "on_init"},
	{init_global_data, "on_configuration_changed"},
	-- built
	{on_entity_built, "on_built_entity", pt_built_entity_filters},
	{on_entity_built, "on_robot_built_entity", pt_built_entity_filters},
	{on_entity_built, "script_raised_built"},
	{on_entity_built, "script_raised_revive"},
	-- destroyed
	{on_entity_destroyed, "on_player_mined_entity", pt_built_entity_filters},
	{on_entity_destroyed, "on_robot_mined_entity", pt_built_entity_filters},
	{on_entity_destroyed, "on_entity_died", pt_built_entity_filters},
	{on_entity_destroyed, "script_raised_destroy", pt_built_entity_filters},
	-- gui
	{on_focus_search, "kr-focus-search"},
	{on_gui_event, "on_gui_click"},
	{on_gui_event, "on_gui_closed"},
	{on_gui_event, "on_gui_confirmed"},
	{on_gui_event, "on_gui_text_changed"},
	{on_gui_opened, "on_gui_opened"},
	{update_gui_statuses, "on_tick"},
	-- player
	{on_player_created, "on_player_created"},
	{on_player_removed, "on_player_removed"},
	{on_string_translated, "on_string_translated"},
	-- blueprint
	{on_player_setup_blueprint, "on_player_setup_blueprint"}
}
